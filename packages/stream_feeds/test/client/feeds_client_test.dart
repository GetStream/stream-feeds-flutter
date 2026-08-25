import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Connection Management
  // ============================================================

  group('connect', () {
    feedsClientTest(
      'should connect successfully',
      connect: (tester) => tester.mockSuccessfulAuth(tester.user.id),
      body: (tester) async {
        // Setup expectation for connection state transitions
        final connectionStateExpectation = expectLater(
          tester.client.connectionState,
          emitsInOrder([
            isA<Initialized>(),
            isA<Connecting>(),
            isA<Authenticating>(),
            isA<Connected>(),
          ]),
        );

        // Connect the client
        await tester.client.connect();
        addTearDown(tester.client.disconnect);

        // Verify state transitions expectation
        await connectionStateExpectation;
      },
    );

    feedsClientTest(
      'should handle connection failure',
      connect: (tester) => tester.mockFailedAuth(errorCode: 41),
      body: (tester) async {
        // Setup expectation for connection state transitions
        final connectionStateExpectation = expectLater(
          tester.client.connectionState,
          emitsInOrder([
            isA<Initialized>(),
            isA<Connecting>(),
            isA<Authenticating>(),
            isA<Disconnecting>(),
            isA<Disconnected>(),
          ]),
        );

        // Attempt connection - should fail
        await expectLater(tester.client.connect(), throwsA(isA<ClientException>()));

        // Verify state transitions expectation
        await connectionStateExpectation;
      },
    );

    feedsClientTest(
      'should not open a WebSocket when asked not to',
      connect: (tester) => addTearDown(tester.client.dispose),
      body: (tester) async {
        await tester.client.connect(connectWebSocket: false);

        // Verify no socket was opened
        expect(tester.client.connectionState.value, isA<Initialized>());
      },
    );
  });

  group('token rejected by the server', () {
    var tokenLoads = 0;

    Object connectionError() => {
      'type': 'connection.error',
      'connection_id': 'test-connection-id',
      'created_at': DateTime.timestamp().millisecondsSinceEpoch,
      'error': {
        // 40 = the token expired, the one refusal another token repairs.
        'code': 40,
        'message': 'token expired',
        'StatusCode': 401,
        'details': <int>[],
        'duration': '0ms',
        'more_info': '',
      },
    };

    feedsClientTest(
      'stays closed when the provider has no other token to give',
      connect: (tester) async {
        // The default provider is static, as a guest's is.
        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        final states = <WebSocketConnectionState>[];
        final subscription = tester.client.connectionState.listen(states.add);
        addTearDown(subscription.cancel);

        await tester.emitEvent(connectionError());
        await tester.pumpEventQueue();

        // Reconnecting presents the token again, so the attempt is declined rather than made — and
        // an authentication failure is not retried, which is what stops the backoff from offering
        // the refused token for the life of the client.
        expect(
          tester.client.connectionState.value,
          isA<Disconnected>().having((it) => it.source, 'source', isA<AuthenticationFailed>()),
        );
        expect(states.whereType<Connecting>(), hasLength(1));
      },
    );

    feedsClientTest(
      'fails the connection with the error the server sent',
      connect: (tester) {
        tester.mockFailedAuth();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        await expectLater(
          tester.client.connect(),
          throwsA(isA<ClientException>().having((it) => it.apiError?.code, 'apiError.code', 40)),
        );
      },
    );

    feedsClientTest(
      'is kept when the server closed for a reason other than the token',
      tokenProvider: TokenProvider.dynamic((userId) async {
        tokenLoads++;
        return generateTestUserToken(userId);
      }),
      connect: (tester) async {
        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        tokenLoads = 0;

        // A server error that says nothing about the token, and is retried like
        // any other. Dropping the token here would send the reconnect to the
        // provider for one that was never refused.
        await tester.emitEvent({
          'type': 'connection.error',
          'connection_id': 'test-connection-id',
          'created_at': DateTime.timestamp().millisecondsSinceEpoch,
          'error': {
            'code': 5, // internal error
            'message': 'something went wrong',
            'StatusCode': 500,
            'details': <int>[],
            'duration': '0ms',
            'more_info': '',
          },
        });
        await tester.pumpEventQueue();

        expect(tester.client.connectionState.value, isA<Connected>());
        expect(tokenLoads, 0);
      },
    );

    feedsClientTest(
      'is kept when a disconnect was not about it',
      tokenProvider: TokenProvider.dynamic((userId) async {
        tokenLoads++;
        return generateTestUserToken(userId);
      }),
      connect: (tester) async {
        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        tokenLoads = 0;

        // A deliberate disconnect says nothing about the token, and neither does
        // a network drop. Dropping it here would send every reconnect to the
        // provider for a token that was never refused.
        await tester.client.disconnect();
        await tester.client.connect();

        expect(tester.client.connectionState.value, isA<Connected>());
        expect(tokenLoads, 0);
      },
    );

    feedsClientTest(
      'is dropped on a live connection, which comes back with a fresh one',
      tokenProvider: TokenProvider.dynamic((userId) async {
        tokenLoads++;
        return generateTestUserToken(userId);
      }),
      connect: (tester) async {
        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        tokenLoads = 0;
        final states = <WebSocketConnectionState>[];
        final subscription = tester.client.connectionState.listen(states.add);
        addTearDown(subscription.cancel);

        // The server refuses the token of a connection that was working. These
        // test tokens name no expiry, so nothing could have seen it coming —
        // which is the case the client drops the cached token for.
        await tester.emitEvent(connectionError());
        await tester.pumpEventQueue();

        // Reconnecting is the recovery handler's, and the token it presents was
        // issued after the refusal. The app is told nothing and does nothing.
        expect(states.whereType<Connecting>(), hasLength(1));
        expect(tester.client.connectionState.value, isA<Connected>());
        expect(tokenLoads, 1);
      },
    );
  });

  group('credentials that never reached the server', () {
    feedsClientTest(
      'fails the connection when the frame carrying them could not be sent',
      connect: (tester) {
        tester.mockFailedSend();
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        // Ignored, this would sit in `Authenticating` until the connect timeout swept it up.
        await expectLater(
          tester.client.connect(),
          throwsA(isA<ClientException>()),
        );

        expect(
          tester.client.connectionState.value,
          isA<Disconnected>().having((it) => it.source, 'source', isA<AuthenticationFailed>()),
        );
      },
    );
  });

  group('token the provider could not issue', () {
    feedsClientTest(
      'fails the connection with the reason it could not be loaded',
      tokenProvider: TokenProvider.dynamic((_) async => throw Exception('token endpoint is down')),
      connect: (tester) {
        // Stubbed so the socket itself works: the only thing failing here is the token.
        tester.mockSuccessfulAuth(tester.user.id);
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        // Nothing was refused: the token was never made, so the frame never went out.
        await expectLater(
          tester.client.connect(),
          throwsA(
            isA<ClientException>().having(
              (it) => it.underlyingError,
              'cause',
              isA<Exception>().having((it) => '$it', 'message', contains('token endpoint is down')),
            ),
          ),
        );

        expect(
          tester.client.connectionState.value,
          isA<Disconnected>().having((it) => it.source, 'source', isA<AuthenticationFailed>()),
        );
      },
    );
  });

  group('disconnect', () {
    feedsClientTest(
      'should connect again, still emitting to a subscription taken before',
      connect: (tester) => addTearDown(tester.client.dispose),
      body: (tester) async {
        // Subscribed before the first connect, and never renewed: a reconnect
        // that rebuilds the event pipeline would leave this listener silent.
        final events = <StateUpdateEvent>[];
        final subscription = tester.client.stateUpdateEvents.listen(events.add);
        addTearDown(subscription.cancel);

        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
        await tester.client.disconnect();
        await tester.client.connect();

        expect(tester.client.connectionState.value, isA<Connected>());

        await tester.emitEvent(
          FeedDeletedEvent(
            type: EventTypes.feedDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
          ),
        );

        expect(events, isNotEmpty);
      },
    );

    feedsClientTest(
      'should refuse to connect once disposed',
      connect: (tester) async {
        tester.mockSuccessfulAuth(tester.user.id);
        await tester.client.connect();
      },
      body: (tester) async {
        await tester.client.dispose();

        // Matched on the message because a closed emitter raises a `StateError` of its own
        // further in, which would satisfy the type alone.
        expect(
          () => tester.client.connect(),
          throwsA(isA<StateError>().having((it) => it.message, 'message', contains('has been disposed'))),
        );

        // Disposing twice is a no-op rather than an error.
        await expectLater(tester.client.dispose(), completes);
      },
    );

    feedsClientTest(
      'should refuse to connect when a connection is already established',
      body: (tester) {
        // Told they asked for something they already have, rather than silently doing nothing.
        expect(
          () => tester.client.connect(),
          throwsA(isA<ClientException>().having((it) => it.message, 'message', contains('already available'))),
        );

        // The connection it already had is left alone.
        expect(tester.client.connectionState.value, isA<Connected>());
      },
    );

    feedsClientTest(
      'should refuse to connect while a connection is still being established',
      connect: (tester) {
        tester.mockSuccessfulAuth(tester.user.id);
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        final connecting = tester.client.connect();
        expect(tester.client.connectionState.value, isA<Connecting>());

        expect(
          () => tester.client.connect(),
          throwsA(isA<ClientException>().having((it) => it.message, 'message', contains('already in progress'))),
        );

        // The attempt already under way is the one that completes.
        await connecting;
        expect(tester.client.connectionState.value, isA<Connected>());
      },
    );

    feedsClientTest(
      'should disconnect successfully',
      body: (tester) async {
        // Setup expectation for disconnection state transitions
        final connectionStateExpectation = expectLater(
          tester.client.connectionState,
          emitsInOrder([
            isA<Connected>(),
            isA<Disconnecting>(),
            isA<Disconnected>(),
          ]),
        );

        // Disconnect
        await tester.client.disconnect();

        // Verify state transitions expectation
        await connectionStateExpectation;
      },
    );

    feedsClientTest(
      'leaves the emitters open where disposing closes them',
      body: (tester) async {
        await tester.client.disconnect();

        // A disconnected client is meant to be used again, so what a caller subscribed to
        // has to outlive the connection.
        expect(tester.client.events.isClosed, isFalse);
        expect(tester.client.stateUpdateEvents.isClosed, isFalse);

        await tester.client.dispose();

        expect(tester.client.events.isClosed, isTrue);
        expect(tester.client.stateUpdateEvents.isClosed, isTrue);
      },
    );

    feedsClientTest(
      'closes the connection it is holding when disposed',
      body: (tester) async {
        expect(tester.client.connectionState.value, isA<Connected>());

        await tester.client.dispose();

        // Nothing is left holding the socket open once its client is gone.
        expect(tester.client.connectionState.value, isA<Disconnected>());
      },
    );

    feedsClientTest(
      'is a no-op on a client that never connected',
      connect: (tester) => addTearDown(tester.client.dispose),
      body: (tester) async {
        await expectLater(tester.client.disconnect(), completes);

        // Nothing was ever opened, so there is no closure to report.
        expect(tester.client.connectionState.value, isA<Initialized>());
      },
    );

    feedsClientTest(
      'closes again when asked to on a connection already down',
      body: (tester) async {
        await tester.client.disconnect();

        final states = <WebSocketConnectionState>[];
        final subscription = tester.client.connectionState.listen(states.add);
        addTearDown(subscription.cancel);

        await tester.client.disconnect();

        // A close the caller asked for calls off a reconnection waiting to be made, so it
        // has to land even on a connection already down.
        expect(states.whereType<Disconnecting>(), hasLength(1));
        expect(tester.client.connectionState.value, isA<Disconnected>());
      },
    );

    feedsClientTest(
      'fails a connection that was still being established',
      connect: (tester) {
        tester.mockSuccessfulAuth(tester.user.id);
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        final connecting = tester.client.connect();
        expect(tester.client.connectionState.value, isA<Connecting>());

        await tester.client.disconnect();

        // Reported, rather than left waiting on a connection no longer coming.
        await expectLater(connecting, throwsA(isA<ClientException>()));
        expect(tester.client.connectionState.value, isA<Disconnected>());
      },
    );
  });

  // ============================================================
  // FEATURE: System Configuration
  // ============================================================

  group('updateSystemEnvironment', () {
    feedsClientTest(
      'should update system environment successfully',
      body: (tester) {
        const environment = SystemEnvironment(
          sdkName: 'my-app',
          sdkIdentifier: 'flutter',
          sdkVersion: '1.0.0',
        );

        // Should not throw
        expect(
          () => tester.client.updateSystemEnvironment(environment),
          returnsNormally,
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Batch Operations
  // ============================================================

  group('upsertActivities', () {
    feedsClientTest(
      'should upsert activities successfully',
      body: (tester) async {
        final activities = [
          const ActivityRequest(
            feeds: ['user:123'],
            id: '1',
            text: 'Hello World',
            type: 'post',
          ),
          const ActivityRequest(
            feeds: ['user:456'],
            id: '2',
            text: 'Another post',
            type: 'post',
          ),
        ];

        final request = UpsertActivitiesRequest(activities: activities);

        tester.mockApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
          result: createDefaultUpsertActivitiesResponse(count: 2),
        );

        final result = await tester.client.upsertActivities(
          activities: activities,
        );

        expect(result.isSuccess, isTrue);
        final data = result.getOrThrow();
        expect(data.length, equals(2));

        tester.verifyApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle upsert activities failure',
      body: (tester) async {
        final activities = [
          const ActivityRequest(
            feeds: ['user:123'],
            id: '1',
            text: 'Hello',
            type: 'post',
          ),
        ];

        final request = UpsertActivitiesRequest(activities: activities);

        tester.mockApiFailure(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
          error: Exception('Failed to upsert activities'),
        );

        final result = await tester.client.upsertActivities(
          activities: activities,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
        );
      },
    );
  });

  group('deleteActivities', () {
    feedsClientTest(
      'should delete activities successfully',
      body: (tester) async {
        final ids = ['activity-1', 'activity-2'];
        final request = DeleteActivitiesRequest(
          ids: ids,
          hardDelete: false,
        );

        tester.mockApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
          result: createDefaultDeleteActivitiesResponse(ids: ids),
        );

        final result = await tester.client.deleteActivities(
          ids: ids,
          hardDelete: false,
        );

        expect(result.isSuccess, isTrue);
        final response = result.getOrThrow();
        expect(response.duration, isNotEmpty);

        tester.verifyApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle delete activities failure',
      body: (tester) async {
        final ids = ['activity-1'];
        final request = DeleteActivitiesRequest(
          ids: ids,
          hardDelete: true,
        );

        tester.mockApiFailure(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
          error: Exception('Failed to delete activities'),
        );

        final result = await tester.client.deleteActivities(
          ids: ids,
          hardDelete: true,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: App Operations
  // ============================================================

  group('getApp', () {
    feedsClientTest(
      'should get app data successfully',
      body: (tester) async {
        tester.mockApi(
          (api) => api.getApp(),
          result: createDefaultGetApplicationResponse(),
        );

        final result = await tester.client.getApp();

        expect(result.isSuccess, isTrue);
        final appData = result.getOrThrow();
        expect(appData.name, isNotEmpty);

        tester.verifyApi((api) => api.getApp());
      },
    );

    feedsClientTest(
      'should handle get app failure',
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.getApp(),
          error: Exception('Failed to get app data'),
        );

        final result = await tester.client.getApp();

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.getApp());
      },
    );
  });

  // ============================================================
  // FEATURE: Device Operations
  // ============================================================

  group('queryDevices', () {
    feedsClientTest(
      'should query devices successfully',
      body: (tester) async {
        tester.mockApi(
          (api) => api.listDevices(),
          result: createDefaultListDevicesResponse(),
        );

        final result = await tester.client.queryDevices();

        expect(result.isSuccess, isTrue);
        final response = result.getOrThrow();
        expect(response.duration, isNotEmpty);

        tester.verifyApi((api) => api.listDevices());
      },
    );

    feedsClientTest(
      'should handle query devices failure',
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.listDevices(),
          error: Exception('Failed to query devices'),
        );

        final result = await tester.client.queryDevices();

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.listDevices());
      },
    );
  });

  group('createDevice', () {
    feedsClientTest(
      'should create device successfully',
      body: (tester) async {
        const deviceId = 'firebase-token-123';
        const pushProvider = PushNotificationsProvider.firebase;
        const pushProviderName = 'MyApp Firebase';

        const request = CreateDeviceRequest(
          id: deviceId,
          pushProvider: CreateDeviceRequestPushProvider.firebase,
          pushProviderName: pushProviderName,
        );

        tester.mockApi(
          (api) => api.createDevice(createDeviceRequest: request),
          result: createDefaultCreateDeviceResponse(),
        );

        final result = await tester.client.createDevice(
          id: deviceId,
          pushProvider: pushProvider,
          pushProviderName: pushProviderName,
        );

        expect(result.isSuccess, isTrue);

        tester.verifyApi(
          (api) => api.createDevice(createDeviceRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle create device failure',
      body: (tester) async {
        const deviceId = 'invalid-token';
        const pushProvider = PushNotificationsProvider.apn;
        const pushProviderName = 'MyApp APN';

        const request = CreateDeviceRequest(
          id: deviceId,
          pushProvider: CreateDeviceRequestPushProvider.apn,
          pushProviderName: pushProviderName,
        );

        tester.mockApiFailure(
          (api) => api.createDevice(createDeviceRequest: request),
          error: Exception('Failed to create device'),
        );

        final result = await tester.client.createDevice(
          id: deviceId,
          pushProvider: pushProvider,
          pushProviderName: pushProviderName,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.createDevice(createDeviceRequest: request),
        );
      },
    );
  });

  group('deleteDevice', () {
    feedsClientTest(
      'should delete device successfully',
      body: (tester) async {
        const deviceId = 'firebase-token-123';

        tester.mockApi(
          (api) => api.deleteDevice(id: deviceId),
          result: createDefaultDeleteDeviceResponse(),
        );

        final result = await tester.client.deleteDevice(id: deviceId);

        expect(result.isSuccess, isTrue);

        tester.verifyApi((api) => api.deleteDevice(id: deviceId));
      },
    );

    feedsClientTest(
      'should handle delete device failure',
      body: (tester) async {
        const deviceId = 'invalid-device';

        tester.mockApiFailure(
          (api) => api.deleteDevice(id: deviceId),
          error: Exception('Device not found'),
        );

        final result = await tester.client.deleteDevice(id: deviceId);

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.deleteDevice(id: deviceId));
      },
    );
  });

  // ============================================================
  // FEATURE: CDN Operations
  // ============================================================

  group('deleteFile', () {
    feedsClientTest(
      'should delete file successfully',
      body: (tester) async {
        const fileUrl = 'https://cdn.example.com/files/document.pdf';

        tester.mockCdn(
          (cdn) => cdn.deleteFile(url: fileUrl),
          result: const DurationResponse(duration: '10ms'),
        );

        final result = await tester.client.deleteFile(url: fileUrl);

        expect(result.isSuccess, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteFile(url: fileUrl));
      },
    );

    feedsClientTest(
      'should handle delete file failure',
      body: (tester) async {
        const fileUrl = 'https://cdn.example.com/files/missing.pdf';

        tester.mockCdnFailure(
          (cdn) => cdn.deleteFile(url: fileUrl),
          error: Exception('File not found'),
        );

        final result = await tester.client.deleteFile(url: fileUrl);

        expect(result.isFailure, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteFile(url: fileUrl));
      },
    );
  });

  group('deleteImage', () {
    feedsClientTest(
      'should delete image successfully',
      body: (tester) async {
        const imageUrl = 'https://cdn.example.com/images/photo.jpg';

        tester.mockCdn(
          (cdn) => cdn.deleteImage(url: imageUrl),
          result: const DurationResponse(duration: '10ms'),
        );

        final result = await tester.client.deleteImage(url: imageUrl);

        expect(result.isSuccess, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteImage(url: imageUrl));
      },
    );

    feedsClientTest(
      'should handle delete image failure',
      body: (tester) async {
        const imageUrl = 'https://cdn.example.com/images/missing.jpg';

        tester.mockCdnFailure(
          (cdn) => cdn.deleteImage(url: imageUrl),
          error: Exception('Image not found'),
        );

        final result = await tester.client.deleteImage(url: imageUrl);

        expect(result.isFailure, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteImage(url: imageUrl));
      },
    );
  });

  // ============================================================
  // FEATURE: Batch Follow Operations
  // ============================================================

  group('getOrCreateFollows', () {
    feedsClientTest(
      'should get or create follows successfully',
      body: (tester) async {
        const johnFid = FeedId.user('john');
        const janeFid = FeedId.user('jane');
        const bobFid = FeedId.user('bob');

        final request = FollowBatchRequest(
          follows: [
            FollowRequest(
              source: johnFid.rawValue,
              target: janeFid.rawValue,
            ),
            FollowRequest(
              source: johnFid.rawValue,
              target: bobFid.rawValue,
            ),
          ],
        );

        final createdFollow = createDefaultFollowResponse(
          sourceId: johnFid.id,
          targetId: janeFid.id,
        );
        final existingFollow = createDefaultFollowResponse(
          sourceId: johnFid.id,
          targetId: bobFid.id,
        );

        final response = createDefaultFollowBatchResponse(
          created: [createdFollow],
          follows: [createdFollow, existingFollow],
        );

        tester.mockApi(
          (api) => api.getOrCreateFollows(followBatchRequest: request),
          result: response,
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowBatchUpdate>()),
        );

        final result = await tester.client.getOrCreateFollows(request);

        expect(result.isSuccess, isTrue);
        final batchFollowData = result.getOrThrow();
        expect(batchFollowData.created.length, equals(1));
        expect(batchFollowData.follows.length, equals(2));
        expect(batchFollowData.created[0].targetFeed.fid.id, equals('jane'));
        expect(batchFollowData.follows[0].targetFeed.fid.id, equals('jane'));
        expect(batchFollowData.follows[1].targetFeed.fid.id, equals('bob'));

        // Verify the event is emitted
        await expectEventEmitted;

        tester.verifyApi(
          (api) => api.getOrCreateFollows(followBatchRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle get or create follows failure',
      body: (tester) async {
        const johnFid = FeedId.user('john');
        const janeFid = FeedId.user('jane');

        final request = FollowBatchRequest(
          follows: [
            FollowRequest(
              source: johnFid.rawValue,
              target: janeFid.rawValue,
            ),
          ],
        );

        tester.mockApiFailure(
          (api) => api.getOrCreateFollows(followBatchRequest: request),
          error: Exception('Failed to get or create follows'),
        );

        final result = await tester.client.getOrCreateFollows(request);

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.getOrCreateFollows(followBatchRequest: request),
        );
      },
    );
  });

  group('getOrCreateUnfollows', () {
    feedsClientTest(
      'should get or create unfollows successfully',
      body: (tester) async {
        const johnFid = FeedId.user('john');
        const janeFid = FeedId.user('jane');
        const bobFid = FeedId.user('bob');

        final request = UnfollowBatchRequest(
          follows: [
            UnfollowPair(
              source: johnFid.rawValue,
              target: janeFid.rawValue,
            ),
            UnfollowPair(
              source: johnFid.rawValue,
              target: bobFid.rawValue,
            ),
          ],
        );

        final unfollowedFollow1 = createDefaultFollowResponse(
          sourceId: johnFid.id,
          targetId: janeFid.id,
        );
        final unfollowedFollow2 = createDefaultFollowResponse(
          sourceId: johnFid.id,
          targetId: bobFid.id,
        );

        final response = createDefaultUnfollowBatchResponse(
          follows: [unfollowedFollow1, unfollowedFollow2],
        );

        tester.mockApi(
          (api) => api.getOrCreateUnfollows(unfollowBatchRequest: request),
          result: response,
        );

        final expectEventEmitted = expectLater(
          tester.client.stateUpdateEvents,
          emits(isA<FollowBatchUpdate>()),
        );

        final result = await tester.client.getOrCreateUnfollows(request);

        expect(result.isSuccess, isTrue);
        final unfollowedFollows = result.getOrThrow();
        expect(unfollowedFollows.length, equals(2));
        expect(unfollowedFollows[0].targetFeed.fid.id, equals('jane'));
        expect(unfollowedFollows[1].targetFeed.fid.id, equals('bob'));

        // Verify the event is emitted
        await expectEventEmitted;

        tester.verifyApi(
          (api) => api.getOrCreateUnfollows(unfollowBatchRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle get or create unfollows failure',
      body: (tester) async {
        const johnFid = FeedId.user('john');
        const janeFid = FeedId.user('jane');

        final request = UnfollowBatchRequest(
          follows: [
            UnfollowPair(
              source: johnFid.rawValue,
              target: janeFid.rawValue,
            ),
          ],
        );

        tester.mockApiFailure(
          (api) => api.getOrCreateUnfollows(unfollowBatchRequest: request),
          error: Exception('Failed to get or create unfollows'),
        );

        final result = await tester.client.getOrCreateUnfollows(request);

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.getOrCreateUnfollows(unfollowBatchRequest: request),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Collections Operations
  // ============================================================

  group('readCollections', () {
    feedsClientTest(
      'should read collections successfully',
      body: (tester) async {
        const refs = ['collection:123', 'collection:456'];

        final collection1 = createDefaultCollectionResponse(
          id: '123',
          name: 'collection_1',
        );
        final collection2 = createDefaultCollectionResponse(
          id: '456',
          name: 'collection_2',
        );

        final response = createDefaultReadCollectionsResponse(
          collections: [collection1, collection2],
        );

        tester.mockApi(
          (api) => api.readCollections(collectionRefs: refs),
          result: response,
        );

        final result = await tester.client.readCollections(refs: refs);

        expect(result.isSuccess, isTrue);
        final readResponse = result.getOrThrow();
        expect(readResponse.collections.length, equals(2));
        expect(readResponse.collections[0].id, equals('123'));
        expect(readResponse.collections[1].id, equals('456'));

        tester.verifyApi((api) => api.readCollections(collectionRefs: refs));
      },
    );

    feedsClientTest(
      'should handle read collections failure',
      body: (tester) async {
        const refs = ['collection:invalid'];

        tester.mockApiFailure(
          (api) => api.readCollections(collectionRefs: refs),
          error: Exception('Failed to read collections'),
        );

        final result = await tester.client.readCollections(refs: refs);

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.readCollections(collectionRefs: refs));
      },
    );
  });

  group('createCollections', () {
    feedsClientTest(
      'should create collections successfully',
      body: (tester) async {
        const request = CreateCollectionsRequest(
          collections: [
            CollectionRequest(
              id: '123',
              name: 'my_new_collection',
              custom: {'key': 'value'},
            ),
          ],
        );

        final collection = createDefaultCollectionResponse(
          id: '123',
          name: 'my_new_collection',
        );

        final response = createDefaultCreateCollectionsResponse(
          collections: [collection],
        );

        tester.mockApi(
          (api) => api.createCollections(createCollectionsRequest: request),
          result: response,
        );

        final result = await tester.client.createCollections(request: request);

        expect(result.isSuccess, isTrue);
        final createResponse = result.getOrThrow();
        expect(createResponse.collections.length, equals(1));
        expect(createResponse.collections[0].id, equals('123'));
        expect(createResponse.collections[0].name, equals('my_new_collection'));

        tester.verifyApi(
          (api) => api.createCollections(createCollectionsRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle create collections failure',
      body: (tester) async {
        const request = CreateCollectionsRequest(
          collections: [
            CollectionRequest(
              id: 'invalid',
              name: 'invalid_collection',
              custom: {},
            ),
          ],
        );

        tester.mockApiFailure(
          (api) => api.createCollections(createCollectionsRequest: request),
          error: Exception('Failed to create collections'),
        );

        final result = await tester.client.createCollections(request: request);

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.createCollections(createCollectionsRequest: request),
        );
      },
    );
  });

  group('updateCollections', () {
    feedsClientTest(
      'should update collections successfully',
      body: (tester) async {
        const request = UpdateCollectionsRequest(
          collections: [
            UpdateCollectionRequest(
              id: '123',
              name: 'my_new_collection',
              custom: {'updated_key': 'updated_value'},
            ),
          ],
        );

        final collection = createDefaultCollectionResponse(
          id: '123',
          name: 'my_new_collection',
        );

        final response = createDefaultUpdateCollectionsResponse(
          collections: [collection],
        );

        tester.mockApi(
          (api) => api.updateCollections(updateCollectionsRequest: request),
          result: response,
        );

        final result = await tester.client.updateCollections(request: request);

        expect(result.isSuccess, isTrue);
        final updateResponse = result.getOrThrow();
        expect(updateResponse.collections.length, equals(1));
        expect(updateResponse.collections[0].id, equals('123'));

        tester.verifyApi(
          (api) => api.updateCollections(updateCollectionsRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle update collections failure',
      body: (tester) async {
        const request = UpdateCollectionsRequest(
          collections: [
            UpdateCollectionRequest(
              id: 'invalid',
              name: 'invalid_collection',
              custom: {},
            ),
          ],
        );

        tester.mockApiFailure(
          (api) => api.updateCollections(updateCollectionsRequest: request),
          error: Exception('Failed to update collections'),
        );

        final result = await tester.client.updateCollections(request: request);

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.updateCollections(updateCollectionsRequest: request),
        );
      },
    );
  });

  group('deleteCollections', () {
    feedsClientTest(
      'should delete collections successfully',
      body: (tester) async {
        const refs = ['collection:123', 'collection:456'];

        final response = createDefaultDeleteCollectionsResponse();

        tester.mockApi(
          (api) => api.deleteCollections(collectionRefs: refs),
          result: response,
        );

        final result = await tester.client.deleteCollections(refs: refs);

        expect(result.isSuccess, isTrue);
        final deleteResponse = result.getOrThrow();
        expect(deleteResponse.duration, isNotEmpty);

        tester.verifyApi((api) => api.deleteCollections(collectionRefs: refs));
      },
    );

    feedsClientTest(
      'should handle delete collections failure',
      body: (tester) async {
        const refs = ['collection:invalid'];

        tester.mockApiFailure(
          (api) => api.deleteCollections(collectionRefs: refs),
          error: Exception('Failed to delete collections'),
        );

        final result = await tester.client.deleteCollections(refs: refs);

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.deleteCollections(collectionRefs: refs));
      },
    );
  });

  // ============================================================
  // FEATURE: Guest User Authentication
  // ============================================================

  group('connect as anonymous user', () {
    feedsClientTest(
      'opens no WebSocket, even when one is asked for',
      user: const User.anonymous(),
      connect: (tester) => addTearDown(tester.client.dispose),
      body: (tester) async {
        // An anonymous user has no token to authenticate a socket with, so asking for
        // one cannot produce it. Requests carry their own credentials regardless.
        //
        // ignore: avoid_redundant_argument_values, asking explicitly is what is tested
        await tester.client.connect(connectWebSocket: true);

        expect(tester.client.connectionState.value, isA<Initialized>());
        expect(tester.client.user.id, User.anonymousUserId);
      },
    );

    feedsClientTest(
      'can be disposed without ever having connected',
      user: const User.anonymous(),
      connect: (_) {},
      body: (tester) async {
        // Nothing was ever subscribed or opened, so there is nothing to release.
        await expectLater(tester.client.dispose(), completes);
      },
    );
  });

  group('connect as guest user', () {
    feedsClientTest(
      'should connect a guest user using the createGuest token flow',
      user: const User.guest('guest-123'),
      connect: (tester) async {
        tester.mockApi(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(
              user: UserRequest(id: 'guest-123'),
            ),
          ),
          // The server may assign another id, so the mock differs from the request
          result: CreateGuestResponse(
            accessToken: generateTestUserToken('guest-123-xyz').rawValue,
            duration: '10ms',
            user: createDefaultUserResponse(
              id: 'guest-123-xyz',
              role: 'guest',
            ),
          ),
        );
        tester.mockSuccessfulAuth('guest-123-xyz');
        await tester.client.connect();
        addTearDown(tester.client.dispose);
      },
      body: (tester) {
        expect(
          tester.client.connectionState.value,
          isA<Connected>(),
        );

        // Verify the server-assigned identity is adopted
        expect(tester.client.user.id, 'guest-123-xyz');
        expect(tester.client.user.type, UserType.guest);
      },
    );

    feedsClientTest(
      'should fail to connect a guest user when the createGuest call fails',
      user: const User.guest('guest-123'),
      connect: (tester) {
        tester.mockApiFailure(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(
              user: UserRequest(id: 'guest-123'),
            ),
          ),
          error: Exception('Failed to create guest'),
        );
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        await expectLater(
          tester.client.connect(),
          throwsA(
            isA<ClientException>()
                .having((it) => it.message, 'message', 'Failed to create a guest user')
                .having((it) => it.underlyingError, 'cause', isException),
          ),
        );

        // Verify no socket was opened
        expect(tester.client.connectionState.value, isA<Initialized>());

        // Verify the requested identity is kept
        expect(tester.client.user.id, 'guest-123');
      },
    );

    feedsClientTest(
      'should create a guest user without opening a WebSocket when asked not to',
      user: const User.guest('guest-123'),
      connect: (tester) {
        tester.mockApi(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(user: UserRequest(id: 'guest-123')),
          ),
          result: CreateGuestResponse(
            accessToken: generateTestUserToken('guest-123-xyz').rawValue,
            duration: '10ms',
            user: createDefaultUserResponse(id: 'guest-123-xyz', role: 'guest'),
          ),
        );
        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        await tester.client.connect(connectWebSocket: false);

        // Verify the guest identity is adopted without a socket
        expect(tester.client.user.id, 'guest-123-xyz');
        expect(tester.client.connectionState.value, isA<Initialized>());

        tester.verifyApi(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(user: UserRequest(id: 'guest-123')),
          ),
        );

        // Opening a socket afterwards keeps that identity: the exchange runs once, even though this
        // client never authenticated one.
        tester.mockSuccessfulAuth('guest-123-xyz');
        await tester.client.connect();

        expect(tester.client.connectionState.value, isA<Connected>());
        // A second exchange would ask with the adopted profile, which nothing here answers, so this
        // connect would fail rather than quietly mint another guest.
        expect(tester.client.user.id, 'guest-123-xyz');
      },
    );

    feedsClientTest(
      'should connect a guest user on a retry after a failed createGuest call',
      user: const User.guest('guest-123'),
      connect: (tester) async {
        tester.mockApiFailure(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(user: UserRequest(id: 'guest-123')),
          ),
          error: Exception('Failed to create guest'),
        );

        await expectLater(tester.client.connect(), throwsA(isA<ClientException>()));

        addTearDown(tester.client.dispose);
      },
      body: (tester) async {
        tester.mockApi(
          (api) => api.createGuest(
            createGuestRequest: const CreateGuestRequest(user: UserRequest(id: 'guest-123')),
          ),
          result: CreateGuestResponse(
            accessToken: generateTestUserToken('guest-123-xyz').rawValue,
            duration: '10ms',
            user: createDefaultUserResponse(id: 'guest-123-xyz', role: 'guest'),
          ),
        );
        tester.mockSuccessfulAuth('guest-123-xyz');

        // The failed attempt left nothing behind, so the exchange runs again
        await tester.client.connect();

        expect(tester.client.connectionState.value, isA<Connected>());
        expect(tester.client.user.id, 'guest-123-xyz');
      },
    );
  });
}

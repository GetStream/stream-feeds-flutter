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
        await expectLater(
          tester.client.connect(),
          throwsA(isA<ClientException>()),
        );

        // Verify state transitions expectation
        await connectionStateExpectation;
      },
    );
  });

  group('disconnect', () {
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
    setUpAll(() {
      registerFallbackValue(const UpsertActivitiesRequest(activities: []));
    });

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
    setUpAll(() {
      registerFallbackValue(const DeleteActivitiesRequest(ids: []));
    });

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
    setUpAll(() {
      registerFallbackValue(
        const CreateDeviceRequest(
          id: 'fallback',
          pushProvider: CreateDeviceRequestPushProvider.firebase,
        ),
      );
    });

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
    setUpAll(() {
      registerFallbackValue(
        const FollowBatchRequest(follows: []),
      );
    });

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
    setUpAll(() {
      registerFallbackValue(
        const UnfollowBatchRequest(follows: []),
      );
    });

    feedsClientTest(
      'should get or create unfollows successfully',
      body: (tester) async {
        const johnFid = FeedId.user('john');
        const janeFid = FeedId.user('jane');
        const bobFid = FeedId.user('bob');

        final request = UnfollowBatchRequest(
          follows: [
            FollowPair(
              source: johnFid.rawValue,
              target: janeFid.rawValue,
            ),
            FollowPair(
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
            FollowPair(
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
    setUpAll(() {
      registerFallbackValue(
        const CreateCollectionsRequest(collections: []),
      );
    });

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
    setUpAll(() {
      registerFallbackValue(
        const UpdateCollectionsRequest(collections: []),
      );
    });

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
}

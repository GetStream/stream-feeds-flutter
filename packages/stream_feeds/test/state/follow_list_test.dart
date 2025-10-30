import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/generated/api/model/follow_updated_event.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  late StreamFeedsClientImpl client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClientImpl(
      apiKey: 'apiKey',
      user: const User(id: 'luke_skywalker'),
      tokenProvider: TokenProvider.static(UserToken(testToken)),
      feedsRestApi: feedsApi,
      wsProvider: (options) => webSocketChannel,
    );
  });

  tearDown(() {
    client.disconnect();
  });

  group('FollowListEventHandler - Local filtering', () {
    late StreamController<Object> wsStreamController;
    late MockWebSocketSink webSocketSink;

    setUp(() async {
      wsStreamController = StreamController<Object>();
      webSocketSink = MockWebSocketSink();
      WsTestConnection(
        wsStreamController: wsStreamController,
        webSocketSink: webSocketSink,
        webSocketChannel: webSocketChannel,
      ).setUp();

      await client.connect();

      when(
        () => feedsApi.queryFollows(
          queryFollowsRequest: any(named: 'queryFollowsRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryFollowsResponse(
            duration: DateTime.now().toIso8601String(),
            follows: [
              createDefaultFollowResponse(id: 'follow-1'),
              createDefaultFollowResponse(id: 'follow-2'),
              createDefaultFollowResponse(id: 'follow-3'),
            ],
          ),
        ),
      );
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    test(
      'FollowUpdatedEvent - should remove follow when updated to non-matching status',
      () async {
        final followList = client.followList(
          FollowsQuery(
            filter: Filter.equal(
              FollowsFilterField.status,
              FollowStatus.accepted,
            ),
          ),
        );

        await followList.get();
        expect(followList.state.follows, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            FollowUpdatedEvent(
              type: 'feeds.follow.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:follow-1',
              follow: createDefaultFollowResponse(
                id: 'follow-1',
              ).copyWith(
                status: FollowResponseStatus.rejected,
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(followList.state.follows, hasLength(2));
      },
    );

    test(
      'No filter - should not remove follow when no filter specified',
      () async {
        final followList = client.followList(
          // No filter specified, should accept all follows
          const FollowsQuery(),
        );

        await followList.get();
        expect(followList.state.follows, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            FollowUpdatedEvent(
              type: 'feeds.follow.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:follow-1',
              follow: createDefaultFollowResponse(
                id: 'follow-1',
              ).copyWith(
                status: FollowResponseStatus.rejected,
              ),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(followList.state.follows, hasLength(3));
      },
    );
  });
}

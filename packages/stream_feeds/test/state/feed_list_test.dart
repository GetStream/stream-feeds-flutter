import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/generated/api/model/feed_updated_event.dart';
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

  group('FeedListEventHandler - Local filtering', () {
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
        () => feedsApi.queryFeeds(
          queryFeedsRequest: any(named: 'queryFeedsRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryFeedsResponse(
            duration: DateTime.now().toIso8601String(),
            feeds: [
              createDefaultFeedResponse(id: 'feed-1'),
              createDefaultFeedResponse(id: 'feed-2'),
              createDefaultFeedResponse(id: 'feed-3'),
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
      'FeedUpdatedEvent - should remove feed when updated to non-matching visibility',
      () async {
        final feedList = client.feedList(
          FeedsQuery(
            filter: Filter.equal(FeedsFilterField.visibility, 'public'),
          ),
        );

        await feedList.get();
        expect(feedList.state.feeds, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            FeedUpdatedEvent(
              type: 'feeds.feed.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:feed-1',
              feed: createDefaultFeedResponse(
                id: 'feed-1',
              ).copyWith(visibility: FeedVisibility.private),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(feedList.state.feeds, hasLength(2));
      },
    );

    test(
      'No filter - should not remove feed when no filter specified',
      () async {
        final feedList = client.feedList(
          // No filter specified, all feeds should be accepted
          const FeedsQuery(),
        );

        await feedList.get();
        expect(feedList.state.feeds, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            FeedUpdatedEvent(
              type: 'feeds.feed.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:feed-1',
              feed: createDefaultFeedResponse(
                id: 'feed-1',
              ).copyWith(visibility: FeedVisibility.private),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(feedList.state.feeds, hasLength(3));
      },
    );
  });
}

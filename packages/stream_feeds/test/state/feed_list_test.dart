import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('FeedListEventHandler - Local filtering', () {
    final initialFeeds = [
      createDefaultFeedResponse(id: 'feed-1'),
      createDefaultFeedResponse(id: 'feed-2'),
      createDefaultFeedResponse(id: 'feed-3'),
    ];

    feedListTest(
      'FeedUpdatedEvent - should remove feed when updated to non-matching visibility',
      build: (client) => client.feedList(
        FeedsQuery(
          filter: Filter.equal(FeedsFilterField.visibility, 'public'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(feeds: initialFeeds),
      ),
      body: (tester) async {
        expect(tester.feedListState.feeds, hasLength(3));

        await tester.emitEvent(
          FeedUpdatedEvent(
            type: EventTypes.feedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:feed-1',
            feed: createDefaultFeedResponse(
              id: 'feed-1',
            ).copyWith(visibility: FeedVisibility.private),
          ),
        );

        expect(tester.feedListState.feeds, hasLength(2));
      },
    );

    feedListTest(
      'No filter - should not remove feed when no filter specified',
      build: (client) => client.feedList(
        // No filter specified, all feeds should be accepted
        const FeedsQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(feeds: initialFeeds),
      ),
      body: (tester) async {
        expect(tester.feedListState.feeds, hasLength(3));

        await tester.emitEvent(
          FeedUpdatedEvent(
            type: EventTypes.feedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:feed-1',
            feed: createDefaultFeedResponse(
              id: 'feed-1',
            ).copyWith(visibility: FeedVisibility.private),
          ),
        );

        expect(tester.feedListState.feeds, hasLength(3));
      },
    );
  });
}

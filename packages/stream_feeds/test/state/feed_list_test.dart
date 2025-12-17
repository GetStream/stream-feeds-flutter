import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Feed List - Query Operations', () {
    feedListTest(
      'get - should query initial feeds via API',
      build: (client) => client.feedList(const FeedsQuery()),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<FeedData>>>());
        final feeds = result.getOrThrow();

        expect(feeds, isA<List<FeedData>>());
        expect(feeds, hasLength(3));
      },
    );

    feedListTest(
      'queryMoreFeeds - should load more feeds via API',
      build: (client) => client.feedList(const FeedsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          feeds: [createDefaultFeedResponse(id: 'feed-1')],
        ),
      ),
      body: (tester) async {
        // Initial state - has feed
        expect(tester.feedListState.feeds, hasLength(1));

        final nextPageQuery = tester.feedList.query.copyWith(
          next: tester.feedListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryFeeds(
            queryFeedsRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryFeedsResponse(
            prev: 'prev-cursor',
            feeds: [createDefaultFeedResponse(id: 'feed-2')],
          ),
        );

        // Query more feeds
        final result = await tester.feedList.queryMoreFeeds();

        expect(result.isSuccess, isTrue);
        final feeds = result.getOrNull();
        expect(feeds, isNotNull);
        expect(feeds, hasLength(1));

        // Verify state was updated with merged feeds
        expect(tester.feedListState.feeds, hasLength(2));
        expect(tester.feedListState.pagination?.next, isNull);
        expect(tester.feedListState.pagination?.previous, 'prev-cursor');
      },
      verify: (tester) {
        final nextPageQuery = tester.feedList.query.copyWith(
          next: tester.feedListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryFeeds(
            queryFeedsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    feedListTest(
      'queryMoreFeeds - should return empty list when no more feeds',
      build: (client) => client.feedList(const FeedsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          feeds: [createDefaultFeedResponse(id: 'feed-1')],
        ),
      ),
      body: (tester) async {
        // Initial state - has feed but no pagination
        expect(tester.feedListState.feeds, hasLength(1));
        expect(tester.feedListState.pagination?.next, isNull);
        expect(tester.feedListState.pagination?.previous, isNull);

        // Query more feeds (should return empty immediately)
        final result = await tester.feedList.queryMoreFeeds();

        expect(result.isSuccess, isTrue);
        final feeds = result.getOrNull();
        expect(feeds, isEmpty);

        // State should remain unchanged
        expect(tester.feedListState.feeds, hasLength(1));
        expect(tester.feedListState.pagination?.next, isNull);
        expect(tester.feedListState.pagination?.previous, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Feed List - Event Handling', () {
    feedListTest(
      'FeedCreatedEvent - should add feed',
      build: (client) => client.feedList(const FeedsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(feeds: const []),
      ),
      body: (tester) async {
        // Initial state - no feeds
        expect(tester.feedListState.feeds, isEmpty);

        const feedId = FeedId(group: 'user', id: 'john');

        // Emit event
        await tester.emitEvent(
          FeedCreatedEvent(
            type: EventTypes.feedCreated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedId.rawValue,
            feed:
                createDefaultFeedResponse(id: feedId.id, groupId: feedId.group),
            members: const [],
            user: UserResponseCommonFields(
              id: 'user-id',
              banned: false,
              blockedUserIds: const [],
              createdAt: DateTime(2021),
              custom: const {},
              language: 'en',
              online: false,
              role: 'user',
              teams: const [],
              updatedAt: DateTime(2021, 2),
            ),
          ),
        );

        // Verify feed was added
        expect(tester.feedListState.feeds, hasLength(1));
        expect(tester.feedListState.feeds.first.fid, feedId);
      },
    );

    feedListTest(
      'FeedUpdatedEvent - should update feed',
      build: (client) => client.feedList(const FeedsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          feeds: [createDefaultFeedResponse(id: 'feed-1')],
        ),
      ),
      body: (tester) async {
        final existingFeed = tester.feedListState.feeds.first;

        // Emit event
        await tester.emitEvent(
          FeedUpdatedEvent(
            type: EventTypes.feedUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: existingFeed.fid.rawValue,
            feed: createDefaultFeedResponse(
              id: 'feed-1',
              name: 'Updated Feed Name',
            ),
          ),
        );

        // Verify feed was updated
        final updatedFeed = tester.feedListState.feeds.first;
        expect(updatedFeed.name, 'Updated Feed Name');
      },
    );

    feedListTest(
      'FeedDeletedEvent - should remove feed',
      build: (client) => client.feedList(const FeedsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          feeds: [createDefaultFeedResponse(id: 'feed-1')],
        ),
      ),
      body: (tester) async {
        // Verify initial state
        expect(tester.feedListState.feeds, hasLength(1));
        final feedToDelete = tester.feedListState.feeds.first;

        // Emit event
        await tester.emitEvent(
          FeedDeletedEvent(
            type: EventTypes.feedDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: feedToDelete.fid.rawValue,
          ),
        );

        // Verify feed was removed
        expect(tester.feedListState.feeds, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Feed List - Local filtering', () {
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

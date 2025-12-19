import 'package:collection/collection.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Follow List - Query Operations', () {
    followListTest(
      'get - should query initial follows via API',
      build: (client) => client.followList(const FollowsQuery()),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<FollowData>>>());
        final follows = result.getOrThrow();

        expect(follows, isA<List<FollowData>>());
        expect(follows, hasLength(3));
      },
    );

    followListTest(
      'queryMoreFollows - should load more follows via API',
      build: (client) => client.followList(const FollowsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          follows: [
            createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
            ),
            createDefaultFollowResponse(
              sourceId: 'source-2',
              targetId: 'target-2',
            ),
            createDefaultFollowResponse(
              sourceId: 'source-3',
              targetId: 'target-3',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has follows
        expect(tester.followListState.follows, hasLength(3));
        expect(tester.followListState.canLoadMore, isTrue);

        final nextPageQuery = tester.followList.query.copyWith(
          next: tester.followListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryFollows(
            queryFollowsRequest: nextPageQuery.toRequest(),
          ),
          result: QueryFollowsResponse(
            duration: DateTime.now().toIso8601String(),
            follows: [
              createDefaultFollowResponse(
                sourceId: 'source-4',
                targetId: 'target-4',
              ),
            ],
          ),
        );

        // Query more follows
        final result = await tester.followList.queryMoreFollows();

        expect(result.isSuccess, isTrue);
        final follows = result.getOrNull();
        expect(follows, isNotNull);
        expect(follows, hasLength(1));

        // Verify state was updated with merged follows
        expect(tester.followListState.follows, hasLength(4));
        expect(tester.followListState.canLoadMore, isFalse);

        tester.verifyApi(
          (api) => api.queryFollows(
            queryFollowsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    followListTest(
      'queryMoreFollows - should return empty list when no more follows',
      build: (client) => client.followList(const FollowsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          follows: [
            createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
            ),
            createDefaultFollowResponse(
              sourceId: 'source-2',
              targetId: 'target-2',
            ),
            createDefaultFollowResponse(
              sourceId: 'source-3',
              targetId: 'target-3',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has follows but no pagination
        expect(tester.followListState.follows, hasLength(3));
        expect(tester.followListState.canLoadMore, isFalse);
        // Query more follows (should return empty immediately)
        final result = await tester.followList.queryMoreFollows();

        expect(result.isSuccess, isTrue);
        final follows = result.getOrNull();
        expect(follows, isEmpty);

        // State should remain unchanged
        expect(tester.followListState.follows, hasLength(3));
        expect(tester.followListState.canLoadMore, isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Follow List - Event Handling', () {
    final initialFollows = [
      createDefaultFollowResponse(
        sourceId: 'source-1',
        targetId: 'target-1',
      ),
      createDefaultFollowResponse(
        sourceId: 'source-2',
        targetId: 'target-2',
      ),
      createDefaultFollowResponse(
        sourceId: 'source-3',
        targetId: 'target-3',
      ),
    ];

    followListTest(
      'FollowCreatedEvent - should add follow',
      build: (client) => client.followList(const FollowsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        // Initial state - has follows
        expect(tester.followListState.follows, hasLength(3));

        // Emit event
        await tester.emitEvent(
          FollowCreatedEvent(
            type: EventTypes.followCreated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            follow: createDefaultFollowResponse(
              sourceId: 'source-4',
              targetId: 'target-4',
            ),
          ),
        );

        // Verify follow was added
        expect(tester.followListState.follows, hasLength(4));
      },
    );

    followListTest(
      'FollowUpdatedEvent - should update follow',
      build: (client) => client.followList(const FollowsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        // Emit event with same createdAt to match the follow ID
        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            follow: createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
              status: FollowResponseStatus.rejected,
            ),
          ),
        );

        // Verify follow was updated
        final updatedFollow = tester.followListState.follows.firstWhereOrNull(
          (f) => f.sourceFeed.id == 'source-1' && f.targetFeed.id == 'target-1',
        );

        expect(updatedFollow, isNotNull);
        expect(updatedFollow!.status, 'rejected');
        expect(tester.followListState.follows, hasLength(3));
      },
    );

    followListTest(
      'FollowDeletedEvent - should remove follow',
      build: (client) => client.followList(const FollowsQuery()),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        // Verify initial state
        expect(tester.followListState.follows, hasLength(3));

        // Emit event
        await tester.emitEvent(
          FollowDeletedEvent(
            type: EventTypes.followDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            follow: createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
            ),
          ),
        );

        // Verify follow was removed
        final deletedFollow = tester.followListState.follows.firstWhereOrNull(
          (f) => f.sourceFeed.id == 'source-1' && f.targetFeed.id == 'target-1',
        );

        expect(deletedFollow, isNull);
        expect(tester.followListState.follows, hasLength(2));
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('Follow List - Local filtering', () {
    final initialFollows = [
      createDefaultFollowResponse(
        sourceId: 'source-1',
        targetId: 'target-1',
      ),
      createDefaultFollowResponse(
        sourceId: 'source-2',
        targetId: 'target-2',
      ),
      createDefaultFollowResponse(
        sourceId: 'source-3',
        targetId: 'target-3',
      ),
    ];

    followListTest(
      'FollowUpdatedEvent - should remove follow when updated to non-matching status',
      build: (client) => client.followList(
        FollowsQuery(
          filter: Filter.equal(
            FollowsFilterField.status,
            FollowStatus.accepted,
          ),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        expect(tester.followListState.follows, hasLength(3));

        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:follow-1',
            follow: createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
              status: FollowResponseStatus.rejected,
            ),
          ),
        );

        expect(tester.followListState.follows, hasLength(2));
      },
    );

    followListTest(
      'No filter - should not remove follow when no filter specified',
      build: (client) => client.followList(
        // No filter specified, should accept all follows
        const FollowsQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(follows: initialFollows),
      ),
      body: (tester) async {
        expect(tester.followListState.follows, hasLength(3));

        await tester.emitEvent(
          FollowUpdatedEvent(
            type: EventTypes.followUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:follow-1',
            follow: createDefaultFollowResponse(
              sourceId: 'source-1',
              targetId: 'target-1',
              status: FollowResponseStatus.rejected,
            ),
          ),
        );

        expect(tester.followListState.follows, hasLength(3));
      },
    );
  });
}

import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const currentUser = User(id: 'test_user');
  const activityId = 'activity-1';
  const reactionType = 'love';

  const query = ActivityReactionsQuery(activityId: activityId);

  // Computed reaction ID based on FeedsReactionData.id getter
  // id = '$type-$userReactionsGroupId' where userReactionsGroupId = '${currentUser.id}-$activityId'
  final reactionId = '$reactionType-${currentUser.id}-$activityId';

  // ============================================================
  // FEATURE: Activity Reaction List - Query Operations
  // ============================================================

  group('Activity Reaction List - Query Operations', () {
    activityReactionListTest(
      'get - should query initial reactions via API',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<FeedsReactionData>>>());
        final reactions = result.getOrThrow();

        expect(reactions, isA<List<FeedsReactionData>>());
        expect(reactions, hasLength(3));
      },
    );

    activityReactionListTest(
      'queryMoreReactions - should load more reactions via API',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(tester.activityReactionListState.canLoadMore, isTrue);

        final nextPageQuery = tester.activityReactionList.query.copyWith(
          next: tester.activityReactionListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryActivityReactions(
            activityId: activityId,
            queryActivityReactionsRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryActivityReactionsResponse(
            reactions: [
              createDefaultReactionResponse(
                activityId: activityId,
                reactionType: reactionType,
                userId: 'user-2', // Different user to ensure unique reaction
              ),
            ],
          ),
        );

        // Query more reactions
        final result = await tester.activityReactionList.queryMoreReactions();

        expect(result.isSuccess, isTrue);
        final reactions = result.getOrNull();
        expect(reactions, isNotNull);
        expect(reactions, hasLength(1));

        // Verify state was updated with merged reactions
        expect(tester.activityReactionListState.reactions, hasLength(2));
        expect(tester.activityReactionListState.canLoadMore, isFalse);
      },
      verify: (tester) {
        final nextPageQuery = tester.activityReactionList.query.copyWith(
          next: tester.activityReactionListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryActivityReactions(
            activityId: activityId,
            queryActivityReactionsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    activityReactionListTest(
      'queryMoreReactions - should return empty list when no more reactions',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction but no pagination
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(tester.activityReactionListState.canLoadMore, isFalse);

        // Query more reactions (should return empty immediately)
        final result = await tester.activityReactionList.queryMoreReactions();

        expect(result.isSuccess, isTrue);
        final reactions = result.getOrNull();
        expect(reactions, isNotNull);
        expect(reactions, isEmpty);

        // State should remain unchanged
        expect(tester.activityReactionListState.reactions, hasLength(1));
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Reaction List - Event Handling
  // ============================================================

  group('Activity Reaction List - Event Handling', () {
    activityReactionListTest(
      'should handle ActivityReactionAddedEvent and add reaction',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(reactions: const []),
      ),
      body: (tester) async {
        // Initial state - no reactions
        expect(tester.activityReactionListState.reactions, isEmpty);

        // Emit event
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: 'feeds.activity.reaction.added',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            reaction: createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ),
        );

        // Verify state has reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        final addedReaction = tester.activityReactionListState.reactions.first;
        expect(addedReaction.id, reactionId);
        expect(addedReaction.type, reactionType);
      },
    );

    activityReactionListTest(
      'ActivityReactionUpdatedEvent - should replace user reaction',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(
          tester.activityReactionListState.reactions.first.type,
          reactionType,
        );

        // Emit event with updated reaction type
        await tester.emitEvent(
          ActivityReactionUpdatedEvent(
            type: 'feeds.activity.reaction.updated',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: activityId,
              latestReactions: [
                createDefaultReactionResponse(
                  activityId: activityId,
                  reactionType: 'fire',
                  userId: currentUser.id,
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              activityId: activityId,
              reactionType: 'fire',
              userId: currentUser.id,
            ),
          ),
        );

        // Verify state has updated reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(
          tester.activityReactionListState.reactions.first.type,
          'fire',
        );
      },
    );

    activityReactionListTest(
      'should handle ActivityReactionDeletedEvent and remove reaction',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(tester.activityReactionListState.reactions.first.id, reactionId);

        // Emit event
        await tester.emitEvent(
          ActivityReactionDeletedEvent(
            type: 'feeds.activity.reaction.deleted',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            reaction: createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ),
        );

        // Verify state has no reactions
        expect(tester.activityReactionListState.reactions, isEmpty);
      },
    );

    activityReactionListTest(
      'should not update reactions if activityId does not match',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(reactions: const []),
      ),
      body: (tester) async {
        // Initial state - no reactions
        expect(tester.activityReactionListState.reactions, isEmpty);

        // Emit ActivityReactionAddedEvent for different activity
        await tester.emitEvent(
          ActivityReactionAddedEvent(
            type: 'feeds.activity.reaction.added',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
            reaction: createDefaultReactionResponse(
              activityId: 'different-activity-id',
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ),
        );

        // Verify state was not updated
        expect(tester.activityReactionListState.reactions, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Reaction List - Activity Deletion
  // ============================================================

  group('Activity Reaction List - Activity Deletion', () {
    activityReactionListTest(
      'should clear all reactions when activity is deleted',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: 'fire',
              userId: 'user-2', // Different user to ensure unique reaction
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reactions and pagination
        expect(tester.activityReactionListState.reactions, hasLength(2));
        expect(
          tester.activityReactionListState.pagination?.next,
          'next-cursor',
        );

        // Emit ActivityDeletedEvent
        await tester.emitEvent(
          ActivityDeletedEvent(
            type: 'feeds.activity.deleted',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
          ),
        );

        // Verify state has no reactions and no pagination
        expect(tester.activityReactionListState.reactions, isEmpty);
        expect(tester.activityReactionListState.pagination, isNull);
        expect(tester.activityReactionListState.canLoadMore, isFalse);
      },
    );

    activityReactionListTest(
      'should not clear reactions when different activity is deleted',
      user: currentUser,
      build: (client) => client.activityReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              activityId: activityId,
              reactionType: reactionType,
              userId: currentUser.id,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(
          tester.activityReactionListState.reactions.first.id,
          reactionId,
        );

        // Emit ActivityDeletedEvent for different activity
        await tester.emitEvent(
          ActivityDeletedEvent(
            type: 'feeds.activity.deleted',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
          ),
        );

        // Verify state was not changed (still has reaction)
        expect(tester.activityReactionListState.reactions, hasLength(1));
        expect(
          tester.activityReactionListState.reactions.first.id,
          reactionId,
        );
      },
    );
  });
}

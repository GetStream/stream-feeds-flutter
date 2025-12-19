import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const fid = 'user:john';
  const activityId = 'activity-1';
  const reactionType = 'love';
  const query = CommentReactionsQuery(commentId: 'comment-1');

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Comment Reaction List - Query Operations', () {
    commentReactionListTest(
      'get - should query initial comment reactions via API',
      build: (client) => client.commentReactionList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<FeedsReactionData>>>());
        final reactions = result.getOrThrow();

        expect(reactions, isA<List<FeedsReactionData>>());
        expect(reactions, hasLength(3));
      },
    );

    commentReactionListTest(
      'queryMoreReactions - should load more reactions via API',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          reactions: [
            createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction
        expect(tester.commentReactionListState.reactions, hasLength(1));

        final nextPageQuery = tester.commentReactionList.query.copyWith(
          next: tester.commentReactionListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryCommentReactions(
            id: query.commentId,
            queryCommentReactionsRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryCommentReactionsResponse(
            prev: 'prev-cursor',
            reactions: [
              createDefaultReactionResponse(
                commentId: query.commentId,
                reactionType: reactionType,
                userId: 'user-2',
              ),
            ],
          ),
        );

        // Query more reactions
        final result = await tester.commentReactionList.queryMoreReactions();

        expect(result.isSuccess, isTrue);
        final reactions = result.getOrNull();
        expect(reactions, isNotNull);
        expect(reactions, hasLength(1));

        // Verify state was updated with merged reactions
        expect(tester.commentReactionListState.reactions, hasLength(2));
        expect(tester.commentReactionListState.pagination?.next, isNull);
        expect(
          tester.commentReactionListState.pagination?.previous,
          'prev-cursor',
        );
      },
      verify: (tester) {
        final nextPageQuery = tester.commentReactionList.query.copyWith(
          next: tester.commentReactionListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryCommentReactions(
            id: query.commentId,
            queryCommentReactionsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    commentReactionListTest(
      'queryMoreReactions - should return empty list when no more reactions',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reaction but no pagination
        expect(tester.commentReactionListState.reactions, hasLength(1));
        expect(tester.commentReactionListState.pagination?.next, isNull);
        expect(tester.commentReactionListState.pagination?.previous, isNull);

        // Query more reactions (should return empty immediately)
        final result = await tester.commentReactionList.queryMoreReactions();

        expect(result.isSuccess, isTrue);
        final reactions = result.getOrNull();
        expect(reactions, isEmpty);

        // State should remain unchanged
        expect(tester.commentReactionListState.reactions, hasLength(1));
        expect(tester.commentReactionListState.pagination?.next, isNull);
        expect(tester.commentReactionListState.pagination?.previous, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Comment Deletion
  // ============================================================

  group('Comment Reaction List - Comment Deletion', () {
    commentReactionListTest(
      'CommentDeletedEvent - should clear all reactions when comment is deleted',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Verify reactions are loaded
        expect(tester.commentReactionListState.reactions, hasLength(3));

        // Emit event
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            comment: createDefaultCommentResponse(
              id: query.commentId,
              objectId: activityId,
            ),
          ),
        );

        // Verify state was cleared
        expect(tester.commentReactionListState.reactions, isEmpty);
        expect(tester.commentReactionListState.pagination, isNull);
      },
    );

    commentReactionListTest(
      'CommentDeletedEvent - should not clear reactions for different comment',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Verify reactions are loaded
        expect(tester.commentReactionListState.reactions, hasLength(3));

        // Emit event for different comment
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: activityId,
            ),
          ),
        );

        // Verify state was not cleared
        expect(tester.commentReactionListState.reactions, hasLength(3));
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Comment Reaction List - Event Handling', () {
    commentReactionListTest(
      'CommentReactionAddedEvent - should add reaction',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          reactions: [
            createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
            ),
            createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
              userId: 'user-2',
            ),
            createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
              userId: 'user-3',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Verify initial state
        expect(tester.commentReactionListState.reactions, hasLength(3));

        // Emit event
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: query.commentId,
              objectId: activityId,
            ),
            reaction: createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionType,
              userId: 'user-4',
            ),
          ),
        );

        // Verify reaction was added
        expect(tester.commentReactionListState.reactions, hasLength(4));
        expect(
          tester.commentReactionListState.reactions.first.user.id,
          'user-4',
        );
      },
    );

    commentReactionListTest(
      'CommentReactionAddedEvent - should not add reaction for different comment',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Verify initial state
        expect(tester.commentReactionListState.reactions, hasLength(3));

        // Emit event for different comment
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: activityId,
            ),
            reaction: createDefaultReactionResponse(
              commentId: 'different-comment-id',
              reactionType: reactionType,
              userId: 'user-4',
            ),
          ),
        );

        // Verify reaction was not added
        expect(tester.commentReactionListState.reactions, hasLength(3));
      },
    );

    commentReactionListTest(
      'CommentReactionUpdatedEvent - should replace user reaction',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Initial state - has 'like' reaction
        final existingReaction =
            tester.commentReactionListState.reactions.first;
        expect(existingReaction.type, 'like');

        // Emit event to replace 'like' with 'fire'
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: query.commentId,
              objectId: activityId,
              latestReactions: [
                createDefaultReactionResponse(
                  commentId: query.commentId,
                  reactionType: 'fire',
                  userId: existingReaction.user.id,
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: 'fire',
              userId: existingReaction.user.id,
            ),
          ),
        );

        // Verify 'like' was replaced with 'fire'
        final updatedReaction = tester.commentReactionListState.reactions.first;
        expect(updatedReaction.type, 'fire');
      },
    );

    commentReactionListTest(
      'CommentReactionUpdatedEvent - should not update reaction for different comment',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        final existingReaction =
            tester.commentReactionListState.reactions.first;

        // Emit event for different comment
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: activityId,
            ),
            reaction: createDefaultReactionResponse(
              commentId: 'different-comment-id',
              reactionType: reactionType,
              userId: existingReaction.user.id,
            ).copyWith(
              custom: const {'updated': true},
            ),
          ),
        );

        // Verify reaction was not updated
        final updatedReaction = tester.commentReactionListState.reactions.first;
        expect(updatedReaction.custom, isNull);
      },
    );

    commentReactionListTest(
      'CommentReactionDeletedEvent - should remove reaction',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Verify initial state
        expect(tester.commentReactionListState.reactions, hasLength(3));

        final reactionToDelete =
            tester.commentReactionListState.reactions.first;

        // Emit event
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            comment: createDefaultCommentResponse(
              id: query.commentId,
              objectId: activityId,
            ),
            reaction: createDefaultReactionResponse(
              commentId: query.commentId,
              reactionType: reactionToDelete.type,
              userId: reactionToDelete.user.id,
            ),
          ),
        );

        // Verify reaction was removed
        expect(tester.commentReactionListState.reactions, hasLength(2));
        expect(
          tester.commentReactionListState.reactions
              .any((r) => r.id == reactionToDelete.id),
          isFalse,
        );
      },
    );

    commentReactionListTest(
      'CommentReactionDeletedEvent - should not remove reaction for different comment',
      build: (client) => client.commentReactionList(query),
      setUp: (tester) => tester.get(),
      body: (tester) async {
        // Verify initial state
        expect(tester.commentReactionListState.reactions, hasLength(3));

        final reactionToDelete =
            tester.commentReactionListState.reactions.first;

        // Emit event for different comment
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: fid,
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: activityId,
            ),
            reaction: createDefaultReactionResponse(
              commentId: 'different-comment-id',
              reactionType: reactionToDelete.type,
              userId: reactionToDelete.user.id,
            ),
          ),
        );

        // Verify reaction was not removed
        expect(tester.commentReactionListState.reactions, hasLength(3));
      },
    );
  });
}

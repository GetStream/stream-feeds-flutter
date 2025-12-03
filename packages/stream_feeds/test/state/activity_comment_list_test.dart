import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  const activityId = 'activity-1';
  const commentId = 'comment-test-1';
  const userId = 'luke_skywalker';
  const reactionType = 'like';

  const query = ActivityCommentsQuery(
    objectId: activityId,
    objectType: 'activity',
  );

  // ============================================================
  // FEATURE: Activity Comment List - Query Operations
  // ============================================================

  group('Activity Comment List - Query Operations', () {
    activityCommentListTest(
      'get - should query initial comments via API',
      build: (client) => client.activityCommentList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<CommentData>>>());
        final comments = result.getOrThrow();

        expect(comments, isA<List<CommentData>>());
        expect(comments, hasLength(3));
        expect(comments[0].id, 'comment-1');
        expect(comments[1].id, 'comment-2');
        expect(comments[2].id, 'comment-3');
      },
    );

    activityCommentListTest(
      'queryMoreComments - should load more comments via API',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityCommentListState.comments, hasLength(1));

        final nextPageQuery = tester.activityCommentList.query.copyWith(
          next: tester.activityCommentListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.getComments(
            objectId: nextPageQuery.objectId,
            objectType: nextPageQuery.objectType,
            depth: nextPageQuery.depth,
            sort: nextPageQuery.sort,
            limit: nextPageQuery.limit,
            next: nextPageQuery.next,
            prev: nextPageQuery.previous,
          ),
          result: createDefaultCommentsResponse(
            prev: 'prev-cursor',
            comments: [
              createDefaultThreadedCommentResponse(
                id: 'comment-test-2',
                objectId: activityId,
                objectType: 'activity',
                text: 'Second comment',
                userId: userId,
              ),
            ],
          ),
        );

        // Query more comments
        final result = await tester.activityCommentList.queryMoreComments();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, hasLength(1));

        // Verify state was updated with merged comments
        expect(tester.activityCommentListState.comments, hasLength(2));
        expect(tester.activityCommentListState.pagination?.next, isNull);
        expect(
          tester.activityCommentListState.pagination?.previous,
          'prev-cursor',
        );
      },
      verify: (tester) {
        final nextPageQuery = tester.activityCommentList.query.copyWith(
          next: tester.activityCommentListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.getComments(
            objectId: nextPageQuery.objectId,
            objectType: nextPageQuery.objectType,
            depth: nextPageQuery.depth,
            sort: nextPageQuery.sort,
            limit: nextPageQuery.limit,
            next: nextPageQuery.next,
            prev: nextPageQuery.previous,
          ),
        );
      },
    );

    activityCommentListTest(
      'queryMoreComments - should return empty list when no more comments',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment but no pagination
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(tester.activityCommentListState.pagination?.next, isNull);

        // Query more comments (should return empty immediately)
        final result = await tester.activityCommentList.queryMoreComments();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, isEmpty);

        // State should remain unchanged
        expect(tester.activityCommentListState.comments, hasLength(1));
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Comment List - Event Handling
  // ============================================================

  group('Activity Comment List - Event Handling', () {
    activityCommentListTest(
      'should handle CommentAddedEvent and update comments',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(comments: const []),
      ),
      body: (tester) async {
        // Initial state - no comments
        expect(tester.activityCommentListState.comments, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has comment
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(tester.activityCommentListState.comments.first.id, commentId);
        expect(
          tester.activityCommentListState.comments.first.text,
          'Test comment',
        );
        expect(tester.activityCommentListState.comments.first.user.id, userId);
      },
    );

    activityCommentListTest(
      'should handle CommentUpdatedEvent and update comment',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Original comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(
          tester.activityCommentListState.comments.first.text,
          'Original comment',
        );

        // Emit event
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Updated comment',
              userId: userId,
            ),
          ),
        );

        // Verify state has updated comment
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(
          tester.activityCommentListState.comments.first.text,
          'Updated comment',
        );
      },
    );

    activityCommentListTest(
      'should handle CommentDeletedEvent and remove comment',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(tester.activityCommentListState.comments.first.id, commentId);

        // Emit event
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify state has no comments
        expect(tester.activityCommentListState.comments, isEmpty);
      },
    );

    activityCommentListTest(
      'should not update comments if objectId does not match',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(comments: const []),
      ),
      body: (tester) async {
        // Initial state - no comments
        expect(tester.activityCommentListState.comments, isEmpty);

        // Emit CommentAddedEvent for different activity
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: 'different-activity-id',
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state was not updated
        expect(tester.activityCommentListState.comments, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Comment List - Comment Reactions
  // ============================================================

  group('Activity Comment List - Comment Reactions', () {
    activityCommentListTest(
      'should handle CommentReactionAddedEvent and update comment',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has no reactions
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.ownReactions, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              commentId: commentId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has reaction
        final updatedComment = tester.activityCommentListState.comments.first;
        expect(updatedComment.ownReactions, hasLength(1));
        expect(updatedComment.ownReactions.first.type, reactionType);
        expect(updatedComment.ownReactions.first.user.id, userId);
      },
    );

    activityCommentListTest(
      'should handle CommentReactionDeletedEvent and remove reaction',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
              ownReactions: [
                FeedsReactionResponse(
                  activityId: activityId,
                  commentId: commentId,
                  type: reactionType,
                  createdAt: DateTime.timestamp(),
                  updatedAt: DateTime.timestamp(),
                  user: createDefaultUserResponse(id: userId),
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has reaction
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.ownReactions, hasLength(1));

        // Emit event
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: activityId,
              commentId: commentId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has no reactions
        final updatedComment = tester.activityCommentListState.comments.first;
        expect(updatedComment.ownReactions, isEmpty);
      },
    );

    activityCommentListTest(
      'should not update comment if objectId does not match for reaction events',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - comment has no reactions
        expect(tester.activityCommentListState.comments, hasLength(1));
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.id, commentId);
        expect(initialComment.ownReactions, isEmpty);

        // Emit CommentReactionAddedEvent for different activity
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity:
                createDefaultActivityResponse(id: 'different-activity-id'),
            comment: createDefaultCommentResponse(
              id: 'different-comment-id',
              objectId: 'different-activity-id',
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'different-activity-id',
              commentId: 'different-comment-id',
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state was not updated (comment count unchanged, no reactions added)
        expect(tester.activityCommentListState.comments, hasLength(1));
        final comment = tester.activityCommentListState.comments.first;
        expect(comment.id, commentId);
        expect(comment.ownReactions, isEmpty);
      },
    );
  });
}

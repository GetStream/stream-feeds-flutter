// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

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
        expect(tester.activityCommentListState.canLoadMore, isTrue);

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
          ),
          result: createDefaultCommentsResponse(
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
        expect(tester.activityCommentListState.canLoadMore, isFalse);
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
        expect(tester.activityCommentListState.canLoadMore, isFalse);

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
      'should handle CommentAddedEvent and add nested reply',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Top-level comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment
        expect(tester.activityCommentListState.comments, hasLength(1));
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.id, commentId);
        expect(initialComment.replies, isNull);
        expect(initialComment.replyCount, 0);

        // Emit event for nested reply (parentId matches existing comment's ID)
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: activityId,
              objectType: 'activity',
              text: 'Nested reply',
              userId: userId,
            ).copyWith(parentId: commentId),
          ),
        );

        // Verify nested reply was added
        expect(tester.activityCommentListState.comments, hasLength(1));
        final topLevelComment = tester.activityCommentListState.comments.first;
        expect(topLevelComment.id, commentId);
        expect(topLevelComment.replies, isNotNull);
        expect(topLevelComment.replies, hasLength(1));
        expect(topLevelComment.replies!.first.id, 'nested-reply-1');
        expect(topLevelComment.replies!.first.text, 'Nested reply');
        expect(topLevelComment.replyCount, 1);
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
      'should handle CommentDeletedEvent and remove nested reply',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Top-level comment',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Nested reply',
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with nested reply
        final topLevelComment = tester.activityCommentListState.comments.first;
        expect(topLevelComment.replies, hasLength(1));
        expect(topLevelComment.replies!.first.id, 'nested-reply-1');
        expect(topLevelComment.replyCount, 1);

        // Emit event to delete nested reply
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
              parentId: commentId,
            ),
          ),
        );

        // Verify nested reply was removed
        final updatedTopLevelComment =
            tester.activityCommentListState.comments.first;
        expect(updatedTopLevelComment.replies, isEmpty);
        expect(updatedTopLevelComment.replyCount, 0);
        // Top-level comment should still exist
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(tester.activityCommentListState.comments.first.id, commentId);
      },
    );

    activityCommentListTest(
      'should handle CommentDeletedEvent and remove deep nested reply',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Top-level comment',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Nested reply',
                  userId: userId,
                  replies: [
                    createDefaultThreadedCommentResponse(
                      id: 'deep-nested-reply-1',
                      objectId: activityId,
                      objectType: 'activity',
                      text: 'Deep nested reply',
                      userId: userId,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with deep nested reply
        final topLevelComment = tester.activityCommentListState.comments.first;
        final secondLevelComment = topLevelComment.replies!.first;
        expect(secondLevelComment.replies, hasLength(1));
        expect(secondLevelComment.replies!.first.id, 'deep-nested-reply-1');
        expect(secondLevelComment.replyCount, 1);

        // Emit event to delete deep nested reply
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'deep-nested-reply-1',
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
              parentId: 'nested-reply-1',
            ),
          ),
        );

        // Verify deep nested reply was removed
        final updatedTopLevelComment =
            tester.activityCommentListState.comments.first;
        final updatedSecondLevelComment = updatedTopLevelComment.replies!.first;
        expect(updatedSecondLevelComment.replies, isEmpty);
        expect(updatedSecondLevelComment.replyCount, 0);
        // Second-level comment should still exist
        expect(updatedTopLevelComment.replies, hasLength(1));
        expect(updatedTopLevelComment.replies!.first.id, 'nested-reply-1');
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
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              commentId: commentId,
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
      'CommentReactionUpdatedEvent - should replace user reaction',
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
                createDefaultReactionResponse(
                  reactionType: reactionType,
                  userId: userId,
                  commentId: commentId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has 'like' reaction
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.ownReactions, hasLength(1));
        expect(initialComment.ownReactions.first.type, reactionType);

        // Emit event
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: activityId),
            comment: createDefaultCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              userId: userId,
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'fire',
                  userId: userId,
                  commentId: commentId,
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'fire',
              userId: userId,
              commentId: commentId,
            ),
          ),
        );

        // Verify state has updated reaction (old reaction replaced)
        final updatedComment = tester.activityCommentListState.comments.first;
        expect(updatedComment.ownReactions, hasLength(1));
        expect(updatedComment.ownReactions.first.type, 'fire');
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
                createDefaultReactionResponse(
                  reactionType: reactionType,
                  userId: userId,
                  commentId: commentId,
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
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              commentId: commentId,
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
            reaction: createDefaultReactionResponse(
              reactionType: reactionType,
              userId: userId,
              activityId: 'different-activity-id',
              commentId: 'different-comment-id',
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

  // ============================================================
  // FEATURE: Activity Comment List - Activity Deletion
  // ============================================================

  group('Activity Comment List - Activity Deletion', () {
    activityCommentListTest(
      'should clear all comments when activity is deleted',
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
            createDefaultThreadedCommentResponse(
              id: 'comment-test-2',
              objectId: activityId,
              objectType: 'activity',
              text: 'Another comment',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comments and pagination
        expect(tester.activityCommentListState.comments, hasLength(2));
        expect(tester.activityCommentListState.pagination?.next, 'next-cursor');

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

        // Verify state has no comments and no pagination
        expect(tester.activityCommentListState.comments, isEmpty);
        expect(tester.activityCommentListState.pagination, isNull);
        expect(tester.activityCommentListState.canLoadMore, isFalse);
      },
    );

    activityCommentListTest(
      'should clear nested replies when activity is deleted',
      build: (client) => client.activityCommentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: commentId,
              objectId: activityId,
              objectType: 'activity',
              text: 'Top-level comment',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Nested reply',
                  userId: userId,
                ),
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-2',
                  objectId: activityId,
                  objectType: 'activity',
                  text: 'Another nested reply',
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comment with nested replies
        expect(tester.activityCommentListState.comments, hasLength(1));
        final initialComment = tester.activityCommentListState.comments.first;
        expect(initialComment.replies, hasLength(2));

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

        // Verify all comments including nested replies are cleared
        expect(tester.activityCommentListState.comments, isEmpty);
      },
    );

    activityCommentListTest(
      'should not clear comments when different activity is deleted',
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

        // Emit ActivityDeletedEvent for different activity
        await tester.emitEvent(
          ActivityDeletedEvent(
            type: 'feeds.activity.deleted',
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(
              id: 'different-activity-id',
            ),
          ),
        );

        // Verify state was not changed (still has comment)
        expect(tester.activityCommentListState.comments, hasLength(1));
        expect(tester.activityCommentListState.comments.first.id, commentId);
      },
    );
  });
}

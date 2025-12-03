import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  const commentId = 'comment-1';
  const parentCommentId = 'parent-comment-1';
  const replyId = 'reply-test-1';
  const userId = 'luke_skywalker';
  const reactionType = 'like';

  const query = CommentRepliesQuery(
    commentId: parentCommentId,
  );

  // ============================================================
  // FEATURE: Comment Reply List - Query Operations
  // ============================================================

  group('Comment Reply List - Query Operations', () {
    commentReplyListTest(
      'get - should query initial replies via API',
      build: (client) => client.commentReplyList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<CommentData>>>());
        final replies = result.getOrThrow();

        expect(replies, isA<List<CommentData>>());
        expect(replies, hasLength(3));
        expect(replies[0].id, 'reply-1');
        expect(replies[1].id, 'reply-2');
        expect(replies[2].id, 'reply-3');
      },
    );

    commentReplyListTest(
      'queryMoreReplies - should load more replies via API',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reply
        expect(tester.commentReplyListState.replies, hasLength(1));

        final nextPageQuery = tester.commentReplyList.query.copyWith(
          next: tester.commentReplyListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.getCommentReplies(
            id: nextPageQuery.commentId,
            depth: nextPageQuery.depth,
            limit: nextPageQuery.limit,
            next: nextPageQuery.next,
            prev: nextPageQuery.previous,
            repliesLimit: nextPageQuery.repliesLimit,
            sort: nextPageQuery.sort,
          ),
          result: createDefaultCommentRepliesResponse(
            prev: 'prev-cursor',
            comments: [
              createDefaultThreadedCommentResponse(
                id: 'reply-test-2',
                objectId: commentId,
                objectType: 'activity',
                text: 'Second reply',
                userId: userId,
              ),
            ],
          ),
        );

        // Query more replies
        final result = await tester.commentReplyList.queryMoreReplies();

        expect(result.isSuccess, isTrue);
        final replies = result.getOrNull();
        expect(replies, isNotNull);
        expect(replies, hasLength(1));

        // Verify state was updated with merged replies
        expect(tester.commentReplyListState.replies, hasLength(2));
        expect(tester.commentReplyListState.pagination?.next, isNull);
        expect(
          tester.commentReplyListState.pagination?.previous,
          'prev-cursor',
        );
      },
      verify: (tester) {
        final nextPageQuery = tester.commentReplyList.query.copyWith(
          next: tester.commentReplyListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.getCommentReplies(
            id: nextPageQuery.commentId,
            depth: nextPageQuery.depth,
            limit: nextPageQuery.limit,
            next: nextPageQuery.next,
            prev: nextPageQuery.previous,
            repliesLimit: nextPageQuery.repliesLimit,
            sort: nextPageQuery.sort,
          ),
        );
      },
    );

    commentReplyListTest(
      'queryMoreReplies - should return empty list when no more replies',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reply but no pagination
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.pagination?.next, isNull);
        expect(tester.commentReplyListState.pagination?.previous, isNull);

        // Query more replies (should return empty immediately)
        final result = await tester.commentReplyList.queryMoreReplies();

        expect(result.isSuccess, isTrue);
        final replies = result.getOrNull();
        expect(replies, isEmpty);

        // Verify state was not updated (no new replies, pagination remains null)
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.pagination?.next, isNull);
        expect(tester.commentReplyListState.pagination?.previous, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Comment Reply List - Event Handling
  // ============================================================

  group('Comment Reply List - Event Handling', () {
    commentReplyListTest(
      'should handle CommentAddedEvent and add reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(comments: const []),
      ),
      body: (tester) async {
        // Initial state - no replies
        expect(tester.commentReplyListState.replies, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ).copyWith(parentId: parentCommentId),
          ),
        );

        // Verify state has reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.replies.first.id, replyId);
        expect(tester.commentReplyListState.replies.first.text, 'Test reply');
        expect(tester.commentReplyListState.replies.first.user.id, userId);
      },
    );

    commentReplyListTest(
      'should handle CommentUpdatedEvent and update reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Original reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(
          tester.commentReplyListState.replies.first.text,
          'Original reply',
        );

        // Emit event
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Updated reply',
              userId: userId,
            ),
          ),
        );

        // Verify state has updated reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(
          tester.commentReplyListState.replies.first.text,
          'Updated reply',
        );
      },
    );

    commentReplyListTest(
      'should handle CommentDeletedEvent and remove reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.replies.first.id, replyId);

        // Emit event
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify state has no replies
        expect(tester.commentReplyListState.replies, isEmpty);
      },
    );

    commentReplyListTest(
      'should not add reply if parentId does not match query commentId',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(comments: const []),
      ),
      body: (tester) async {
        // Initial state - no replies
        expect(tester.commentReplyListState.replies, isEmpty);

        // Emit CommentAddedEvent for different parent (not the query's commentId)
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ).copyWith(parentId: 'different-parent-id'),
          ),
        );

        // Verify state was not updated (only handles replies to query's commentId)
        expect(tester.commentReplyListState.replies, isEmpty);
      },
    );

    commentReplyListTest(
      'should not add comment if parentId is null',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(comments: const []),
      ),
      body: (tester) async {
        // Initial state - no replies
        expect(tester.commentReplyListState.replies, isEmpty);

        // Emit CommentAddedEvent without parentId (not a reply)
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test comment',
              userId: userId,
            ),
          ),
        );

        // Verify state was not updated (only replies are added, not top-level comments)
        expect(tester.commentReplyListState.replies, isEmpty);
      },
    );

    commentReplyListTest(
      'should handle CommentAddedEvent and add nested reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Top-level reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has top-level reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.replies.first.id, replyId);
        expect(tester.commentReplyListState.replies.first.replies, isNull);

        // Emit event for nested reply (parentId matches existing reply's ID)
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: commentId,
              objectType: 'activity',
              text: 'Nested reply',
              userId: userId,
            ).copyWith(parentId: replyId),
          ),
        );

        // Verify nested reply was added
        expect(tester.commentReplyListState.replies, hasLength(1));
        final topLevelReply = tester.commentReplyListState.replies.first;
        expect(topLevelReply.id, replyId);
        expect(topLevelReply.replies, isNotNull);
        expect(topLevelReply.replies, hasLength(1));
        expect(topLevelReply.replies!.first.id, 'nested-reply-1');
        expect(topLevelReply.replies!.first.text, 'Nested reply');
      },
    );

    commentReplyListTest(
      'should handle CommentUpdatedEvent and update nested reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Top-level reply',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: commentId,
                  objectType: 'activity',
                  text: 'Original nested reply',
                  userId: userId,
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has nested reply
        final topLevelReply = tester.commentReplyListState.replies.first;
        expect(topLevelReply.replies, hasLength(1));
        expect(topLevelReply.replies!.first.text, 'Original nested reply');

        // Emit event to update nested reply
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: commentId,
              objectType: 'activity',
              text: 'Updated nested reply',
              userId: userId,
            ),
          ),
        );

        // Verify nested reply was updated
        final updatedTopLevelReply = tester.commentReplyListState.replies.first;
        expect(updatedTopLevelReply.replies, hasLength(1));
        expect(
          updatedTopLevelReply.replies!.first.text,
          'Updated nested reply',
        );
      },
    );

    commentReplyListTest(
      'should handle CommentDeletedEvent and remove nested reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Top-level reply',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: commentId,
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
        // Initial state - has nested reply
        final topLevelReply = tester.commentReplyListState.replies.first;
        expect(topLevelReply.replies, hasLength(1));
        expect(topLevelReply.replies!.first.id, 'nested-reply-1');

        // Emit event to delete nested reply
        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: commentId,
              objectType: 'activity',
              userId: userId,
            ),
          ),
        );

        // Verify nested reply was removed
        final updatedTopLevelReply = tester.commentReplyListState.replies.first;
        expect(updatedTopLevelReply.replies, isEmpty);
        // Top-level reply should still exist
        expect(tester.commentReplyListState.replies, hasLength(1));
        expect(tester.commentReplyListState.replies.first.id, replyId);
      },
    );

    commentReplyListTest(
      'should not add nested reply if parentId does not match any existing reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Top-level reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has top-level reply
        expect(tester.commentReplyListState.replies, hasLength(1));
        final topLevelReply = tester.commentReplyListState.replies.first;
        expect(topLevelReply.replies, isNull);

        // Emit event for nested reply with parentId that doesn't match any existing reply
        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: commentId,
              objectType: 'activity',
              text: 'Nested reply',
              userId: userId,
            ).copyWith(parentId: 'non-existent-reply-id'),
          ),
        );

        // Verify nested reply was not added (parentId doesn't match parentCommentId or any existing reply)
        expect(tester.commentReplyListState.replies, hasLength(1));
        final updatedTopLevelReply = tester.commentReplyListState.replies.first;
        expect(updatedTopLevelReply.replies, isNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Comment Reply List - Reply Reactions
  // ============================================================

  group('Comment Reply List - Reply Reactions', () {
    commentReplyListTest(
      'should handle CommentReactionAddedEvent and update reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no reactions
        final initialReply = tester.commentReplyListState.replies.first;
        expect(initialReply.ownReactions, isEmpty);

        // Emit event
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'activity-1',
              commentId: replyId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has reaction
        final updatedReply = tester.commentReplyListState.replies.first;
        expect(updatedReply.ownReactions, hasLength(1));
        expect(updatedReply.ownReactions.first.type, reactionType);
      },
    );

    commentReplyListTest(
      'should handle CommentReactionDeletedEvent and remove reaction',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Test reply',
              userId: userId,
              ownReactions: [
                FeedsReactionResponse(
                  activityId: 'activity-1',
                  commentId: replyId,
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
        // Initial state - has reaction
        final initialReply = tester.commentReplyListState.replies.first;
        expect(initialReply.ownReactions, hasLength(1));

        // Emit event
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            comment: createDefaultCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'activity-1',
              commentId: replyId,
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify state has no reactions
        final updatedReply = tester.commentReplyListState.replies.first;
        expect(updatedReply.ownReactions, isEmpty);
      },
    );

    commentReplyListTest(
      'should handle CommentReactionAddedEvent and update nested reply',
      build: (client) => client.commentReplyList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultThreadedCommentResponse(
              id: replyId,
              objectId: commentId,
              objectType: 'activity',
              text: 'Top-level reply',
              userId: userId,
              replies: [
                createDefaultThreadedCommentResponse(
                  id: 'nested-reply-1',
                  objectId: commentId,
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
        // Initial state - nested reply has no reactions
        final topLevelReply = tester.commentReplyListState.replies.first;
        expect(topLevelReply.replies, hasLength(1));
        expect(topLevelReply.replies!.first.ownReactions, isEmpty);

        // Emit event to add reaction to nested reply
        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:john',
            activity: createDefaultActivityResponse(id: 'activity-1'),
            comment: createDefaultCommentResponse(
              id: 'nested-reply-1',
              objectId: commentId,
              objectType: 'activity',
              userId: userId,
            ),
            reaction: FeedsReactionResponse(
              activityId: 'activity-1',
              commentId: 'nested-reply-1',
              type: reactionType,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: userId),
            ),
          ),
        );

        // Verify nested reply has reaction
        final updatedTopLevelReply = tester.commentReplyListState.replies.first;
        expect(updatedTopLevelReply.replies, hasLength(1));
        expect(updatedTopLevelReply.replies!.first.ownReactions, hasLength(1));
        expect(
          updatedTopLevelReply.replies!.first.ownReactions.first.type,
          reactionType,
        );
      },
    );
  });
}

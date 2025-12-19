import 'package:collection/collection.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const query = CommentsQuery();

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Comment List - Query Operations', () {
    commentListTest(
      'get - should query initial comments via API',
      build: (client) => client.commentList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<CommentData>>>());
        final comments = result.getOrThrow();

        expect(comments, isA<List<CommentData>>());
        expect(comments, hasLength(3));
      },
    );

    commentListTest(
      'queryMoreComments - should load more comments via API',
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          comments: [
            createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
            createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
            createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comments
        expect(tester.commentListState.comments, hasLength(3));

        final nextPageQuery = tester.commentList.query.copyWith(
          next: tester.commentListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryComments(
            queryCommentsRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryCommentsResponse(
            prev: 'prev-cursor',
            comments: [
              createDefaultCommentResponse(id: 'comment-4', objectId: 'obj-1'),
            ],
          ),
        );

        // Query more comments
        final result = await tester.commentList.queryMoreComments();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, hasLength(1));

        // Verify state was updated with merged comments
        expect(tester.commentListState.comments, hasLength(4));
        expect(tester.commentListState.pagination?.next, isNull);
        expect(tester.commentListState.pagination?.previous, 'prev-cursor');
      },
      verify: (tester) {
        final nextPageQuery = tester.commentList.query.copyWith(
          next: tester.commentListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryComments(
            queryCommentsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    commentListTest(
      'queryMoreComments - should return empty list when no more comments',
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          comments: [
            createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
            createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
            createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has comments, no next cursor
        expect(tester.commentListState.comments, hasLength(3));
        expect(tester.commentListState.pagination?.next, isNull);

        // Query more comments when no next cursor
        final result = await tester.commentList.queryMoreComments();

        expect(result.isSuccess, isTrue);
        final comments = result.getOrNull();
        expect(comments, isNotNull);
        expect(comments, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Comment List - Event Handling', () {
    const currentUser = User(id: 'test_user');

    final initialComments = [
      createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
      createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
      createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
    ];

    commentListTest(
      'CommentAddedEvent - should add new comment',
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(comments: initialComments),
      ),
      body: (tester) async {
        expect(tester.commentListState.comments, hasLength(3));

        const newCommentId = 'comment-4';
        final newComment = createDefaultCommentResponse(
          id: newCommentId,
          objectId: 'obj-1',
        );

        await tester.emitEvent(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            activity: createDefaultActivityResponse(id: 'obj-1'),
            comment: newComment,
          ),
        );

        final comments = tester.commentListState.comments;
        expect(comments, hasLength(4));

        final addedComment = comments.firstWhereOrNull(
          (c) => c.id == newCommentId,
        );

        expect(addedComment, isNotNull);
        expect(addedComment!.id, equals(newCommentId));
      },
    );

    commentListTest(
      'CommentUpdatedEvent - should update existing comment',
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(comments: initialComments),
      ),
      body: (tester) async {
        expect(tester.commentListState.comments, hasLength(3));

        const updatedText = 'Updated comment text';
        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ).copyWith(text: updatedText),
          ),
        );

        final comments = tester.commentListState.comments;
        expect(comments, hasLength(3));

        final updatedComment = comments.firstWhereOrNull(
          (c) => c.id == 'comment-1',
        );

        expect(updatedComment, isNotNull);
        expect(updatedComment!.text, equals(updatedText));
      },
    );

    commentListTest(
      'CommentDeletedEvent - should remove comment',
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(comments: initialComments),
      ),
      body: (tester) async {
        expect(tester.commentListState.comments, hasLength(3));

        await tester.emitEvent(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ),
          ),
        );

        final comments = tester.commentListState.comments;
        expect(comments, hasLength(2));

        final deletedComment = comments.firstWhereOrNull(
          (c) => c.id == 'comment-1',
        );

        expect(deletedComment, isNull);
      },
    );

    commentListTest(
      'CommentReactionAddedEvent - should add reaction to comment',
      user: currentUser,
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          comments: [
            createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - no reactions
        var comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, isEmpty);

        await tester.emitEvent(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            activity: createDefaultActivityResponse(id: 'obj-1'),
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: currentUser.id,
              commentId: 'comment-1',
            ),
          ),
        );

        // Verify reaction was added
        comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, 'love');
      },
    );

    commentListTest(
      'CommentReactionUpdatedEvent - should replace user reaction',
      user: currentUser,
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          comments: [
            createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'wow',
                  userId: currentUser.id,
                  commentId: 'comment-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has 'wow' reaction
        var comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, 'wow');

        // Emit CommentReactionUpdatedEvent - replaces 'wow' with 'fire'
        await tester.emitEvent(
          CommentReactionUpdatedEvent(
            type: EventTypes.commentReactionUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            activity: createDefaultActivityResponse(id: 'obj-1'),
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
              latestReactions: [
                createDefaultReactionResponse(
                  reactionType: 'fire',
                  userId: currentUser.id,
                  commentId: 'comment-1',
                ),
              ],
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'fire',
              userId: currentUser.id,
              commentId: 'comment-1',
            ),
          ),
        );

        // Verify 'wow' was replaced with 'fire'
        comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, 'fire');
      },
    );

    commentListTest(
      'CommentReactionDeletedEvent - should remove reaction from comment',
      user: currentUser,
      build: (client) => client.commentList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(
          comments: [
            createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
              ownReactions: [
                createDefaultReactionResponse(
                  reactionType: 'love',
                  userId: currentUser.id,
                  commentId: 'comment-1',
                ),
              ],
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has 'love' reaction
        var comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, hasLength(1));
        expect(comment.ownReactions.first.type, 'love');

        // Emit CommentReactionDeletedEvent
        await tester.emitEvent(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ),
            reaction: createDefaultReactionResponse(
              reactionType: 'love',
              userId: currentUser.id,
              commentId: 'comment-1',
            ),
          ),
        );

        // Verify reaction was removed
        comment = tester.commentListState.comments.first;
        expect(comment.ownReactions, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('CommentListEventHandler - Local filtering', () {
    final initialComments = [
      createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
      createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
      createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
    ];

    commentListTest(
      'CommentUpdatedEvent - should remove comment when updated to non-matching status',
      build: (client) => client.commentList(
        CommentsQuery(
          filter: Filter.equal(CommentsFilterField.status, 'active'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(comments: initialComments),
      ),
      body: (tester) async {
        expect(tester.commentListState.comments, hasLength(3));

        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ).copyWith(status: 'deleted'),
          ),
        );

        expect(tester.commentListState.comments, hasLength(2));
      },
    );

    commentListTest(
      'No filter - should not remove comment when no filter specified',
      build: (client) => client.commentList(
        // No filter, all comments should be accepted
        const CommentsQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(comments: initialComments),
      ),
      body: (tester) async {
        expect(tester.commentListState.comments, hasLength(3));

        await tester.emitEvent(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            fid: 'user:source',
            comment: createDefaultCommentResponse(
              id: 'comment-1',
              objectId: 'obj-1',
            ).copyWith(status: 'deleted'),
          ),
        );

        expect(tester.commentListState.comments, hasLength(3));
      },
    );
  });
}

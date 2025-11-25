import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
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

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // CommentResponseStatusMapper.toModel() — all 6 wire-value cases
  // ============================================================

  group('CommentResponseStatusMapper.toModel()', () {
    test('active → "active"', () {
      expect(CommentResponseStatus.active.toModel(), 'active');
    });

    test('deleted → "deleted"', () {
      expect(CommentResponseStatus.deleted.toModel(), 'deleted');
    });

    test('hidden → "hidden"', () {
      expect(CommentResponseStatus.hidden.toModel(), 'hidden');
    });

    test('removed → "removed"', () {
      expect(CommentResponseStatus.removed.toModel(), 'removed');
    });

    test('shadowBlocked → "shadow_blocked" (snake_case conversion)', () {
      expect(CommentResponseStatus.shadowBlocked.toModel(), 'shadow_blocked');
    });

    test('unknown → "unknown"', () {
      expect(CommentResponseStatus.unknown.toModel(), 'unknown');
    });
  });

  // ============================================================
  // ThreadedCommentResponseStatusMapper.toModel() — all 6 wire-value cases
  // ============================================================

  group('ThreadedCommentResponseStatusMapper.toModel()', () {
    test('active → "active"', () {
      expect(ThreadedCommentResponseStatus.active.toModel(), 'active');
    });

    test('deleted → "deleted"', () {
      expect(ThreadedCommentResponseStatus.deleted.toModel(), 'deleted');
    });

    test('hidden → "hidden"', () {
      expect(ThreadedCommentResponseStatus.hidden.toModel(), 'hidden');
    });

    test('removed → "removed"', () {
      expect(ThreadedCommentResponseStatus.removed.toModel(), 'removed');
    });

    test('shadowBlocked → "shadow_blocked" (snake_case conversion)', () {
      expect(
        ThreadedCommentResponseStatus.shadowBlocked.toModel(),
        'shadow_blocked',
      );
    });

    test('unknown → "unknown"', () {
      expect(ThreadedCommentResponseStatus.unknown.toModel(), 'unknown');
    });
  });

  // ============================================================
  // CommentResponseMapper.toModel() — new fields + round-trip
  // ============================================================

  group('CommentResponseMapper.toModel()', () {
    test('bookmarkCount defaults to 0 and is forwarded', () {
      final response = createDefaultCommentResponse(
        objectId: 'act-1',
        bookmarkCount: 0,
      );

      expect(response.toModel().bookmarkCount, 0);
    });

    test('bookmarkCount non-zero is forwarded', () {
      final response = createDefaultCommentResponse(
        objectId: 'act-1',
        bookmarkCount: 5,
      );

      expect(response.toModel().bookmarkCount, 5);
    });

    test('editedAt null is forwarded', () {
      final response = createDefaultCommentResponse(
        objectId: 'act-1',
        editedAt: null,
      );

      expect(response.toModel().editedAt, isNull);
    });

    test('editedAt non-null is forwarded', () {
      final editedAt = DateTime(2024, 6, 1);
      final response = createDefaultCommentResponse(
        objectId: 'act-1',
        editedAt: editedAt,
      );

      expect(response.toModel().editedAt, editedAt);
    });

    test('status is mapped via CommentResponseStatusMapper', () {
      final response = createDefaultCommentResponse(
        objectId: 'act-1',
        status: CommentResponseStatus.shadowBlocked,
      );

      expect(response.toModel().status, 'shadow_blocked');
    });

    test('replies is always null (not loaded by default)', () {
      final response = createDefaultCommentResponse(objectId: 'act-1');

      expect(response.toModel().replies, isNull);
    });

    test('maps core fields correctly', () {
      final response = createDefaultCommentResponse(
        id: 'comment-99',
        objectId: 'act-1',
        text: 'hello world',
        userId: 'bob',
      );

      final result = response.toModel();

      expect(result.id, 'comment-99');
      expect(result.objectId, 'act-1');
      expect(result.text, 'hello world');
      expect(result.user.id, 'bob');
    });
  });

  // ============================================================
  // ThreadedCommentResponseMapper.toModel() — new fields + round-trip
  // ============================================================

  group('ThreadedCommentResponseMapper.toModel()', () {
    test('bookmarkCount is forwarded', () {
      final response = createDefaultThreadedCommentResponse(
        objectId: 'act-1',
        bookmarkCount: 3,
      );

      expect(response.toModel().bookmarkCount, 3);
    });

    test('editedAt is forwarded', () {
      final editedAt = DateTime(2024, 7, 15);
      final response = createDefaultThreadedCommentResponse(
        objectId: 'act-1',
        editedAt: editedAt,
      );

      expect(response.toModel().editedAt, editedAt);
    });

    test('status is mapped via ThreadedCommentResponseStatusMapper', () {
      final response = createDefaultThreadedCommentResponse(
        objectId: 'act-1',
        status: ThreadedCommentResponseStatus.shadowBlocked,
      );

      expect(response.toModel().status, 'shadow_blocked');
    });

    test('replies list is mapped when non-empty', () {
      final reply = createDefaultThreadedCommentResponse(
        id: 'reply-1',
        objectId: 'act-1',
        text: 'reply text',
      );
      final response = createDefaultThreadedCommentResponse(
        id: 'comment-1',
        objectId: 'act-1',
        replies: [reply],
      );

      final result = response.toModel();

      expect(result.replies, isNotNull);
      expect(result.replies, hasLength(1));
      expect(result.replies!.first.id, 'reply-1');
    });

    test('replies is null when empty list provided', () {
      final response = createDefaultThreadedCommentResponse(
        objectId: 'act-1',
        replies: const [],
      );

      // ThreadedCommentResponse stores null when list is empty in the factory
      expect(response.toModel().replies, isNull);
    });
  });
}

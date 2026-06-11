// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // ActivityResponseMapper.toModel()
  // ============================================================

  group('ActivityResponseMapper.toModel()', () {
    test('friendReactions: null source collapses to empty list', () {
      final response = createDefaultActivityResponse(
        id: 'act-1',
        friendReactions: null,
      );

      final result = response.toModel();

      expect(result.friendReactions, isEmpty);
    });

    test('friendReactions: non-null list is mapped to FeedsReactionData', () {
      final reaction = FeedsReactionResponse(
        activityId: 'act-1',
        type: 'like',
        createdAt: DateTime(2021, 1, 1),
        updatedAt: DateTime(2021, 2, 1),
        user: createDefaultUserResponse(id: 'user-1'),
      );
      final response = createDefaultActivityResponse(
        id: 'act-1',
        friendReactions: [reaction],
      );

      final result = response.toModel();

      expect(result.friendReactions, hasLength(1));
      expect(result.friendReactions.first.type, 'like');
    });

    test('metrics: null source defaults to empty map', () {
      final response = createDefaultActivityResponse(
        id: 'act-1',
        metrics: null,
      );

      final result = response.toModel();

      expect(result.metrics, isEmpty);
    });

    test('metrics: provided map is forwarded', () {
      final response = createDefaultActivityResponse(
        id: 'act-1',
        metrics: {'click_count': 42, 'impression_count': 100},
      );

      final result = response.toModel();

      expect(result.metrics['click_count'], 42);
      expect(result.metrics['impression_count'], 100);
    });

    test('friendReactionCount is forwarded as-is (null)', () {
      final response = createDefaultActivityResponse(
        id: 'act-1',
        friendReactionCount: null,
      );

      expect(response.toModel().friendReactionCount, isNull);
    });

    test('friendReactionCount is forwarded as-is (non-null)', () {
      final response = createDefaultActivityResponse(
        id: 'act-1',
        friendReactionCount: 7,
      );

      expect(response.toModel().friendReactionCount, 7);
    });

    test('isRead is forwarded (null)', () {
      final response = createDefaultActivityResponse(id: 'act-1', isRead: null);
      expect(response.toModel().isRead, isNull);
    });

    test('isRead is forwarded (true)', () {
      final response = createDefaultActivityResponse(id: 'act-1', isRead: true);
      expect(response.toModel().isRead, isTrue);
    });

    test('isSeen is forwarded (null)', () {
      final response = createDefaultActivityResponse(id: 'act-1', isSeen: null);
      expect(response.toModel().isSeen, isNull);
    });

    test('isSeen is forwarded (false)', () {
      final response = createDefaultActivityResponse(id: 'act-1', isSeen: false);
      expect(response.toModel().isSeen, isFalse);
    });

    test('maps core fields correctly', () {
      final response = createDefaultActivityResponse(
        id: 'act-42',
        type: 'share',
        userId: 'alice',
      );

      final result = response.toModel();

      expect(result.id, 'act-42');
      expect(result.type, 'share');
      expect(result.user.id, 'alice');
    });
  });
}

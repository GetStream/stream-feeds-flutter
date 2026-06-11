import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FeedsReactionGroupResponseMapper.toModel()
  // ============================================================

  group('FeedsReactionGroupResponseMapper.toModel()', () {
    test('count is forwarded', () {
      final response = createDefaultFeedsReactionGroupResponse(count: 7);
      expect(response.toModel().count, 7);
    });

    test('firstReactionAt is forwarded', () {
      final firstAt = DateTime(2021, 3, 1);
      final response = createDefaultFeedsReactionGroupResponse(
        firstReactionAt: firstAt,
      );
      expect(response.toModel().firstReactionAt, firstAt);
    });

    test('lastReactionAt is forwarded', () {
      final lastAt = DateTime(2022, 6, 15);
      final response = createDefaultFeedsReactionGroupResponse(
        lastReactionAt: lastAt,
      );
      expect(response.toModel().lastReactionAt, lastAt);
    });

    test('maps to ReactionGroupData with all fields', () {
      final first = DateTime(2021, 1, 1);
      final last = DateTime(2021, 12, 31);
      final response = createDefaultFeedsReactionGroupResponse(
        count: 42,
        firstReactionAt: first,
        lastReactionAt: last,
      );

      final result = response.toModel();

      expect(result, isA<ReactionGroupData>());
      expect(result.count, 42);
      expect(result.firstReactionAt, first);
      expect(result.lastReactionAt, last);
    });
  });
}

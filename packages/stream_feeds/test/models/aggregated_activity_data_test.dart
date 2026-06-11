import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // AggregatedActivityResponseMapper.toModel()
  // ============================================================

  group('AggregatedActivityResponseMapper.toModel()', () {
    test('isRead null is forwarded', () {
      final response = createDefaultAggregatedActivityResponse();

      expect(response.toModel().isRead, isNull);
    });

    test('isSeen null is forwarded', () {
      final response = createDefaultAggregatedActivityResponse();

      expect(response.toModel().isSeen, isNull);
    });

    test('isRead true is forwarded', () {
      final response = createDefaultAggregatedActivityResponse().copyWith(
        isRead: true,
      );

      expect(response.toModel().isRead, isTrue);
    });

    test('isSeen false is forwarded', () {
      final response = createDefaultAggregatedActivityResponse().copyWith(
        isSeen: false,
      );

      expect(response.toModel().isSeen, isFalse);
    });

    test('activities are mapped to ActivityData instances', () {
      final response = createDefaultAggregatedActivityResponse(
        activities: [
          createDefaultActivityResponse(id: 'act-1'),
          createDefaultActivityResponse(id: 'act-2'),
        ],
      );

      final result = response.toModel();

      expect(result.activities, hasLength(2));
      expect(result.activities[0].id, 'act-1');
      expect(result.activities[1].id, 'act-2');
    });

    test('core fields are forwarded correctly', () {
      final response = createDefaultAggregatedActivityResponse(group: 'likes');

      final result = response.toModel();

      expect(result.group, 'likes');
      expect(result.activityCount, isNonNegative);
      expect(result.userCount, isNonNegative);
    });
  });
}

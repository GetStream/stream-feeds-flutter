import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('ActivityResponseRestrictRepliesMapper', () {
    test('maps everyone to everyone', () {
      expect(
        ActivityResponseRestrictReplies.everyone.toModel(),
        equals(ActivityRestrictReplies.everyone),
      );
    });

    test('maps nobody to nobody', () {
      expect(
        ActivityResponseRestrictReplies.nobody.toModel(),
        equals(ActivityRestrictReplies.nobody),
      );
    });

    test('maps peopleIFollow to peopleIFollow', () {
      expect(
        ActivityResponseRestrictReplies.peopleIFollow.toModel(),
        equals(ActivityRestrictReplies.peopleIFollow),
      );
    });

    test('maps unknown to unknown', () {
      expect(
        ActivityResponseRestrictReplies.unknown.toModel(),
        equals(ActivityRestrictReplies.unknown),
      );
    });
  });

  group('ActivityResponseMapper - restrictReplies', () {
    test('maps nobody restrictReplies through ActivityResponseMapper', () {
      final response = createDefaultActivityResponse(
        restrictReplies: ActivityResponseRestrictReplies.nobody,
      );
      final model = response.toModel();
      expect(model.restrictReplies, equals(ActivityRestrictReplies.nobody));
    });

    test('maps peopleIFollow restrictReplies through ActivityResponseMapper', () {
      final response = createDefaultActivityResponse(
        restrictReplies: ActivityResponseRestrictReplies.peopleIFollow,
      );
      final model = response.toModel();
      expect(
        model.restrictReplies,
        equals(ActivityRestrictReplies.peopleIFollow),
      );
    });

    test('maps everyone restrictReplies through ActivityResponseMapper', () {
      final response = createDefaultActivityResponse(
        restrictReplies: ActivityResponseRestrictReplies.everyone,
      );
      final model = response.toModel();
      expect(model.restrictReplies, equals(ActivityRestrictReplies.everyone));
    });
  });

  group('FeedAddActivityRequest - restrictReplies', () {
    test('stores restrictReplies field', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        restrictReplies: AddActivityRequestRestrictReplies.nobody,
      );
      expect(
        request.restrictReplies,
        equals(AddActivityRequestRestrictReplies.nobody),
      );
    });

    test('restrictReplies defaults to null', () {
      const request = FeedAddActivityRequest(type: 'post');
      expect(request.restrictReplies, isNull);
    });
  });
}

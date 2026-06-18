import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
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

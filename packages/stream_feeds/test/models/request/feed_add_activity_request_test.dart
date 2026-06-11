// ignore_for_file: prefer_int_literals, avoid_redundant_argument_values, avoid_relative_imports_for_non_public_files

// Import the internal file to access FeedAddActivityRequestMapper.toRequest()
// which is intentionally not re-exported from the public stream_feeds.dart.
// We import only from the internal source and stream_feeds_test to avoid
// type-identity conflicts caused by double-importing generated types.
import 'package:stream_feeds/src/generated/api/models.dart' show Location;
import 'package:stream_feeds/src/models/request/feed_add_activity_request.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FeedAddActivityRequestMapper.toRequest()
  // ============================================================

  group('FeedAddActivityRequestMapper.toRequest() — new bool fields', () {
    test('createNotificationActivity null is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        createNotificationActivity: null,
      );
      expect(request.toRequest().createNotificationActivity, isNull);
    });

    test('createNotificationActivity true is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        createNotificationActivity: true,
      );
      expect(request.toRequest().createNotificationActivity, isTrue);
    });

    test('createNotificationActivity false is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        createNotificationActivity: false,
      );
      expect(request.toRequest().createNotificationActivity, isFalse);
    });

    test('enrichOwnFields null is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        enrichOwnFields: null,
      );
      expect(request.toRequest().enrichOwnFields, isNull);
    });

    test('enrichOwnFields true is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        enrichOwnFields: true,
      );
      expect(request.toRequest().enrichOwnFields, isTrue);
    });

    test('skipPush null is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        skipPush: null,
      );
      expect(request.toRequest().skipPush, isNull);
    });

    test('skipPush true is forwarded', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        skipPush: true,
      );
      expect(request.toRequest().skipPush, isTrue);
    });
  });

  group('FeedAddActivityRequestMapper.toRequest() — location field', () {
    test('null location is forwarded', () {
      const request = FeedAddActivityRequest(type: 'post', location: null);
      expect(request.toRequest().location, isNull);
    });

    test('non-null Location is forwarded to the API request', () {
      const loc = Location(lat: 52.0, lng: 4.0);
      const request = FeedAddActivityRequest(type: 'post', location: loc);

      final apiRequest = request.toRequest();

      expect(apiRequest.location, isNotNull);
      expect(apiRequest.location!.lat, 52.0);
      expect(apiRequest.location!.lng, 4.0);
    });
  });

  group('FeedAddActivityRequestMapper.toRequest() — core fields', () {
    test('type is forwarded', () {
      const request = FeedAddActivityRequest(type: 'share');
      expect(request.toRequest().type, 'share');
    });

    test('all new and existing fields in combination', () {
      const request = FeedAddActivityRequest(
        type: 'post',
        text: 'Hello',
        createNotificationActivity: true,
        enrichOwnFields: false,
        skipPush: true,
        location: Location(lat: 1.0, lng: 2.0),
      );

      final result = request.toRequest();

      expect(result.type, 'post');
      expect(result.text, 'Hello');
      expect(result.createNotificationActivity, isTrue);
      expect(result.enrichOwnFields, isFalse);
      expect(result.skipPush, isTrue);
      expect(result.location!.lat, 1.0);
    });
  });
}

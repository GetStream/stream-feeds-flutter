// ignore_for_file: prefer_int_literals, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FeedSuggestionResponseMapper.toModel() — location mapping
  // ============================================================

  group('FeedSuggestionResponseMapper.toModel() — location', () {
    test('null location maps to null', () {
      final response = createDefaultFeedSuggestionResponse(location: null);
      expect(response.toModel().feed.location, isNull);
    });

    test('location lat/lng are mapped to latitude/longitude', () {
      final response = createDefaultFeedSuggestionResponse(
        location: const Location(lat: 48.8566, lng: 2.3522),
      );

      final result = response.toModel().feed;

      expect(result.location, isNotNull);
      expect(result.location!.latitude, 48.8566);
      expect(result.location!.longitude, 2.3522);
    });

    test('location field name swap: lat → latitude, lng → longitude', () {
      final response = createDefaultFeedSuggestionResponse(
        location: const Location(lat: 1.0, lng: 2.0),
      );

      final feedLocation = response.toModel().feed.location!;

      expect(feedLocation.latitude, 1.0);
      expect(feedLocation.longitude, 2.0);
    });
  });

  // ============================================================
  // FeedSuggestionResponseMapper.toModel() — ownCapabilities mapping
  // ============================================================

  group('FeedSuggestionResponseMapper.toModel() — ownCapabilities', () {
    test('null ownCapabilities defaults to empty list', () {
      final response = createDefaultFeedSuggestionResponse(
        ownCapabilities: null,
      );
      expect(response.toModel().feed.ownCapabilities, isEmpty);
    });

    test('ownCapabilities list is mapped to FeedOwnCapability values', () {
      final response = createDefaultFeedSuggestionResponse(
        ownCapabilities: [
          FeedSuggestionResponseOwnCapabilities.readFeed,
          FeedSuggestionResponseOwnCapabilities.follow,
        ],
      );

      final result = response.toModel().feed.ownCapabilities;

      expect(result, hasLength(2));
      expect(result, contains(FeedOwnCapability.readFeed));
      expect(result, contains(FeedOwnCapability.follow));
    });
  });

  // ============================================================
  // FeedSuggestionResponseOwnCapabilitiesMapper.toModel()
  // ============================================================

  group('FeedSuggestionResponseOwnCapabilitiesMapper.toModel()', () {
    test('maps addActivity to FeedOwnCapability.addActivity', () {
      expect(
        FeedSuggestionResponseOwnCapabilities.addActivity.toModel(),
        FeedOwnCapability.addActivity,
      );
    });

    test('maps readFeed to FeedOwnCapability.readFeed', () {
      expect(
        FeedSuggestionResponseOwnCapabilities.readFeed.toModel(),
        FeedOwnCapability.readFeed,
      );
    });

    test('maps unknown to FeedOwnCapability.unknown', () {
      expect(
        FeedSuggestionResponseOwnCapabilities.unknown.toModel(),
        FeedOwnCapability.unknown,
      );
    });
  });

  // ============================================================
  // FeedSuggestionResponseVisibilityMapper.toModel() — all 6 cases
  // ============================================================

  group('FeedSuggestionResponseVisibilityMapper.toModel()', () {
    test('followers → "followers"', () {
      expect(FeedSuggestionResponseVisibility.followers.toModel(), 'followers');
    });

    test('members → "members"', () {
      expect(FeedSuggestionResponseVisibility.members.toModel(), 'members');
    });

    test('private → "private"', () {
      expect(FeedSuggestionResponseVisibility.private.toModel(), 'private');
    });

    test('public → "public"', () {
      expect(FeedSuggestionResponseVisibility.public.toModel(), 'public');
    });

    test('visible → "visible"', () {
      expect(FeedSuggestionResponseVisibility.visible.toModel(), 'visible');
    });

    test('unknown → "unknown"', () {
      expect(FeedSuggestionResponseVisibility.unknown.toModel(), 'unknown');
    });
  });

  // ============================================================
  // FeedSuggestionResponseMapper.toModel() — visibility mapping
  // ============================================================

  group('FeedSuggestionResponseMapper.toModel() — visibility', () {
    test('members visibility is forwarded through the feed', () {
      final response = createDefaultFeedSuggestionResponse(
        visibility: FeedSuggestionResponseVisibility.members,
      );

      expect(response.toModel().feed.visibility, 'members');
    });

    test('public visibility is forwarded through the feed', () {
      final response = createDefaultFeedSuggestionResponse(
        visibility: FeedSuggestionResponseVisibility.public,
      );

      expect(response.toModel().feed.visibility, 'public');
    });
  });

  // ============================================================
  // FeedSuggestionResponseMapper.toModel() — suggestion-specific fields
  // ============================================================

  group('FeedSuggestionResponseMapper.toModel() — suggestion fields', () {
    test('algorithmScores is forwarded', () {
      final response = createDefaultFeedSuggestionResponse(
        algorithmScores: {'collab_filter': 0.9},
      );

      expect(response.toModel().algorithmScores, {'collab_filter': 0.9});
    });

    test('reason is forwarded', () {
      final response = createDefaultFeedSuggestionResponse(
        reason: 'Based on your interests',
      );

      expect(response.toModel().reason, 'Based on your interests');
    });

    test('recommendationScore is forwarded', () {
      final response = createDefaultFeedSuggestionResponse(
        recommendationScore: 0.85,
      );

      expect(response.toModel().recommendationScore, 0.85);
    });
  });
}

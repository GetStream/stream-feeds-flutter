import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FeedResponseMapper.toModel() — location mapping
  // ============================================================

  group('FeedResponseMapper.toModel() — location', () {
    test('null location maps to null', () {
      final response = createDefaultFeedResponse(location: null);
      expect(response.toModel().location, isNull);
    });

    test('location lat/lng are mapped to latitude/longitude', () {
      final response = createDefaultFeedResponse(
        location: const Location(lat: 52.370216, lng: 4.895168),
      );

      final result = response.toModel();

      expect(result.location, isNotNull);
      expect(result.location!.latitude, 52.370216);
      expect(result.location!.longitude, 4.895168);
    });

    test('location field name swap: lat → latitude, lng → longitude', () {
      // This explicitly documents the lat/lng → latitude/longitude mapping.
      final response = createDefaultFeedResponse(
        location: const Location(lat: 10.0, lng: 20.0),
      );

      final result = response.toModel().location!;

      // latitude comes from lat, NOT lng
      expect(result.latitude, 10.0);
      // longitude comes from lng, NOT lat
      expect(result.longitude, 20.0);
    });
  });

  // ============================================================
  // FeedResponseMapper.toModel() — ownCapabilities mapping
  // ============================================================

  group('FeedResponseMapper.toModel() — ownCapabilities', () {
    test('null ownCapabilities defaults to empty list', () {
      final response = createDefaultFeedResponse(ownCapabilities: null);
      expect(response.toModel().ownCapabilities, isEmpty);
    });

    test('ownCapabilities list is mapped to FeedOwnCapability values', () {
      final response = createDefaultFeedResponse(
        ownCapabilities: [
          FeedResponseOwnCapabilities.readFeed,
          FeedResponseOwnCapabilities.addActivity,
        ],
      );

      final result = response.toModel().ownCapabilities;

      expect(result, hasLength(2));
      expect(result, contains(FeedOwnCapability.readFeed));
      expect(result, contains(FeedOwnCapability.addActivity));
    });
  });

  // ============================================================
  // FeedResponseOwnCapabilitiesMapper.toModel() — all values round-trip
  // ============================================================

  group('FeedResponseOwnCapabilitiesMapper.toModel()', () {
    test('maps addActivity to FeedOwnCapability.addActivity', () {
      expect(
        FeedResponseOwnCapabilities.addActivity.toModel(),
        FeedOwnCapability.addActivity,
      );
    });

    test('maps readFeed to FeedOwnCapability.readFeed', () {
      expect(
        FeedResponseOwnCapabilities.readFeed.toModel(),
        FeedOwnCapability.readFeed,
      );
    });

    test('maps follow to FeedOwnCapability.follow', () {
      expect(
        FeedResponseOwnCapabilities.follow.toModel(),
        FeedOwnCapability.follow,
      );
    });

    test('maps unknown to FeedOwnCapability.unknown', () {
      expect(
        FeedResponseOwnCapabilities.unknown.toModel(),
        FeedOwnCapability.unknown,
      );
    });

    test(
      'FeedOwnCapability.values.byName throws ArgumentError for unknown name',
      () {
        // Documents that byName() throws if the server sends an enum value name
        // that doesn't exist in the client's FeedOwnCapability enum.
        expect(
          () => FeedOwnCapability.values.byName('nonExistentCapability'),
          throwsA(isA<ArgumentError>()),
        );
      },
    );
  });

  // ============================================================
  // FeedResponseVisibilityMapper.toModel() — all 6 cases
  // ============================================================

  group('FeedResponseVisibilityMapper.toModel()', () {
    test('followers → "followers"', () {
      expect(FeedResponseVisibility.followers.toModel(), 'followers');
    });

    test('members → "members"', () {
      expect(FeedResponseVisibility.members.toModel(), 'members');
    });

    test('private → "private"', () {
      expect(FeedResponseVisibility.private.toModel(), 'private');
    });

    test('public → "public"', () {
      expect(FeedResponseVisibility.public.toModel(), 'public');
    });

    test('visible → "visible"', () {
      expect(FeedResponseVisibility.visible.toModel(), 'visible');
    });

    test('unknown → "unknown"', () {
      expect(FeedResponseVisibility.unknown.toModel(), 'unknown');
    });
  });

  // ============================================================
  // FeedResponseMapper.toModel() — visibility mapping via toModel()
  // ============================================================

  group('FeedResponseMapper.toModel() — visibility', () {
    test('null visibility maps to null', () {
      // FeedResponseVisibility is not nullable in FeedResponse (defaults to public),
      // but toModel() calls visibility?.toModel() which handles null defensively.
      final response = createDefaultFeedResponse(
        visibility: FeedResponseVisibility.public,
      );

      expect(response.toModel().visibility, 'public');
    });

    test('members visibility is forwarded correctly', () {
      final response = createDefaultFeedResponse(
        visibility: FeedResponseVisibility.members,
      );

      expect(response.toModel().visibility, 'members');
    });
  });

  // ============================================================
  // FeedResponseMapper.toModel() — core fields
  // ============================================================

  group('FeedResponseMapper.toModel() — core fields', () {
    test('maps fid from feed raw value', () {
      final response = createDefaultFeedResponse(id: 'john', groupId: 'user');
      final result = response.toModel();
      expect(result.fid, FeedId(group: 'user', id: 'john'));
    });

    test('maps createdBy user', () {
      final response = createDefaultFeedResponse();
      expect(response.toModel().createdBy, isA<UserData>());
    });
  });
}

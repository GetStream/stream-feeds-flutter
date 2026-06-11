// ignore_for_file: avoid_redundant_argument_values, avoid_relative_imports_for_non_public_files

import 'package:stream_feeds/src/repository/capabilities_repository.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  late MockDefaultApi mockApi;
  late CapabilitiesRepository repository;

  setUp(() {
    mockApi = MockDefaultApi();
    repository = CapabilitiesRepository(mockApi);
    registerFallbackValue(const OwnBatchRequest(feeds: []));
  });

  tearDown(() => repository.dispose());

  // ============================================================
  // fetchCapabilities — happy path
  // ============================================================

  group('CapabilitiesRepository.fetchCapabilities() — mapping', () {
    test('known capabilities map to the canonical FeedOwnCapability values', () async {
      when(
        () => mockApi.ownBatch(
          ownBatchRequest: any(named: 'ownBatchRequest'),
        ),
      ).thenAnswer(
        (_) async => const Result.success(
          OwnBatchResponse(
            duration: '10ms',
            data: {
              'user:john': FeedOwnData(
                ownCapabilities: [
                  FeedOwnDataOwnCapabilities.readFeed,
                  FeedOwnDataOwnCapabilities.addActivity,
                  FeedOwnDataOwnCapabilities.follow,
                ],
              ),
            },
          ),
        ),
      );

      final result = await repository.fetchCapabilities(feeds: ['user:john']);

      expect(result.isSuccess, isTrue);
      final capabilities = result.getOrThrow();
      expect(capabilities['user:john'], isNotNull);
      expect(
        capabilities['user:john'],
        containsAll([
          FeedOwnCapability.readFeed,
          FeedOwnCapability.addActivity,
          FeedOwnCapability.follow,
        ]),
      );
    });

    test('maps unknown capability enum value to FeedOwnCapability.unknown', () async {
      when(
        () => mockApi.ownBatch(
          ownBatchRequest: any(named: 'ownBatchRequest'),
        ),
      ).thenAnswer(
        (_) async => const Result.success(
          OwnBatchResponse(
            duration: '10ms',
            data: {
              'user:john': FeedOwnData(
                ownCapabilities: [FeedOwnDataOwnCapabilities.unknown],
              ),
            },
          ),
        ),
      );

      final result = await repository.fetchCapabilities(feeds: ['user:john']);

      expect(result.isSuccess, isTrue);
      final capabilities = result.getOrThrow();
      expect(capabilities['user:john'], contains(FeedOwnCapability.unknown));
    });

    test('feeds with null ownCapabilities are omitted from the result', () async {
      when(
        () => mockApi.ownBatch(
          ownBatchRequest: any(named: 'ownBatchRequest'),
        ),
      ).thenAnswer(
        (_) async => const Result.success(
          OwnBatchResponse(
            duration: '10ms',
            data: {'user:john': FeedOwnData(ownCapabilities: null)},
          ),
        ),
      );

      final result = await repository.fetchCapabilities(feeds: ['user:john']);

      expect(result.isSuccess, isTrue);
      expect(result.getOrThrow(), isEmpty);
    });

    test('maps multiple feeds in one response', () async {
      when(
        () => mockApi.ownBatch(
          ownBatchRequest: any(named: 'ownBatchRequest'),
        ),
      ).thenAnswer(
        (_) async => const Result.success(
          OwnBatchResponse(
            duration: '10ms',
            data: {
              'user:alice': FeedOwnData(
                ownCapabilities: [FeedOwnDataOwnCapabilities.readFeed],
              ),
              'user:bob': FeedOwnData(
                ownCapabilities: [FeedOwnDataOwnCapabilities.addActivity],
              ),
            },
          ),
        ),
      );

      final result = await repository.fetchCapabilities(
        feeds: ['user:alice', 'user:bob'],
      );

      expect(result.isSuccess, isTrue);
      final capabilities = result.getOrThrow();
      expect(capabilities['user:alice'], contains(FeedOwnCapability.readFeed));
      expect(capabilities['user:bob'], contains(FeedOwnCapability.addActivity));
    });
  });

  // ============================================================
  // FeedOwnCapability.values.byName — edge case documentation
  // ============================================================

  group('FeedOwnCapability.values.byName — edge case', () {
    test(
      'throws ArgumentError for a capability name not in the local enum',
      () {
        // CRASH RISK: If the server ever adds a new capability whose Dart enum
        // identifier name doesn't exist in the client's FeedOwnCapability enum,
        // byName() will throw ArgumentError and crash the feed load.
        // In practice this is protected by the @JsonKey(unknownEnumValue: unknown)
        // on FeedOwnDataOwnCapabilities, which maps unknown server values to
        // FeedOwnDataOwnCapabilities.unknown — whose name ('unknown') IS in
        // FeedOwnCapability. This test documents the underlying risk.
        expect(
          () => FeedOwnCapability.values.byName('aNonExistentCapabilityName'),
          throwsA(isA<ArgumentError>()),
        );
      },
    );
  });
}

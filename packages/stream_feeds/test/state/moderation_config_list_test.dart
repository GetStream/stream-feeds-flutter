import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Moderation Config List - Query Operations', () {
    const query = ModerationConfigsQuery();

    moderationConfigListTest(
      'get - should query initial moderation configs via API',
      build: (client) => client.moderationConfigList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<ModerationConfigData>>>());
        final configs = result.getOrThrow();

        expect(configs, isA<List<ModerationConfigData>>());
        expect(configs, hasLength(3));
      },
    );

    moderationConfigListTest(
      'queryMoreConfigs - should load more configs via API',
      build: (client) => client.moderationConfigList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          configs: [createDefaultModerationConfigResponse(key: 'config-1')],
        ),
      ),
      body: (tester) async {
        // Initial state - has config
        expect(tester.moderationConfigListState.configs, hasLength(1));
        expect(tester.moderationConfigListState.canLoadMore, isTrue);

        final nextPageQuery = tester.moderationConfigList.query.copyWith(
          next: tester.moderationConfigListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryModerationConfigs(
            queryModerationConfigsRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryModerationConfigsResponse(
            configs: [createDefaultModerationConfigResponse(key: 'config-2')],
          ),
        );

        // Query more configs
        final result = await tester.moderationConfigList.queryMoreConfigs();

        expect(result.isSuccess, isTrue);
        final configs = result.getOrNull();
        expect(configs, isNotNull);
        expect(configs, hasLength(1));

        // Verify state was updated with merged configs
        expect(tester.moderationConfigListState.configs, hasLength(2));
        expect(tester.moderationConfigListState.canLoadMore, isFalse);
      },
      verify: (tester) {
        final nextPageQuery = tester.moderationConfigList.query.copyWith(
          next: tester.moderationConfigListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryModerationConfigs(
            queryModerationConfigsRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    moderationConfigListTest(
      'queryMoreConfigs - should return empty list when no more configs',
      build: (client) => client.moderationConfigList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          configs: [createDefaultModerationConfigResponse(key: 'config-1')],
        ),
      ),
      body: (tester) async {
        // Initial state - has config but no pagination
        expect(tester.moderationConfigListState.configs, hasLength(1));
        expect(tester.moderationConfigListState.canLoadMore, isFalse);
        // Query more configs (should return empty immediately)
        final result = await tester.moderationConfigList.queryMoreConfigs();

        expect(result.isSuccess, isTrue);
        final configs = result.getOrNull();
        expect(configs, isEmpty);

        // State should remain unchanged
        expect(tester.moderationConfigListState.configs, hasLength(1));
      },
    );
  });
}

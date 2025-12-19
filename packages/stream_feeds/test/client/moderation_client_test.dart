// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Ban Operations
  // ============================================================

  group('ban', () {
    setUpAll(() {
      registerFallbackValue(const BanRequest(targetUserId: 'fallback'));
    });

    moderationClientTest(
      'should ban user successfully',
      body: (tester) async {
        const request = BanRequest(targetUserId: 'user-123');

        tester.mockApi(
          (api) => api.ban(banRequest: request),
          result: createDefaultBanResponse(),
        );

        final result = await tester.moderation.ban(banRequest: request);

        expect(result.isSuccess, isTrue);
        tester.verifyApi((api) => api.ban(banRequest: request));
      },
    );

    moderationClientTest(
      'should handle ban failure',
      body: (tester) async {
        const request = BanRequest(targetUserId: 'user-123');

        tester.mockApiFailure(
          (api) => api.ban(banRequest: request),
          error: Exception('Failed to ban user'),
        );

        final result = await tester.moderation.ban(banRequest: request);

        expect(result.isFailure, isTrue);
        tester.verifyApi((api) => api.ban(banRequest: request));
      },
    );
  });

  // ============================================================
  // FEATURE: Mute Operations
  // ============================================================

  group('mute', () {
    setUpAll(() {
      registerFallbackValue(const MuteRequest(targetIds: []));
    });

    moderationClientTest(
      'should mute users successfully',
      body: (tester) async {
        const request = MuteRequest(targetIds: ['user-123']);

        tester.mockApi(
          (api) => api.mute(muteRequest: request),
          result: createDefaultMuteResponse(),
        );

        final result = await tester.moderation.mute(muteRequest: request);

        expect(result.isSuccess, isTrue);
        tester.verifyApi((api) => api.mute(muteRequest: request));
      },
    );

    moderationClientTest(
      'should handle mute failure',
      body: (tester) async {
        const request = MuteRequest(targetIds: ['user-123']);

        tester.mockApiFailure(
          (api) => api.mute(muteRequest: request),
          error: Exception('Failed to mute user'),
        );

        final result = await tester.moderation.mute(muteRequest: request);

        expect(result.isFailure, isTrue);
        tester.verifyApi((api) => api.mute(muteRequest: request));
      },
    );
  });

  // ============================================================
  // FEATURE: Block Operations
  // ============================================================

  group('blockUsers', () {
    setUpAll(() {
      registerFallbackValue(const BlockUsersRequest(blockedUserId: 'fallback'));
    });

    moderationClientTest(
      'should block user successfully',
      body: (tester) async {
        const request = BlockUsersRequest(blockedUserId: 'user-123');

        tester.mockApi(
          (api) => api.blockUsers(blockUsersRequest: request),
          result: createDefaultBlockUsersResponse(blockedUserId: 'user-123'),
        );

        final result = await tester.moderation.blockUsers(
          blockUsersRequest: request,
        );

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.blockUsers(blockUsersRequest: request),
        );
      },
    );

    moderationClientTest(
      'should handle block failure',
      body: (tester) async {
        const request = BlockUsersRequest(blockedUserId: 'user-123');

        tester.mockApiFailure(
          (api) => api.blockUsers(blockUsersRequest: request),
          error: Exception('Failed to block user'),
        );

        final result = await tester.moderation.blockUsers(
          blockUsersRequest: request,
        );

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.blockUsers(blockUsersRequest: request),
        );
      },
    );
  });

  group('unblockUsers', () {
    setUpAll(() {
      registerFallbackValue(
        const UnblockUsersRequest(blockedUserId: 'fallback'),
      );
    });

    moderationClientTest(
      'should unblock user successfully',
      body: (tester) async {
        const request = UnblockUsersRequest(blockedUserId: 'user-123');

        tester.mockApi(
          (api) => api.unblockUsers(unblockUsersRequest: request),
          result: createDefaultUnblockUsersResponse(),
        );

        final result = await tester.moderation.unblockUsers(
          unblockUsersRequest: request,
        );

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.unblockUsers(unblockUsersRequest: request),
        );
      },
    );

    moderationClientTest(
      'should handle unblock failure',
      body: (tester) async {
        const request = UnblockUsersRequest(blockedUserId: 'user-123');

        tester.mockApiFailure(
          (api) => api.unblockUsers(unblockUsersRequest: request),
          error: Exception('Failed to unblock user'),
        );

        final result = await tester.moderation.unblockUsers(
          unblockUsersRequest: request,
        );

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.unblockUsers(unblockUsersRequest: request),
        );
      },
    );
  });

  group('getBlockedUsers', () {
    moderationClientTest(
      'should get blocked users successfully',
      body: (tester) async {
        tester.mockApi(
          (api) => api.getBlockedUsers(),
          result: createDefaultGetBlockedUsersResponse(
            blocks: [
              createDefaultBlockedUserResponse(blockedUserId: 'user-123'),
            ],
          ),
        );

        final result = await tester.moderation.getBlockedUsers();

        expect(result.isSuccess, isTrue);
        tester.verifyApi((api) => api.getBlockedUsers());
      },
    );

    moderationClientTest(
      'should handle get blocked users failure',
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.getBlockedUsers(),
          error: Exception('Failed to get blocked users'),
        );

        final result = await tester.moderation.getBlockedUsers();

        expect(result.isFailure, isTrue);
        tester.verifyApi((api) => api.getBlockedUsers());
      },
    );
  });

  // ============================================================
  // FEATURE: Flag Operations
  // ============================================================

  group('flag', () {
    setUpAll(() {
      registerFallbackValue(
        const FlagRequest(entityId: 'fallback', entityType: 'fallback'),
      );
    });

    moderationClientTest(
      'should flag content successfully',
      body: (tester) async {
        const request = FlagRequest(
          entityId: 'activity-123',
          entityType: 'activity',
        );

        tester.mockApi(
          (api) => api.flag(flagRequest: request),
          result: createDefaultFlagResponse(itemId: 'activity-123'),
        );

        final result = await tester.moderation.flag(flagRequest: request);

        expect(result.isSuccess, isTrue);
        tester.verifyApi((api) => api.flag(flagRequest: request));
      },
    );

    moderationClientTest(
      'should handle flag failure',
      body: (tester) async {
        const request = FlagRequest(
          entityId: 'activity-123',
          entityType: 'activity',
        );

        tester.mockApiFailure(
          (api) => api.flag(flagRequest: request),
          error: Exception('Failed to flag content'),
        );

        final result = await tester.moderation.flag(flagRequest: request);

        expect(result.isFailure, isTrue);
        tester.verifyApi((api) => api.flag(flagRequest: request));
      },
    );
  });

  // ============================================================
  // FEATURE: Moderation Actions
  // ============================================================

  group('submitAction', () {
    setUpAll(() {
      registerFallbackValue(
        const SubmitActionRequest(
          actionType: SubmitActionRequestActionType.markReviewed,
          itemId: 'fallback',
        ),
      );
    });

    moderationClientTest(
      'should submit moderation action successfully',
      body: (tester) async {
        const request = SubmitActionRequest(
          actionType: SubmitActionRequestActionType.markReviewed,
          itemId: 'item-123',
        );

        tester.mockApi(
          (api) => api.submitAction(submitActionRequest: request),
          result: createDefaultSubmitActionResponse(),
        );

        final result = await tester.moderation.submitAction(
          submitActionRequest: request,
        );

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.submitAction(submitActionRequest: request),
        );
      },
    );

    moderationClientTest(
      'should handle submit action failure',
      body: (tester) async {
        const request = SubmitActionRequest(
          actionType: SubmitActionRequestActionType.ban,
          itemId: 'item-456',
        );

        tester.mockApiFailure(
          (api) => api.submitAction(submitActionRequest: request),
          error: Exception('Failed to submit action'),
        );

        final result = await tester.moderation.submitAction(
          submitActionRequest: request,
        );

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.submitAction(submitActionRequest: request),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Review Queue Operations
  // ============================================================

  group('queryReviewQueue', () {
    setUpAll(() {
      registerFallbackValue(const QueryReviewQueueRequest());
    });

    moderationClientTest(
      'should query review queue successfully',
      body: (tester) async {
        const request = QueryReviewQueueRequest(limit: 20);

        tester.mockApi(
          (api) => api.queryReviewQueue(queryReviewQueueRequest: request),
          result: createDefaultQueryReviewQueueResponse(next: 'next-cursor'),
        );

        final result = await tester.moderation.queryReviewQueue(
          queryReviewQueueRequest: request,
        );

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.queryReviewQueue(queryReviewQueueRequest: request),
        );
      },
    );

    moderationClientTest(
      'should handle query review queue failure',
      body: (tester) async {
        const request = QueryReviewQueueRequest();

        tester.mockApiFailure(
          (api) => api.queryReviewQueue(queryReviewQueueRequest: request),
          error: Exception('Failed to query review queue'),
        );

        final result = await tester.moderation.queryReviewQueue(
          queryReviewQueueRequest: request,
        );

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.queryReviewQueue(queryReviewQueueRequest: request),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Config Operations
  // ============================================================

  group('upsertConfig', () {
    setUpAll(() {
      registerFallbackValue(const UpsertConfigRequest(key: 'fallback'));
    });

    moderationClientTest(
      'should upsert config successfully',
      body: (tester) async {
        const request = UpsertConfigRequest(key: 'config-1');

        tester.mockApi(
          (api) => api.upsertConfig(upsertConfigRequest: request),
          result: createDefaultUpsertConfigResponse(key: 'config-1'),
        );

        final result = await tester.moderation.upsertConfig(request);

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.upsertConfig(upsertConfigRequest: request),
        );
      },
    );

    moderationClientTest(
      'should handle upsert config failure',
      body: (tester) async {
        const request = UpsertConfigRequest(key: 'config-1');

        tester.mockApiFailure(
          (api) => api.upsertConfig(upsertConfigRequest: request),
          error: Exception('Failed to upsert config'),
        );

        final result = await tester.moderation.upsertConfig(request);

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.upsertConfig(upsertConfigRequest: request),
        );
      },
    );
  });

  group('deleteConfig', () {
    moderationClientTest(
      'should delete config successfully',
      body: (tester) async {
        const key = 'config-1';

        tester.mockApi(
          (api) => api.deleteConfig(key: key, team: null),
          result: createDefaultDeleteModerationConfigResponse(),
        );

        final result = await tester.moderation.deleteConfig(key: key);

        expect(result.isSuccess, isTrue);
        tester.verifyApi(
          (api) => api.deleteConfig(key: key, team: null),
        );
      },
    );

    moderationClientTest(
      'should handle delete config failure',
      body: (tester) async {
        const key = 'config-1';

        tester.mockApiFailure(
          (api) => api.deleteConfig(key: key, team: null),
          error: Exception('Failed to delete config'),
        );

        final result = await tester.moderation.deleteConfig(key: key);

        expect(result.isFailure, isTrue);
        tester.verifyApi(
          (api) => api.deleteConfig(key: key, team: null),
        );
      },
    );
  });

  group('getConfig', () {
    moderationClientTest(
      'should get config successfully',
      body: (tester) async {
        const key = 'config-1';

        tester.mockApi(
          (api) => api.getConfig(key: key, team: null),
          result: createDefaultGetConfigResponse(key: key),
        );

        final result = await tester.moderation.getConfig(key: key);

        expect(result.isSuccess, isTrue);
        tester.verifyApi((api) => api.getConfig(key: key, team: null));
      },
    );

    moderationClientTest(
      'should handle get config failure',
      body: (tester) async {
        const key = 'config-1';

        tester.mockApiFailure(
          (api) => api.getConfig(key: key, team: null),
          error: Exception('Config not found'),
        );

        final result = await tester.moderation.getConfig(key: key);

        expect(result.isFailure, isTrue);
        tester.verifyApi((api) => api.getConfig(key: key, team: null));
      },
    );
  });
}

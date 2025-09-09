// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;
late String apiKey;
late User user;
late TokenProvider token;
late BanRequest banRequest;

Future<void> overview() async {
  final client =
      StreamFeedsClient(apiKey: apiKey, user: user, tokenProvider: token);
  final moderation = client.moderation;
}

Future<void> banUsers() async {
  const banRequest = BanRequest(
    targetUserId: 'user-123',
    reason: 'Violation of community guidelines',
    timeout: 3600, // 1 hour in seconds
    shadow: false,
    ipBan: false,
  );

  final response = await client.moderation.ban(banRequest: banRequest);
  print('User banned for: ${response.getOrThrow().duration}');
}

Future<void> muteUsers() async {
  const muteRequest = MuteRequest(
    targetIds: ['user-123', 'user-456'],
    timeout: 86400, // 24 hours in seconds
  );

  final response = await client.moderation.mute(muteRequest: muteRequest);
}

Future<void> blockUsers() async {
  const blockRequest = BlockUsersRequest(blockedUserId: 'user-123');
  final response =
      await client.moderation.blockUsers(blockUsersRequest: blockRequest);
}

Future<void> unblockUsers() async {
  const unblockRequest = UnblockUsersRequest(blockedUserId: 'user-123');
  final response =
      await client.moderation.unblockUsers(unblockUsersRequest: unblockRequest);
}

Future<void> getBlockedUsers() async {
  final blockedUsers = await client.moderation.getBlockedUsers();
  for (final user in blockedUsers.getOrThrow().blocks) {
    print('Blocked user: ${user.blockedUserId}');
  }
}

Future<void> flagContent() async {
  const flagRequest = FlagRequest(
      entityId: 'activity-123',
      entityType: 'activity',
      reason: 'Inappropriate content',
      entityCreatorId: 'user-456');

  final response = await client.moderation.flag(flagRequest: flagRequest);
}

Future<void> submitModerationActions() async {
  const actionRequest = SubmitActionRequest(
    // Action details for moderation
    actionType: SubmitActionRequestActionType.ban,
    itemId: 'user-123',
  );

  final response =
      await client.moderation.submitAction(submitActionRequest: actionRequest);
}

Future<void> queryReviewQueue() async {
  const queryRequest = QueryReviewQueueRequest(
      // Query parameters for filtering and pagination
      );

  final reviewQueue = await client.moderation
      .queryReviewQueue(queryReviewQueueRequest: queryRequest);
}

Future<void> upsertModerationConfig() async {
  const upsertRequest = UpsertConfigRequest(
    key: 'feeds',
    // Configuration details for moderation
  );

  final response = await client.moderation.upsertConfig(upsertRequest);
}

Future<void> getModerationConfig() async {
  final config = await client.moderation.getConfig(key: 'feeds');
}

Future<void> deleteModerationConfig() async {
  final response = await client.moderation.deleteConfig(key: 'feeds');
}

Future<void> queryModerationConfigs() async {
  const queryRequest = ModerationConfigsQuery(
      // Query parameters for filtering and pagination
      );

  final configs = await client.moderation
      .queryModerationConfigs(queryModerationConfigsRequest: queryRequest);
}

Future<void> errorHandling() async {
  final response = await client.moderation.ban(banRequest: banRequest);

  switch (response) {
    case Success(data: final banResponse):
      print('User banned for: ${banResponse.duration}');
    case Failure(error: final error):
      print('Error banning user: $error');
  }
}

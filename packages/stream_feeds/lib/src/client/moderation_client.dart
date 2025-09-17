import 'package:stream_core/stream_core.dart';

import '../../stream_feeds.dart' show ModerationConfigsQuery;
import '../generated/api/api.dart' as api;
import '../repository/moderation_repository.dart';

/// Controller exposing moderation functionalities.
///
/// Provides comprehensive moderation capabilities including user management,
/// content flagging, review queue operations, and configuration management.
/// All operations are performed through the Stream Feeds API.
///
/// Example usage:
/// ```dart
/// final client = StreamFeedsClient(/*...*/);
///
/// // Ban a user
/// final banResult = await client.moderation.ban(
///   api.BanRequest(
///     targetUserId: 'user-123',
///     reason: 'Violation of community guidelines',
///   ),
/// );
///
/// // Flag content for review
/// final flagResult = await client.moderation.flag(
///   api.FlagRequest(
///     targetId: 'activity-456',
///     reason: 'inappropriate content',
///   ),
/// );
/// ```
class ModerationClient {
  /// Creates a new [ModerationClient] instance.
  const ModerationClient(this._moderationRepository);

  // The moderation repository used for making API calls.
  final ModerationRepository _moderationRepository;

  /// Bans a user from the platform.
  ///
  /// Prohibits the user specified in [banRequest] from accessing platform features.
  ///
  /// Returns a [Result] containing a [api.BanResponse] or an error.
  Future<Result<api.BanResponse>> ban({required api.BanRequest banRequest}) {
    return _moderationRepository.ban(banRequest);
  }

  /// Mutes one or more users.
  ///
  /// Restricts communication for the users specified in [muteRequest].
  ///
  /// Returns a [Result] containing a [api.MuteResponse] or an error.
  Future<Result<api.MuteResponse>> mute({
    required api.MuteRequest muteRequest,
  }) {
    return _moderationRepository.mute(muteRequest);
  }

  /// Blocks a user.
  ///
  /// Prevents interaction with the user specified in [blockUsersRequest].
  ///
  /// Returns a [Result] containing a [api.BlockUsersResponse] or an error.
  Future<Result<api.BlockUsersResponse>> blockUsers({
    required api.BlockUsersRequest blockUsersRequest,
  }) {
    return _moderationRepository.blockUsers(blockUsersRequest);
  }

  /// Unblocks a user.
  ///
  /// Restores interaction capabilities with the user specified in [unblockUsersRequest].
  ///
  /// Returns a [Result] containing a [api.UnblockUsersResponse] or an error.
  Future<Result<api.UnblockUsersResponse>> unblockUsers({
    required api.UnblockUsersRequest unblockUsersRequest,
  }) {
    return _moderationRepository.unblockUsers(unblockUsersRequest);
  }

  /// Gets the list of blocked users.
  ///
  /// Retrieves all users that have been blocked by the current user.
  ///
  /// Returns a [Result] containing a [api.GetBlockedUsersResponse] or an error.
  Future<Result<api.GetBlockedUsersResponse>> getBlockedUsers() {
    return _moderationRepository.getBlockedUsers();
  }

  /// Flags content for moderation review.
  ///
  /// Reports inappropriate content specified in [flagRequest] for review.
  ///
  /// Returns a [Result] containing a [api.FlagResponse] or an error.
  Future<Result<api.FlagResponse>> flag({
    required api.FlagRequest flagRequest,
  }) {
    return _moderationRepository.flag(flagRequest);
  }

  /// Submits a moderation action.
  ///
  /// Executes a moderation decision using the data in [submitActionRequest].
  ///
  /// Returns a [Result] containing a [api.SubmitActionResponse] or an error.
  Future<Result<api.SubmitActionResponse>> submitAction({
    required api.SubmitActionRequest submitActionRequest,
  }) {
    return _moderationRepository.submitAction(submitActionRequest);
  }

  /// Queries the moderation review queue.
  ///
  /// Retrieves pending moderation items using the specified [queryReviewQueueRequest] filters and pagination.
  ///
  /// Returns a [Result] containing a [api.QueryReviewQueueResponse] or an error.
  Future<Result<api.QueryReviewQueueResponse>> queryReviewQueue({
    required api.QueryReviewQueueRequest queryReviewQueueRequest,
  }) {
    return _moderationRepository.queryReviewQueue(queryReviewQueueRequest);
  }

  /// Upserts a moderation configuration.
  ///
  /// Creates or updates a moderation configuration using the data in [upsertConfigRequest].
  ///
  /// Returns a [Result] containing an [api.UpsertConfigResponse] or an error.
  Future<Result<api.UpsertConfigResponse>> upsertConfig(
    api.UpsertConfigRequest upsertConfigRequest,
  ) {
    return _moderationRepository.upsertConfig(upsertConfigRequest);
  }

  /// Deletes a moderation configuration.
  ///
  /// Removes the configuration identified by [key] and optional [team].
  ///
  /// Returns a [Result] containing a [api.DeleteModerationConfigResponse] or an error.
  Future<Result<api.DeleteModerationConfigResponse>> deleteConfig({
    required String key,
    String? team,
  }) {
    return _moderationRepository.deleteConfig(key, team: team);
  }

  /// Gets a moderation configuration.
  ///
  /// Retrieves the configuration identified by [key] and optional [team].
  ///
  /// Returns a [Result] containing a [api.GetConfigResponse] or an error.
  Future<Result<api.GetConfigResponse>> getConfig({
    required String key,
    String? team,
  }) {
    return _moderationRepository.getConfig(key, team: team);
  }

  /// Queries the moderation configurations.
  ///
  /// Retrieves moderation configurations using the specified [queryModerationConfigsRequest] filters and pagination.
  ///
  /// Returns a [Result] containing a [api.QueryModerationConfigsResponse] or an error.
  Future<void> queryModerationConfigs({
    required ModerationConfigsQuery queryModerationConfigsRequest,
  }) {
    return _moderationRepository
        .queryModerationConfigs(queryModerationConfigsRequest);
  }
}

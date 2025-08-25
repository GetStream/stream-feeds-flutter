import 'package:stream_core/stream_core.dart';

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
  Future<Result<api.BanResponse>> ban(api.BanRequest banRequest) {
    return _moderationRepository.ban(banRequest);
  }

  /// Mutes one or more users.
  ///
  /// Restricts communication for the users specified in [muteRequest].
  ///
  /// Returns a [Result] containing a [api.MuteResponse] or an error.
  Future<Result<api.MuteResponse>> mute(api.MuteRequest muteRequest) {
    return _moderationRepository.mute(muteRequest);
  }

  /// Blocks a user.
  ///
  /// Prevents interaction with the user specified in [blockUserRequest].
  ///
  /// Returns a [Result] containing a [api.BlockUsersResponse] or an error.
  Future<Result<api.BlockUsersResponse>> blockUser(
    api.BlockUsersRequest blockUserRequest,
  ) {
    return _moderationRepository.blockUsers(blockUserRequest);
  }

  /// Unblocks a user.
  ///
  /// Restores interaction capabilities with the user specified in [unblockUserRequest].
  ///
  /// Returns a [Result] containing a [api.UnblockUsersResponse] or an error.
  Future<Result<api.UnblockUsersResponse>> unblockUser(
    api.UnblockUsersRequest unblockUserRequest,
  ) {
    return _moderationRepository.unblockUsers(unblockUserRequest);
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
  Future<Result<api.FlagResponse>> flag(api.FlagRequest flagRequest) {
    return _moderationRepository.flag(flagRequest);
  }

  /// Submits a moderation action.
  ///
  /// Executes a moderation decision using the data in [submitActionRequest].
  ///
  /// Returns a [Result] containing a [api.SubmitActionResponse] or an error.
  Future<Result<api.SubmitActionResponse>> submitAction(
    api.SubmitActionRequest submitActionRequest,
  ) {
    return _moderationRepository.submitAction(submitActionRequest);
  }

  /// Queries the moderation review queue.
  ///
  /// Retrieves pending moderation items using the specified [queryReviewQueueRequest] filters and pagination.
  ///
  /// Returns a [Result] containing a [api.QueryReviewQueueResponse] or an error.
  Future<Result<api.QueryReviewQueueResponse>> queryReviewQueue(
    api.QueryReviewQueueRequest queryReviewQueueRequest,
  ) {
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
  Future<Result<api.DeleteModerationConfigResponse>> deleteConfig(
    String key, {
    String? team,
  }) {
    return _moderationRepository.deleteConfig(key, team: team);
  }

  /// Gets a moderation configuration.
  ///
  /// Retrieves the configuration identified by [key] and optional [team].
  ///
  /// Returns a [Result] containing a [api.GetConfigResponse] or an error.
  Future<Result<api.GetConfigResponse>> getConfig(
    String key, {
    String? team,
  }) {
    return _moderationRepository.getConfig(key, team: team);
  }
}

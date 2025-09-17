import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/moderation_config_data.dart';
import '../models/pagination_data.dart';
import '../state/query/moderation_configs_query.dart';

/// Repository for managing moderation operations.
///
/// Provides comprehensive moderation functionality including user banning, muting,
/// blocking, content flagging, and moderation configuration management.
///
/// All methods return [Result] objects for explicit error handling.
class ModerationRepository {
  /// Creates a new [ModerationRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const ModerationRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Queries moderation configurations.
  ///
  /// Searches for moderation configurations using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ModerationConfigData] or an error.
  Future<Result<PaginationResult<ModerationConfigData>>> queryModerationConfigs(
    ModerationConfigsQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryModerationConfigs(
      queryModerationConfigsRequest: request,
    );

    return result.map((response) {
      final configs = response.configs.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: configs, pagination: pagination);
    });
  }

  /// Bans a user from the platform.
  ///
  /// Prohibits the user specified in [banRequest] from accessing platform features.
  ///
  /// Returns a [Result] containing a [api.BanResponse] or an error.
  Future<Result<api.BanResponse>> ban(api.BanRequest banRequest) async {
    final result = await _api.ban(banRequest: banRequest);

    return result;
  }

  /// Mutes one or more users.
  ///
  /// Restricts communication for the users specified in [muteRequest].
  ///
  /// Returns a [Result] containing a [api.MuteResponse] or an error.
  Future<Result<api.MuteResponse>> mute(api.MuteRequest muteRequest) async {
    final result = await _api.mute(muteRequest: muteRequest);

    return result;
  }

  /// Blocks users.
  ///
  /// Prevents interaction with the users specified in [blockUsersRequest].
  ///
  /// Returns a [Result] containing a [api.BlockUsersResponse] or an error.
  Future<Result<api.BlockUsersResponse>> blockUsers(
    api.BlockUsersRequest blockUsersRequest,
  ) async {
    final result = await _api.blockUsers(
      blockUsersRequest: blockUsersRequest,
    );

    return result;
  }

  /// Unblocks users.
  ///
  /// Restores interaction capabilities with the users specified in [unblockUsersRequest].
  ///
  /// Returns a [Result] containing a [api.UnblockUsersResponse] or an error.
  Future<Result<api.UnblockUsersResponse>> unblockUsers(
    api.UnblockUsersRequest unblockUsersRequest,
  ) async {
    final result = await _api.unblockUsers(
      unblockUsersRequest: unblockUsersRequest,
    );

    return result;
  }

  /// Gets the list of blocked users.
  ///
  /// Retrieves all users that have been blocked by the current user.
  ///
  /// Returns a [Result] containing a [api.GetBlockedUsersResponse] or an error.
  Future<Result<api.GetBlockedUsersResponse>> getBlockedUsers() async {
    final result = await _api.getBlockedUsers();

    return result;
  }

  /// Flags content for moderation review.
  ///
  /// Reports inappropriate content specified in [flagRequest] for review.
  ///
  /// Returns a [Result] containing a [api.FlagResponse] or an error.
  Future<Result<api.FlagResponse>> flag(api.FlagRequest flagRequest) async {
    final result = await _api.flag(flagRequest: flagRequest);

    return result;
  }

  /// Submits a moderation action.
  ///
  /// Executes a moderation decision using the data in [submitActionRequest].
  ///
  /// Returns a [Result] containing a [api.SubmitActionResponse] or an error.
  Future<Result<api.SubmitActionResponse>> submitAction(
    api.SubmitActionRequest submitActionRequest,
  ) async {
    final result = await _api.submitAction(
      submitActionRequest: submitActionRequest,
    );

    return result;
  }

  /// Queries the moderation review queue.
  ///
  /// Retrieves pending moderation items using the specified [queryReviewQueueRequest] filters and pagination.
  ///
  /// Returns a [Result] containing a [api.QueryReviewQueueResponse] or an error.
  Future<Result<api.QueryReviewQueueResponse>> queryReviewQueue(
    api.QueryReviewQueueRequest queryReviewQueueRequest,
  ) async {
    final result = await _api.queryReviewQueue(
      queryReviewQueueRequest: queryReviewQueueRequest,
    );

    return result;
  }

  /// Upserts a moderation configuration.
  ///
  /// Creates or updates a moderation configuration using the data in [upsertConfigRequest].
  ///
  /// Returns a [Result] containing an [api.UpsertConfigResponse] or an error.
  Future<Result<api.UpsertConfigResponse>> upsertConfig(
    api.UpsertConfigRequest upsertConfigRequest,
  ) async {
    final result = await _api.upsertConfig(
      upsertConfigRequest: upsertConfigRequest,
    );

    return result;
  }

  /// Deletes a moderation configuration by key.
  ///
  /// Returns a [Result] containing a [api.DeleteModerationConfigResponse] or an error.
  Future<Result<api.DeleteModerationConfigResponse>> deleteConfig(
    String key, {
    String? team,
  }) async {
    final result = await _api.deleteConfig(key: key, team: team);

    return result;
  }

  /// Gets a moderation configuration by key.
  ///
  /// Returns a [Result] containing a [api.GetConfigResponse] or an error.
  Future<Result<api.GetConfigResponse>> getConfig(
    String key, {
    String? team,
  }) async {
    final result = await _api.getConfig(key: key, team: team);

    return result;
  }
}

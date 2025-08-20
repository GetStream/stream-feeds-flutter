import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
import '../models/moderation_config_data.dart';
import '../models/pagination_data.dart';
import '../state/query/moderation_configs_query.dart';

/// Repository for managing moderation operations.
///
/// Provides comprehensive moderation functionality including user banning, muting,
/// blocking, content flagging, and moderation configuration management.
/// All methods return [Result] objects for explicit error handling.
class ModerationRepository {
  /// Creates a new [ModerationRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const ModerationRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Queries moderation configurations based on the provided [ModerationConfigsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ModerationConfigData] or an error.
  Future<Result<PaginationResult<ModerationConfigData>>> queryModerationConfigs(
    ModerationConfigsQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryModerationConfigs(
        queryModerationConfigsRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from queryModerationConfigs',
        );
      }

      final configs = response.configs.map((c) => c.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: configs, pagination: pagination);
    });
  }

  /// Bans a user from the platform based on the provided [BanRequest].
  ///
  /// Returns a [Result] containing a [BanResponse] or an error.
  Future<Result<api.BanResponse>> ban(api.BanRequest banRequest) {
    return runSafely(() async {
      final response = await _apiClient.ban(banRequest: banRequest);

      if (response == null) {
        throw ClientException(message: 'No result data from ban');
      }

      return response;
    });
  }

  /// Mutes one or more users based on the provided [MuteRequest].
  ///
  /// Returns a [Result] containing a [MuteResponse] or an error.
  Future<Result<api.MuteResponse>> mute(api.MuteRequest muteRequest) {
    return runSafely(() async {
      final response = await _apiClient.mute(muteRequest: muteRequest);

      if (response == null) {
        throw ClientException(message: 'No result data from mute');
      }

      return response;
    });
  }

  /// Blocks users based on the provided [BlockUsersRequest].
  ///
  /// Returns a [Result] containing a [BlockUsersResponse] or an error.
  Future<Result<api.BlockUsersResponse>> blockUsers(
    api.BlockUsersRequest blockUsersRequest,
  ) {
    return runSafely(() async {
      final response = await _apiClient.blockUsers(
        blockUsersRequest: blockUsersRequest,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from blockUsers');
      }

      return response;
    });
  }

  /// Unblocks users based on the provided [UnblockUsersRequest].
  ///
  /// Returns a [Result] containing a [UnblockUsersResponse] or an error.
  Future<Result<api.UnblockUsersResponse>> unblockUsers(
    api.UnblockUsersRequest unblockUsersRequest,
  ) {
    return runSafely(() async {
      final response = await _apiClient.unblockUsers(
        unblockUsersRequest: unblockUsersRequest,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from unblockUsers');
      }

      return response;
    });
  }

  /// Gets the list of blocked users.
  ///
  /// Returns a [Result] containing a [GetBlockedUsersResponse] or an error.
  Future<Result<api.GetBlockedUsersResponse>> getBlockedUsers() {
    return runSafely(() async {
      final response = await _apiClient.getBlockedUsers();

      if (response == null) {
        throw ClientException(message: 'No result data from getBlockedUsers');
      }

      return response;
    });
  }

  /// Flags content for moderation review based on the provided [FlagRequest].
  ///
  /// Returns a [Result] containing a [FlagResponse] or an error.
  Future<Result<api.FlagResponse>> flag(api.FlagRequest flagRequest) {
    return runSafely(() async {
      final response = await _apiClient.flag(flagRequest: flagRequest);

      if (response == null) {
        throw ClientException(message: 'No result data from flag');
      }

      return response;
    });
  }

  /// Submits a moderation action based on the provided [SubmitActionRequest].
  ///
  /// Returns a [Result] containing a [SubmitActionResponse] or an error.
  Future<Result<api.SubmitActionResponse>> submitAction(
    api.SubmitActionRequest submitActionRequest,
  ) {
    return runSafely(() async {
      final response = await _apiClient.submitAction(
        submitActionRequest: submitActionRequest,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from submitAction');
      }

      return response;
    });
  }

  /// Queries the moderation review queue based on the provided [QueryReviewQueueRequest].
  ///
  /// Returns a [Result] containing a [QueryReviewQueueResponse] or an error.
  Future<Result<api.QueryReviewQueueResponse>> queryReviewQueue(
    api.QueryReviewQueueRequest queryReviewQueueRequest,
  ) {
    return runSafely(() async {
      final response = await _apiClient.queryReviewQueue(
        queryReviewQueueRequest: queryReviewQueueRequest,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryReviewQueue');
      }

      return response;
    });
  }

  /// Upserts a moderation configuration based on the provided [UpsertConfigRequest].
  ///
  /// Returns a [Result] containing an [UpsertConfigResponse] or an error.
  Future<Result<api.UpsertConfigResponse>> upsertConfig(
    api.UpsertConfigRequest upsertConfigRequest,
  ) {
    return runSafely(() async {
      final response = await _apiClient.upsertConfig(
        upsertConfigRequest: upsertConfigRequest,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from upsertConfig');
      }

      return response;
    });
  }

  /// Deletes a moderation configuration by key.
  ///
  /// Returns a [Result] containing a [DeleteModerationConfigResponse] or an error.
  Future<Result<api.DeleteModerationConfigResponse>> deleteConfig(
    String key, {
    String? team,
  }) {
    return runSafely(() async {
      final response = await _apiClient.deleteConfig(
        key: key,
        team: team,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from deleteConfig');
      }

      return response;
    });
  }

  /// Gets a moderation configuration by key.
  ///
  /// Returns a [Result] containing a [GetConfigResponse] or an error.
  Future<Result<api.GetConfigResponse>> getConfig(
    String key, {
    String? team,
  }) {
    return runSafely(() async {
      final response = await _apiClient.getConfig(
        key: key,
        team: team,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from getConfig');
      }

      return response;
    });
  }
}

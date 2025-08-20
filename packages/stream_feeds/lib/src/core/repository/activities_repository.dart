import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
import '../models/activity_data.dart';
import '../models/feed_id.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../state/query/activities_query.dart';

/// Repository for managing activities and activity-related operations.
///
/// Handles the complete activity lifecycle including creation, querying,
/// updating, and deletion. Supports social interactions like reactions and
/// comments, advanced filtering and pagination, and real-time updates.
///
/// All methods return [Result] objects for explicit error handling.
class ActivitiesRepository {
  /// Creates a new [ActivitiesRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const ActivitiesRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Adds a new activity based on the provided [request].
  ///
  /// Returns a [Result] containing the added [ActivityData] or an error.
  Future<Result<ActivityData>> addActivity(
    api.AddActivityRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.addActivity(
        addActivityRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from addActivity');
      }

      return response.activity.toModel();
    });
  }

  /// Deletes an activity by ID.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteActivity(
    String activityId, {
    required bool hardDelete,
  }) {
    return runSafely(() async {
      await _apiClient.deleteActivity(
        activityId: activityId,
        hardDelete: hardDelete,
      );
    });
  }

  /// Retrieves an activity by ID.
  ///
  /// Returns a [Result] containing the [ActivityData] or an error.
  Future<Result<ActivityData>> getActivity(String activityId) {
    return runSafely(() async {
      final response = await _apiClient.getActivity(activityId: activityId);

      if (response == null) {
        throw ClientException(message: 'No result data from getActivity');
      }

      return response.activity.toModel();
    });
  }

  /// Updates an existing activity based on the provided [UpdateActivityRequest].
  ///
  /// Returns a [Result] containing the updated [ActivityData] or an error.
  Future<Result<ActivityData>> updateActivity(
    String activityId,
    api.UpdateActivityRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updateActivity(
        activityId: activityId,
        updateActivityRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updateActivity');
      }

      return response.activity.toModel();
    });
  }

  /// Upserts a list of activities.
  ///
  /// Returns a [Result] containing the list of upserted [ActivityData] or an error.
  Future<Result<List<ActivityData>>> upsertActivities(
    List<api.ActivityRequest> activities,
  ) {
    return runSafely(() async {
      final request = api.UpsertActivitiesRequest(activities: activities);
      final response = await _apiClient.upsertActivities(
        upsertActivitiesRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from upsertActivities');
      }

      return response.activities.map((a) => a.toModel()).toList();
    });
  }

  /// Pins an activity to a feed.
  ///
  /// Returns a [Result] containing the pinned [ActivityData] or an error.
  Future<Result<ActivityData>> pin(String activityId, FeedId fid) {
    return runSafely(() async {
      final response = await _apiClient.pinActivity(
        activityId: activityId,
        feedGroupId: fid.group,
        feedId: fid.id,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from pinActivity');
      }

      return response.activity.toModel();
    });
  }

  /// Unpins an activity from a feed.
  ///
  /// Returns a [Result] containing the unpinned [ActivityData] or an error.
  Future<Result<ActivityData>> unpin(String activityId, FeedId fid) {
    return runSafely(() async {
      final response = await _apiClient.unpinActivity(
        activityId: activityId,
        feedGroupId: fid.group,
        feedId: fid.id,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from unpinActivity');
      }

      return response.activity.toModel();
    });
  }

  /// Marks activities in a feed based on the provided [MarkActivityRequest].
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> markActivity(
    FeedId fid,
    api.MarkActivityRequest request,
  ) {
    return runSafely(() async {
      await _apiClient.markActivity(
        feedGroupId: fid.group,
        feedId: fid.id,
        markActivityRequest: request,
      );
    });
  }

  /// Queries activities based on the provided [ActivitiesQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ActivityData] or an error.
  Future<Result<PaginationResult<ActivityData>>> queryActivities(
    ActivitiesQuery query,
  ) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.queryActivities(
        queryActivitiesRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryActivities');
      }

      final activities = response.activities.map((a) => a.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: activities, pagination: pagination);
    });
  }

  /// Adds a reaction to an activity based on the provided [AddReactionRequest].
  ///
  /// Returns a [Result] containing the [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> addReaction(
    String activityId,
    api.AddReactionRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.addReaction(
        activityId: activityId,
        addReactionRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from addReaction');
      }

      return response.reaction.toModel();
    });
  }

  /// Deletes a reaction from an activity.
  ///
  /// Returns a [Result] containing the deleted [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> deleteReaction(
    String activityId,
    String type,
  ) {
    return runSafely(() async {
      final response = await _apiClient.deleteActivityReaction(
        activityId: activityId,
        type: type,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from deleteActivityReaction',
        );
      }

      return response.reaction.toModel();
    });
  }

  /// Queries reactions for a specific activity based on the provided [QueryReactionsRequest].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedsReactionData] or an error.
  Future<Result<PaginationResult<FeedsReactionData>>> queryActivityReactions(
    String activityId,
    api.QueryActivityReactionsRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.queryActivityReactions(
        activityId: activityId,
        queryActivityReactionsRequest: request,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from queryActivityReactions',
        );
      }

      final reactions = response.reactions.map((r) => r.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: reactions, pagination: pagination);
    });
  }
}

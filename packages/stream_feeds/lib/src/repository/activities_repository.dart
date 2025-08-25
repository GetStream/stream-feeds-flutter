import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/activity_data.dart';
import '../models/feed_id.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../state/query/activities_query.dart';

/// Repository for managing activities and activity-related operations.
///
/// Provides methods for creating, querying, updating, and deleting activities.
/// Supports social interactions like reactions and comments, advanced filtering
/// and pagination, and real-time updates.
///
/// All methods return [Result] objects for explicit error handling.
class ActivitiesRepository {
  /// Creates a new [ActivitiesRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const ActivitiesRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Adds a new activity.
  ///
  /// Creates a new activity using the provided [request] data.
  ///
  /// Returns a [Result] containing the created [ActivityData] or an error.
  Future<Result<ActivityData>> addActivity(
    api.AddActivityRequest request,
  ) async {
    final result = await _api.addActivity(
      addActivityRequest: request,
    );

    return result.map((response) => response.activity.toModel());
  }

  /// Deletes an activity.
  ///
  /// Removes the activity with the specified [activityId]. When [hardDelete]
  /// is true, permanently deletes the activity; otherwise marks it as deleted.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteActivity(
    String activityId, {
    required bool hardDelete,
  }) {
    return _api.deleteActivity(
      id: activityId,
      hardDelete: hardDelete,
    );
  }

  /// Retrieves an activity.
  ///
  /// Fetches the activity with the specified [activityId] from the server.
  ///
  /// Returns a [Result] containing the [ActivityData] or an error.
  Future<Result<ActivityData>> getActivity(String activityId) async {
    final result = await _api.getActivity(id: activityId);

    return result.map((response) => response.activity.toModel());
  }

  /// Updates an existing activity.
  ///
  /// Modifies the activity with [activityId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the updated [ActivityData] or an error.
  Future<Result<ActivityData>> updateActivity(
    String activityId,
    api.UpdateActivityRequest request,
  ) async {
    final result = await _api.updateActivity(
      id: activityId,
      updateActivityRequest: request,
    );

    return result.map((response) => response.activity.toModel());
  }

  /// Upserts multiple activities.
  ///
  /// Creates or updates the provided [activities] in a single batch operation.
  ///
  /// Returns a [Result] containing the list of upserted [ActivityData] or an error.
  Future<Result<List<ActivityData>>> upsertActivities(
    List<api.ActivityRequest> activities,
  ) async {
    final request = api.UpsertActivitiesRequest(activities: activities);
    final result = await _api.upsertActivities(
      upsertActivitiesRequest: request,
    );

    return result.map(
      (response) => [...response.activities.map((a) => a.toModel())],
    );
  }

  /// Pins an activity to a feed.
  ///
  /// Pins the activity with [activityId] to the specified [fid] feed.
  ///
  /// Returns a [Result] containing the pinned [ActivityData] or an error.
  Future<Result<ActivityData>> pin(String activityId, FeedId fid) async {
    final result = await _api.pinActivity(
      activityId: activityId,
      feedGroupId: fid.group,
      feedId: fid.id,
    );

    return result.map((response) => response.activity.toModel());
  }

  /// Unpins an activity from a feed.
  ///
  /// Removes the pin for the activity with [activityId] from the specified [fid] feed.
  ///
  /// Returns a [Result] containing the unpinned [ActivityData] or an error.
  Future<Result<ActivityData>> unpin(String activityId, FeedId fid) async {
    final result = await _api.unpinActivity(
      activityId: activityId,
      feedGroupId: fid.group,
      feedId: fid.id,
    );

    return result.map((response) => response.activity.toModel());
  }

  /// Marks activities in a feed.
  ///
  /// Marks activities in the feed [fid] using the provided [request] data.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> markActivity(
    FeedId fid,
    api.MarkActivityRequest request,
  ) {
    return _api.markActivity(
      feedGroupId: fid.group,
      feedId: fid.id,
      markActivityRequest: request,
    );
  }

  /// Queries activities.
  ///
  /// Searches for activities using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [ActivityData] or an error.
  Future<Result<PaginationResult<ActivityData>>> queryActivities(
    ActivitiesQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryActivities(
      queryActivitiesRequest: request,
    );

    return result.map((response) {
      final activities = response.activities.map((a) => a.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: activities, pagination: pagination);
    });
  }

  /// Adds a reaction to an activity.
  ///
  /// Creates a new reaction on the activity with [activityId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> addReaction(
    String activityId,
    api.AddReactionRequest request,
  ) async {
    final result = await _api.addReaction(
      activityId: activityId,
      addReactionRequest: request,
    );

    return result.map((response) => response.reaction.toModel());
  }

  /// Deletes a reaction from an activity.
  ///
  /// Removes the reaction of [type] from the activity with [activityId].
  ///
  /// Returns a [Result] containing the deleted [FeedsReactionData] or an error.
  Future<Result<FeedsReactionData>> deleteReaction(
    String activityId,
    String type,
  ) async {
    final result = await _api.deleteActivityReaction(
      activityId: activityId,
      type: type,
    );

    return result.map((response) => response.reaction.toModel());
  }

  /// Queries reactions for a specific activity.
  ///
  /// Retrieves reactions for the activity with [activityId] using the provided [request] filters.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedsReactionData] or an error.
  Future<Result<PaginationResult<FeedsReactionData>>> queryActivityReactions(
    String activityId,
    api.QueryActivityReactionsRequest request,
  ) async {
    final result = await _api.queryActivityReactions(
      activityId: activityId,
      queryActivityReactionsRequest: request,
    );

    return result.map((response) {
      final reactions = response.reactions.map((r) => r.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: reactions, pagination: pagination);
    });
  }
}

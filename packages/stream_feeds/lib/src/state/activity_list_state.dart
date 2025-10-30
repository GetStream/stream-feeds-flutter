import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/activity_data.dart';
import '../models/bookmark_data.dart';
import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/activities_query.dart';

part 'activity_list_state.freezed.dart';

/// Manages the state of an activity list and handles state updates.
///
/// Provides methods to update the activity list state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityListStateNotifier extends StateNotifier<ActivityListState> {
  ActivityListStateNotifier({
    required ActivityListState initialState,
    required this.currentUserId,
  }) : super(initialState);

  final String currentUserId;

  QueryConfiguration<ActivityData>? _queryConfig;
  List<Sort<ActivityData>> get activitiesSort {
    return _queryConfig?.sort ?? ActivitiesSort.defaultSort;
  }

  /// Handles the result of a query for more activities.
  void onQueryMoreActivities(
    PaginationResult<ActivityData> result,
    QueryConfiguration<ActivityData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new activities with the existing ones (keeping the sort order)
    final updatedActivities = state.activities.merge(
      result.items,
      key: (it) => it.id,
      compare: activitiesSort.compare,
    );

    state = state.copyWith(
      activities: updatedActivities,
      pagination: result.pagination,
    );
  }

  /// Handles the removal of an activity.
  void onActivityRemoved(ActivityData activity) {
    final updatedActivities = state.activities.where((it) {
      return it.id != activity.id;
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the update of an activity.
  void onActivityUpdated(ActivityData activity) {
    final updatedActivities = state.activities.sortedUpsert(
      activity,
      key: (it) => it.id,
      compare: activitiesSort.compare,
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition of a bookmark.
  void onBookmarkAdded(BookmarkData bookmark) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != bookmark.activity.id) return activity;
      // Add the bookmark to the activity
      return activity.addBookmark(bookmark, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a bookmark.
  void onBookmarkRemoved(BookmarkData bookmark) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != bookmark.activity.id) return activity;
      // Remove the bookmark from the activity
      return activity.removeBookmark(bookmark, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition of a comment.
  void onCommentAdded(CommentData comment) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != comment.objectId) return activity;
      // Add the comment to the activity
      return activity.addComment(comment);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a comment.
  void onCommentRemoved(CommentData comment) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != comment.objectId) return activity;
      // Remove the comment from the activity
      return activity.removeComment(comment);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition of a reaction.
  void onReactionAdded(FeedsReactionData reaction) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != reaction.activityId) return activity;
      // Add the reaction to the activity
      return activity.addReaction(reaction, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a reaction.
  void onReactionRemoved(FeedsReactionData reaction) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != reaction.activityId) return activity;
      // Remove the reaction from the activity
      return activity.removeReaction(reaction, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }
}

/// An observable state object that manages the current state of an activity list.
///
/// Maintains the current list of activities and pagination information for
/// efficient loading and navigation through activity collections.
@freezed
class ActivityListState with _$ActivityListState {
  const ActivityListState({
    this.activities = const [],
    this.pagination,
  });

  /// All the paginated activities currently loaded.
  ///
  /// This list contains all activities that have been fetched across multiple
  /// pagination requests. The activities are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<ActivityData> activities;

  /// Last pagination information from the most recent request.
  ///
  /// Contains the `next` and `previous` cursor values that can be used
  /// to fetch additional pages of activities.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more activities available to load.
  bool get canLoadMore => pagination?.next != null;
}

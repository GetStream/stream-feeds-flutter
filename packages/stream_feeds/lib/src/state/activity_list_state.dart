import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/activity_data.dart';
import '../models/bookmark_data.dart';
import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import 'query/activities_query.dart';

part 'activity_list_state.freezed.dart';

/// Manages the state of an activity list and handles state updates.
///
/// Provides methods to update the activity list state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityListStateNotifier extends StateNotifier<ActivityListState> {
  ActivityListStateNotifier({
    required this.currentUserId,
    required ActivityListState initialState,
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
  void onActivityRemoved(String activityId) {
    final updatedActivities = state.activities.where((it) {
      return it.id != activityId;
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

  /// Handles updates to the activity list state when an activity is hidden.
  void onActivityHidden({
    required String activityId,
    required bool hidden,
  }) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == activityId,
      update: (it) => it.copyWith(hidden: hidden),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition or update of a reaction.
  void onReactionUpserted(
    ActivityData activity,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == reaction.activityId,
      update: (it) => it.upsertReaction(
        activity,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a reaction.
  void onReactionRemoved(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == reaction.activityId,
      update: (it) => it.removeReaction(activity, reaction, currentUserId),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition or update of a bookmark.
  void onBookmarkUpserted(BookmarkData bookmark) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == bookmark.activity.id,
      update: (it) => it.upsertBookmark(bookmark, currentUserId),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a bookmark.
  void onBookmarkRemoved(BookmarkData bookmark) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == bookmark.activity.id,
      update: (it) => it.removeBookmark(bookmark, currentUserId),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition or update of a comment.
  void onCommentUpserted(CommentData comment) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.upsertComment(comment),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a comment.
  void onCommentRemoved(CommentData comment) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.removeComment(comment),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the addition or update of a reaction on a comment.
  void onCommentReactionUpserted(
    CommentData comment,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.upsertCommentReaction(
        comment,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles the removal of a reaction from a comment.
  void onCommentReactionRemoved(
    CommentData comment,
    FeedsReactionData reaction,
  ) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.id == comment.objectId,
      update: (it) {
        return it.removeCommentReaction(comment, reaction, currentUserId);
      },
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles when a poll is closed.
  void onPollClosed(String pollId) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.poll?.id == pollId,
      update: (it) => it.copyWith(poll: it.poll?.copyWith(isClosed: true)),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles when a poll is deleted.
  void onPollDeleted(String pollId) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.poll?.id == pollId,
      update: (it) => it.copyWith(poll: null),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles when a poll is updated.
  void onPollUpdated(PollData poll) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(poll: it.poll?.updateWith(poll)),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles when a poll vote is added or updated (with poll data).
  void onPollVoteUpserted(PollData poll, PollVoteData vote) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertVote(poll, vote, currentUserId),
      ),
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles when a poll vote is removed (with poll data).
  void onPollVoteRemoved(PollData poll, PollVoteData vote) {
    final updatedActivities = state.activities.updateWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.removeVote(poll, vote, currentUserId),
      ),
    );

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

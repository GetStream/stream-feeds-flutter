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
import 'activity_comment_list_state.dart';

part 'activity_state.freezed.dart';

/// Manages the state of an activity and handles state updates.
///
/// Provides methods to update the activity state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityStateNotifier extends StateNotifier<ActivityState> {
  ActivityStateNotifier({
    required ActivityState initialState,
    required this.currentUserId,
    required this.commentList,
  }) : super(initialState) {
    // Set up synchronization for comment list updates
    _setupCommentListSynchronization();
  }

  final String currentUserId;
  final ActivityCommentListStateNotifier commentList;

  RemoveListener? _removeCommentListListener;
  void _setupCommentListSynchronization() {
    _removeCommentListListener = commentList.addListener((commentListState) {
      // Synchronize state with the comment list state
      state = state.copyWith(
        comments: commentListState.comments,
        commentsPagination: commentListState.pagination,
      );
    });
  }

  /// Handles the deletion of the activity.
  void onActivityDeleted() {
    state = state.copyWith(
      activity: null,
      comments: [], // Clear all comments when the activity is deleted
      commentsPagination: null,
    );
  }

  /// Handles the update of an activity.
  void onActivityUpdated(ActivityData activity) {
    final currentActivity = state.activity;
    final updatedActivity = currentActivity?.updateWith(activity) ?? activity;

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles updates to the activity's hidden status.
  void onActivityHidden({required bool hidden}) {
    final currentActivity = state.activity;
    final updatedActivity = currentActivity?.copyWith(hidden: hidden);

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a reaction is added to the activity.
  void onReactionAdded(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    final updatedActivity = state.activity?.let(
      (it) => it.upsertReaction(activity, reaction, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a reaction is updated on the activity.
  void onReactionUpdated(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    final updatedActivity = state.activity?.let(
      (it) => it.upsertUniqueReaction(activity, reaction, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a reaction is deleted from the activity.
  void onReactionRemoved(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    final updatedActivity = state.activity?.let(
      (it) => it.removeReaction(activity, reaction, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a bookmark is added to the activity.
  void onBookmarkAdded(BookmarkData bookmark) {
    final updatedActivity = state.activity?.let(
      (it) => it.upsertBookmark(bookmark, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a bookmark is updated on the activity.
  void onBookmarkUpdated(BookmarkData bookmark) {
    final updatedActivity = state.activity?.let(
      (it) => it.upsertBookmark(bookmark, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a bookmark is removed from the activity.
  void onBookmarkRemoved(BookmarkData bookmark) {
    final updatedActivity = state.activity?.let(
      (it) => it.removeBookmark(bookmark, currentUserId),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll is closed.
  void onPollClosed(PollData poll) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(poll: poll.copyWith(isClosed: true)),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll is deleted.
  void onPollDeleted(String pollId) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == pollId,
      update: (it) => it.copyWith(poll: null),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll is updated.
  void onPollUpdated(PollData poll) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(poll: it.poll?.updateWith(poll)),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll answer is casted.
  void onPollAnswerCasted(PollData poll, PollVoteData answer) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertAnswer(poll, answer, currentUserId),
      ),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll vote is casted (with poll data).
  void onPollVoteCasted(PollData poll, PollVoteData vote) {
    return onPollVoteChanged(poll, vote);
  }

  /// Handles when a poll vote is changed.
  void onPollVoteChanged(PollData poll, PollVoteData vote) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertVote(poll, vote, currentUserId),
      ),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll answer is removed (with poll data).
  void onPollAnswerRemoved(PollData poll, PollVoteData answer) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.removeAnswer(poll, answer, currentUserId),
      ),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll vote is removed (with poll data).
  void onPollVoteRemoved(PollData poll, PollVoteData vote) {
    final updatedActivity = state.activity?.updateIf(
      filter: (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.removeVote(poll, vote, currentUserId),
      ),
    );

    state = state.copyWith(activity: updatedActivity);
  }

  @override
  void dispose() {
    _removeCommentListListener?.call();
    super.dispose();
  }
}

/// An observable state object that manages the current state of an activity.
///
/// Maintains the current activity data, comments, and poll information for
/// comprehensive activity management and real-time updates.
@freezed
class ActivityState with _$ActivityState {
  const ActivityState({
    this.activity,
    this.comments = const [],
    this.commentsPagination,
  });

  /// The current activity data.
  ///
  /// Contains all the activity information including metadata, content,
  /// and associated poll data if available.
  @override
  final ActivityData? activity;

  /// The poll associated with this activity, if any.
  ///
  /// Contains poll information including options, votes, and poll state.
  /// This field is automatically updated when the activity has poll data.
  PollData? get poll => activity?.poll;

  /// The comments associated with this activity.
  ///
  /// Contains a list of threaded comments related to the activity.
  @override
  final List<CommentData> comments;

  /// Pagination information for [comments].
  @override
  final PaginationData? commentsPagination;

  /// Indicates whether there are more [comments] available to load.
  ///
  /// Returns true if there is a next page available for pagination.
  bool get canLoadMoreComments => commentsPagination?.next != null;
}

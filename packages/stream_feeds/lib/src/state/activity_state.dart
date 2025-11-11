import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

import '../models/activity_data.dart';
import '../models/comment_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_vote_data.dart';
import '../models/threaded_comment_data.dart';
import 'activity_comment_list_state.dart';
import 'event/partial_activity_event_handler.dart';

part 'activity_state.freezed.dart';

/// Manages the state of an activity and handles state updates.
///
/// Provides methods to update the activity state in response to data changes
/// and real-time events from the Stream Feeds API.
class ActivityStateNotifier extends StateNotifier<ActivityState>
    implements StateWithUpdatableActivity {
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

  /// Handles the update of an activity.
  @override
  void onActivityUpdated(ActivityData activity) {
    state = state.copyWith(
      activity: activity,
      poll: activity.poll,
    );
  }

  /// Handles when a poll is closed.
  @override
  void onPollClosed(PollData poll) {
    if (state.poll?.id != poll.id) return;

    final updatedPoll = state.poll?.copyWith(isClosed: true);
    state = state.copyWith(poll: updatedPoll ?? poll);
  }

  /// Handles when a poll is deleted.
  @override
  void onPollDeleted(String pollId) {
    if (state.poll?.id != pollId) return;
    state = state.copyWith(poll: null);
  }

  /// Handles when a poll is updated.
  @override
  void onPollUpdated(PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final updatedPoll = poll.copyWith(
      latestAnswers: currentPoll.latestAnswers,
      ownVotesAndAnswers: currentPoll.ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll answer is casted.
  @override
  void onPollAnswerCasted(PollVoteData answer, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final updatedPoll = poll.castAnswer(
      answer,
      currentUserId,
      currentLatestAnswers: currentPoll.latestAnswers,
      currentOwnVotesAndAnswers: currentPoll.ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll vote is casted (with poll data).
  @override
  void onPollVoteCasted(PollVoteData vote, PollData poll) {
    return onPollVoteChanged(vote, poll);
  }

  /// Handles when a poll vote is changed.
  @override
  void onPollVoteChanged(PollVoteData vote, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final updatedPoll = poll.changeVote(
      vote,
      currentUserId,
      currentLatestVotes: currentPoll.latestVotes,
      currentOwnVotesAndAnswers: currentPoll.ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll answer is removed (with poll data).
  @override
  void onPollAnswerRemoved(PollVoteData answer, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final updatedPoll = poll.removeAnswer(
      answer,
      currentUserId,
      currentLatestAnswers: currentPoll.latestAnswers,
      currentOwnVotesAndAnswers: currentPoll.ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll vote is removed (with poll data).
  @override
  void onPollVoteRemoved(PollVoteData vote, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final updatedPoll = poll.removeVote(
      vote,
      currentUserId,
      currentLatestVotes: currentPoll.latestVotes,
      currentOwnVotesAndAnswers: currentPoll.ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  @override
  void onCommentAdded(CommentData comment) {
    // The comments are stored in the comment list, but that doesn't contain the total count.
    if (state.activity case final activity?) {
      state = state.copyWith(
        activity: activity.copyWith(
          commentCount: math.max(0, activity.commentCount + 1),
        ),
      );
    }
  }

  @override
  void onCommentRemoved(CommentData comment) {
    // The comments are stored in the comment list, but that doesn't contain the total count.
    if (state.activity case final activity?) {
      state = state.copyWith(
        activity: activity.copyWith(
          commentCount: math.max(0, activity.commentCount - 1),
        ),
      );
    }
  }

  @override
  void onReactionAdded(FeedsReactionData reaction) {
    final activity = state.activity;
    if (activity == null || activity.id != reaction.activityId) return;

    state = state.copyWith(
      activity: activity.addReaction(reaction, currentUserId),
    );
  }

  @override
  void onReactionRemoved(FeedsReactionData reaction) {
    final activity = state.activity;
    if (activity == null || reaction.activityId != activity.id) return;

    state = state.copyWith(
      activity: activity.removeReaction(reaction, currentUserId),
    );
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
    this.poll,
  });

  /// The current activity data.
  ///
  /// Contains all the activity information including metadata, content,
  /// and associated poll data if available.
  @override
  final ActivityData? activity;

  /// The comments associated with this activity.
  ///
  /// Contains a list of threaded comments related to the activity.
  @override
  final List<ThreadedCommentData> comments;

  /// Pagination information for [comments].
  @override
  final PaginationData? commentsPagination;

  /// Indicates whether there are more [comments] available to load.
  ///
  /// Returns true if there is a next page available for pagination.
  bool get canLoadMoreComments => commentsPagination?.next != null;

  /// The poll associated with this activity, if any.
  ///
  /// Contains poll information including options, votes, and poll state.
  /// This field is automatically updated when the activity has poll data.
  @override
  final PollData? poll;
}

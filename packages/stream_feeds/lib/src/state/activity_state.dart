import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/activity_data.dart';
import '../models/comment_data.dart';
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

  /// Handles the update of an activity.
  void onActivityUpdated(ActivityData activity) {
    state = state.copyWith(
      activity: activity,
      poll: activity.poll,
    );
  }

  /// Handles updates to the activity's hidden status.
  void onActivityHidden({
    required bool hidden,
  }) {
    final currentActivity = state.activity;
    final updatedActivity = currentActivity?.copyWith(hidden: hidden);

    state = state.copyWith(activity: updatedActivity);
  }

  /// Handles when a poll is closed.
  void onPollClosed(PollData poll) {
    if (state.poll?.id != poll.id) return;

    final updatedPoll = state.poll?.copyWith(isClosed: true);
    state = state.copyWith(poll: updatedPoll ?? poll);
  }

  /// Handles when a poll is deleted.
  void onPollDeleted(String pollId) {
    if (state.poll?.id != pollId) return;
    state = state.copyWith(poll: null);
  }

  /// Handles when a poll is updated.
  void onPollUpdated(PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final latestAnswers = currentPoll.latestAnswers;
    final ownVotesAndAnswers = currentPoll.ownVotesAndAnswers;

    final updatedPoll = poll.copyWith(
      latestAnswers: latestAnswers,
      ownVotesAndAnswers: ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll answer is casted.
  void onPollAnswerCasted(PollVoteData answer, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final latestAnswers = currentPoll.latestAnswers.let((it) {
      return it.upsert(answer, key: (it) => it.id == answer.id);
    });

    final ownVotesAndAnswers = currentPoll.ownVotesAndAnswers.let((it) {
      if (answer.userId != currentUserId) return it;
      return it.upsert(answer, key: (it) => it.id == answer.id);
    });

    final updatedPoll = poll.copyWith(
      latestAnswers: latestAnswers,
      ownVotesAndAnswers: ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll vote is casted (with poll data).
  void onPollVoteCasted(PollVoteData vote, PollData poll) {
    return onPollVoteChanged(vote, poll);
  }

  /// Handles when a poll vote is changed.
  void onPollVoteChanged(PollVoteData vote, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final latestAnswers = currentPoll.latestAnswers;
    final ownVotesAndAnswers = currentPoll.ownVotesAndAnswers.let((it) {
      if (vote.userId != currentUserId) return it;
      return it.upsert(vote, key: (it) => it.id == vote.id);
    });

    final updatedPoll = poll.copyWith(
      latestAnswers: latestAnswers,
      ownVotesAndAnswers: ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll answer is removed (with poll data).
  void onPollAnswerRemoved(PollVoteData answer, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final latestAnswers = currentPoll.latestAnswers.where((it) {
      return it.id != answer.id;
    }).toList();

    final ownVotesAndAnswers = currentPoll.ownVotesAndAnswers.where((it) {
      return it.id != answer.id;
    }).toList();

    final updatedPoll = poll.copyWith(
      latestAnswers: latestAnswers,
      ownVotesAndAnswers: ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
  }

  /// Handles when a poll vote is removed (with poll data).
  void onPollVoteRemoved(PollVoteData vote, PollData poll) {
    final currentPoll = state.poll;
    if (currentPoll == null || currentPoll.id != poll.id) return;

    final latestAnswers = currentPoll.latestAnswers;
    final ownVotesAndAnswers = currentPoll.ownVotesAndAnswers.where((it) {
      return it.id != vote.id;
    }).toList();

    final updatedPoll = poll.copyWith(
      latestAnswers: latestAnswers,
      ownVotesAndAnswers: ownVotesAndAnswers,
    );

    state = state.copyWith(poll: updatedPoll);
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
  final List<CommentData> comments;

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

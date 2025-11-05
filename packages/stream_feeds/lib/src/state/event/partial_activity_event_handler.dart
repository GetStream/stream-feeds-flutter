import '../../../stream_feeds.dart';
import '../../../stream_feeds.dart' as api;
import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../../models/poll_data.dart';
import '../../repository/capabilities_repository.dart';
import '../../resolvers/resolvers.dart';
import 'feed_capabilities_mixin.dart';

class PartialActivityEventHandler with FeedCapabilitiesMixin {
  const PartialActivityEventHandler({
    required this.fid,
    required this.state,
    required this.capabilitiesRepository,
  });

  final FeedId fid;
  final StateWithUpdatableActivity state;
  @override
  final CapabilitiesRepository capabilitiesRepository;

  Future<bool> handleEvent(WsEvent event) async {
    if (event is api.ActivityUpdatedEvent) {
      if (event.fid != fid.rawValue) return false;

      final activity = event.activity.toModel();
      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      state.onActivityUpdated(updatedActivity ?? activity);
      return true;
    }

    if (event is api.ActivityReactionAddedEvent) {
      if (event.fid != fid.rawValue) return false;

      state.onReactionAdded(event.reaction.toModel());
      return true;
    }
    if (event is api.ActivityReactionDeletedEvent) {
      if (event.fid != fid.rawValue) return false;

      state.onReactionRemoved(event.reaction.toModel());
      return true;
    }

    if (event is api.CommentAddedEvent) {
      if (event.fid != fid.rawValue) return false;

      state.onCommentAdded(event.comment.toModel());
      return true;
    }

    if (event is api.CommentDeletedEvent) {
      if (event.fid != fid.rawValue) return false;
      state.onCommentRemoved(event.comment.toModel());
      return true;
    }

    if (event is api.PollClosedFeedEvent) {
      state.onPollClosed(event.poll.toModel());
      return true;
    }

    if (event is api.PollDeletedFeedEvent) {
      state.onPollDeleted(event.poll.id);
      return true;
    }

    if (event is api.PollUpdatedFeedEvent) {
      state.onPollUpdated(event.poll.toModel());
      return true;
    }

    if (event is PollAnswerCastedFeedEvent) {
      final answer = event.pollVote.toModel();
      final poll = event.poll.toModel();
      state.onPollAnswerCasted(answer, poll);
      return true;
    }

    if (event is api.PollVoteCastedFeedEvent) {
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      state.onPollVoteCasted(vote, poll);
      return true;
    }

    if (event is api.PollVoteChangedFeedEvent) {
      // Only handle events for this specific feed
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      state.onPollVoteChanged(vote, poll);
      return true;
    }

    if (event is PollAnswerRemovedFeedEvent) {
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      state.onPollAnswerRemoved(vote, poll);
      return true;
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      state.onPollVoteRemoved(vote, poll);
      return true;
    }

    return false;
  }
}

abstract interface class StateWithUpdatableActivity {
  void onActivityUpdated(ActivityData activity);
  void onReactionAdded(FeedsReactionData reaction);
  void onReactionRemoved(FeedsReactionData reaction);
  void onCommentAdded(CommentData comment);
  void onCommentRemoved(CommentData comment);

  void onPollClosed(PollData poll);
  void onPollDeleted(String pollId);
  void onPollUpdated(PollData poll);
  void onPollAnswerCasted(PollVoteData answer, PollData poll);
  void onPollVoteCasted(PollVoteData vote, PollData poll);
  void onPollVoteChanged(PollVoteData vote, PollData poll);
  void onPollAnswerRemoved(PollVoteData vote, PollData poll);
  void onPollVoteRemoved(PollVoteData vote, PollData poll);
}

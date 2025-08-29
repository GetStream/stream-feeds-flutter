import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/feed_id.dart';
import '../../models/poll_data.dart';
import '../../models/poll_vote_data.dart';
import '../../resolvers/poll/poll_answer_casted.dart';
import '../../resolvers/poll/poll_answer_removed.dart';
import '../activity_state.dart';
import 'state_event_handler.dart';

/// Event handler for activity real-time updates.
///
/// Processes WebSocket events related to polls and their associated voting
/// and updates the activity state accordingly.
class ActivityEventHandler implements StateEventHandler {
  const ActivityEventHandler({
    required this.fid,
    required this.state,
  });

  final FeedId fid;
  final ActivityStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.PollClosedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      return state.onPollClosed(event.poll.toModel());
    }

    if (event is api.PollDeletedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      return state.onPollDeleted(event.poll.id);
    }

    if (event is api.PollUpdatedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      return state.onPollUpdated(event.poll.toModel());
    }

    if (event is PollAnswerCastedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      final answer = event.pollVote.toModel();
      final poll = event.poll.toModel();
      return state.onPollAnswerCasted(answer, poll);
    }

    if (event is api.PollVoteCastedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      return state.onPollVoteCasted(vote, poll);
    }

    if (event is api.PollVoteChangedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      return state.onPollVoteChanged(vote, poll);
    }

    if (event is PollAnswerRemovedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      return state.onPollAnswerRemoved(vote, poll);
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      // Only handle events for this specific feed
      if (event.fid != fid.rawValue) return;
      final vote = event.pollVote.toModel();
      final poll = event.poll.toModel();
      return state.onPollVoteRemoved(vote, poll);
    }

    // Handle other activity events here as needed
  }
}

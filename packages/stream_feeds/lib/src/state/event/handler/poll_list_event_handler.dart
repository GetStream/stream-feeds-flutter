import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/poll_data.dart';
import '../../../models/poll_vote_data.dart';
import '../../../resolvers/resolvers.dart';
import '../../../utils/filter.dart';
import '../../poll_list_state.dart';
import '../../query/polls_query.dart';
import 'state_event_handler.dart';

/// Event handler for poll list real-time updates.
///
/// Processes WebSocket events related to polls
/// and updates the poll list state accordingly.
class PollListEventHandler implements StateEventHandler {
  const PollListEventHandler({
    required this.query,
    required this.state,
    required this.currentUserId,
  });

  final PollsQuery query;
  final PollListStateNotifier state;
  final String currentUserId;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.PollDeletedFeedEvent) {
      return state.onPollRemoved(event.poll.id);
    }

    if (event is api.PollUpdatedFeedEvent) {
      final poll = event.poll.toModel();
      if (!poll.matches(query.filter)) {
        // If the updated poll no longer matches the filter, remove it
        return state.onPollRemoved(poll.id);
      }

      return state.onPollUpdated(poll);
    }

    if (event is api.PollClosedFeedEvent) {
      final poll = event.poll.toModel();
      if (!poll.matches(query.filter)) {
        // If the closed poll no longer matches the filter, remove it
        return state.onPollRemoved(poll.id);
      }

      return state.onPollClosed(poll);
    }

    if (event is api.PollVoteCastedFeedEvent) {
      final poll = event.poll.toModel();
      final pollVote = event.pollVote.toModel();
      return state.onPollVoteCasted(poll, pollVote);
    }

    if (event is PollAnswerCastedFeedEvent) {
      final poll = event.poll.toModel();
      final pollVote = event.pollVote.toModel();
      return state.onPollAnswerCasted(poll, pollVote);
    }

    if (event is api.PollVoteChangedFeedEvent) {
      final poll = event.poll.toModel();
      final pollVote = event.pollVote.toModel();
      return state.onPollVoteChanged(poll, pollVote);
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      final poll = event.poll.toModel();
      final pollVote = event.pollVote.toModel();
      return state.onPollVoteRemoved(poll, pollVote);
    }

    if (event is PollAnswerRemovedFeedEvent) {
      final poll = event.poll.toModel();
      final pollVote = event.pollVote.toModel();
      return state.onPollAnswerRemoved(poll, pollVote);
    }

    // Handle other poll list events here as needed
  }
}

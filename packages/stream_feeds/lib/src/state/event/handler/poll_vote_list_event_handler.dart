import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/poll_vote_data.dart';
import '../../../utils/filter.dart';
import '../../poll_vote_list_state.dart';
import '../../query/poll_votes_query.dart';
import 'state_event_handler.dart';

/// Event handler for poll vote list real-time updates.
///
/// Processes WebSocket events related to poll votes on a specific poll
/// and updates the poll vote list state accordingly.
class PollVoteListEventHandler implements StateEventHandler {
  const PollVoteListEventHandler({
    required this.query,
    required this.state,
  });

  final PollVotesQuery query;
  final PollVoteListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.PollDeletedFeedEvent) {
      if (event.poll.id != query.pollId) return;
      return state.onPollDeleted();
    }

    if (event is api.PollVoteCastedFeedEvent) {
      // Only handle votes for this specific poll
      if (event.pollVote.pollId != query.pollId) return;

      final pollVote = event.pollVote.toModel();
      if (!pollVote.matches(query.filter)) return;

      return state.onPollVoteAdded(pollVote);
    }

    if (event is api.PollVoteChangedFeedEvent) {
      // Only handle votes for this specific poll
      if (event.pollVote.pollId != query.pollId) return;

      final pollVote = event.pollVote.toModel();
      if (!pollVote.matches(query.filter)) {
        // If the updated poll vote no longer matches the filter, remove it
        return state.onPollVoteRemoved(pollVote.id);
      }

      return state.onPollVoteUpdated(pollVote);
    }

    if (event is api.PollVoteRemovedFeedEvent) {
      // Only handle votes for this specific poll
      if (event.poll.id != query.pollId) return;
      return state.onPollVoteRemoved(event.pollVote.id);
    }

    // Handle other poll vote list events here as needed
  }
}

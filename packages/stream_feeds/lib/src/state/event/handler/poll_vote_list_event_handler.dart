import '../../../utils/filter.dart';
import '../../poll_vote_list_state.dart';
import '../../query/poll_votes_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

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
  void handleEvent(StateUpdateEvent event) {
    if (event is PollDeleted) {
      if (event.pollId != query.pollId) return;
      return state.onPollDeleted();
    }

    if (event is PollVoteCasted) {
      // Only handle votes for this specific poll
      if (event.vote.pollId != query.pollId) return;
      // Check if the vote matches the query filter
      if (!event.vote.matches(query.filter)) return;

      return state.onPollVoteUpserted(event.vote);
    }

    if (event is PollVoteChanged) {
      // Only handle votes for this specific poll
      if (event.vote.pollId != query.pollId) return;
      if (!event.vote.matches(query.filter)) {
        // If the updated poll vote no longer matches the filter, remove it
        return state.onPollVoteRemoved(event.vote.id);
      }

      return state.onPollVoteUpserted(event.vote);
    }

    if (event is PollVoteRemoved) {
      // Only handle votes for this specific poll
      if (event.vote.pollId != query.pollId) return;
      return state.onPollVoteRemoved(event.vote.id);
    }

    // Handle other poll vote list events here as needed
  }
}

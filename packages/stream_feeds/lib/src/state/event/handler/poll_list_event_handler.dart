import '../../../utils/filter.dart';
import '../../poll_list_state.dart';
import '../../query/polls_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for poll list real-time updates.
///
/// Processes WebSocket events related to polls
/// and updates the poll list state accordingly.
class PollListEventHandler implements StateEventHandler {
  const PollListEventHandler({
    required this.query,
    required this.state,
  });

  final PollsQuery query;
  final PollListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is PollDeleted) {
      return state.onPollRemoved(event.pollId);
    }

    if (event is PollClosed) {
      if (!event.poll.matches(query.filter)) {
        // If the updated poll no longer matches the filter, remove it
        return state.onPollRemoved(event.poll.id);
      }

      return state.onPollClosed(event.poll.id);
    }

    if (event is PollUpdated) {
      if (!event.poll.matches(query.filter)) {
        // If the updated poll no longer matches the filter, remove it
        return state.onPollRemoved(event.poll.id);
      }

      return state.onPollUpdated(event.poll);
    }

    if (event is PollVoteCasted) {
      return state.onPollVoteUpserted(event.poll, event.vote);
    }

    if (event is PollVoteChanged) {
      return state.onPollVoteUpserted(event.poll, event.vote);
    }

    if (event is PollVoteRemoved) {
      return state.onPollVoteRemoved(event.poll, event.vote);
    }

    // Handle other poll list events here as needed
  }
}

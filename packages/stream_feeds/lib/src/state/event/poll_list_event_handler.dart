import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/poll_data.dart';
import '../poll_list_state.dart';
import '../query/polls_query.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    bool matchesQueryFilter(PollData poll) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(poll);
    }

    if (event is api.PollUpdatedFeedEvent) {
      final poll = event.poll.toModel();
      if (!matchesQueryFilter(poll)) {
        // If the updated poll no longer matches the filter, remove it
        return state.onPollRemoved(poll.id);
      }

      return state.onPollUpdated(poll);
    }

    // Handle other poll list events here as needed
  }
}

import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/poll_data.dart';
import '../poll_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for poll list real-time updates.
///
/// Processes WebSocket events related to polls
/// and updates the poll list state accordingly.
class PollListEventHandler implements StateEventHandler {
  const PollListEventHandler({
    required this.state,
  });

  final PollListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.PollUpdatedFeedEvent) {
      return state.onPollUpdated(event.poll.toModel());
    }

    // Handle other poll list events here as needed
  }
}

import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/follow_data.dart';
import '../follow_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for follow list real-time updates.
///
/// Processes WebSocket events related to follow relationships
/// and updates the follow list state accordingly.
class FollowListEventHandler implements StateEventHandler {
  const FollowListEventHandler({
    required this.state,
  });

  final FollowListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.FollowUpdatedEvent) {
      return state.onFollowUpdated(event.follow.toModel());
    }

    // Handle other follow list events here as needed
  }
}

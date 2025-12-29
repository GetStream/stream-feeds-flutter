import 'package:stream_core/stream_core.dart';

import '../../../models/follow_data.dart';
import '../../../models/model_updates.dart';
import '../../../utils/filter.dart';
import '../../follow_list_state.dart';
import '../../query/follows_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for follow list real-time updates.
///
/// Processes WebSocket events related to follow relationships
/// and updates the follow list state accordingly.
class FollowListEventHandler implements StateEventHandler {
  const FollowListEventHandler({
    required this.query,
    required this.state,
  });

  final FollowsQuery query;
  final FollowListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is FollowAdded) {
      // Check if the new follow matches the query filter
      if (!event.follow.matches(query.filter)) return;

      return state.onFollowAdded(event.follow);
    }

    if (event is FollowUpdated) {
      if (!event.follow.matches(query.filter)) {
        // If the updated follow no longer matches the query filter, remove it
        return state.onFollowRemoved(event.follow.id);
      }

      return state.onFollowUpdated(event.follow);
    }

    if (event is FollowDeleted) {
      return state.onFollowRemoved(event.follow.id);
    }

    // Handle other follow list events here as needed
  }
}

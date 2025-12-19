import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/follow_data.dart';
import '../../../utils/filter.dart';
import '../../follow_list_state.dart';
import '../../query/follows_query.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    if (event is api.FollowCreatedEvent) {
      final follow = event.follow.toModel();
      // Check if the new follow matches the query filter
      if (!follow.matches(query.filter)) return;

      return state.onFollowAdded(follow);
    }

    if (event is api.FollowUpdatedEvent) {
      final follow = event.follow.toModel();
      if (!follow.matches(query.filter)) {
        // If the updated follow no longer matches the query filter, remove it
        return state.onFollowRemoved(follow.id);
      }

      return state.onFollowUpdated(follow);
    }

    if (event is api.FollowDeletedEvent) {
      final follow = event.follow.toModel();
      return state.onFollowRemoved(follow.id);
    }

    // Handle other follow list events here as needed
  }
}

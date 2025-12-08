import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/follow_data.dart';
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
    bool matchesQueryFilter(FollowData follow) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(follow);
    }

    if (event is api.FollowUpdatedEvent) {
      final follow = event.follow.toModel();
      if (!matchesQueryFilter(follow)) {
        // If the updated follow no longer matches the query filter, remove it
        return state.onFollowRemoved(follow.id);
      }

      return state.onFollowUpdated(follow);
    }

    // Handle other follow list events here as needed
  }
}

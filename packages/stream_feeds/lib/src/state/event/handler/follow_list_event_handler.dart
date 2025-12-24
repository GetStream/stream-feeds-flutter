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

    if (event is FollowBatchUpdate) {
      // Filter added and updated follows based on the query filter
      bool matchesFilter(FollowData it) => it.matches(query.filter);

      final added = event.updates.added.where(matchesFilter).toList();
      // We remove elements that used to match the filter but no longer do
      final (updated, removed) = event.updates.updated.partition(matchesFilter);

      final removedIds = event.updates.removedIds;
      removedIds.addAll(removed.map((it) => it.id));

      return state.onFollowsUpdated(
        ModelUpdates(added: added, updated: updated, removedIds: removedIds),
      );
    }

    // Handle other follow list events here as needed
  }
}

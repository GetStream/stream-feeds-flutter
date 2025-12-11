import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feeds_reaction_data.dart';
import '../../activity_reaction_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for activity reaction list real-time updates.
///
/// Processes WebSocket events related to reactions on a specific activity
/// and updates the activity reaction list state accordingly.
class ActivityReactionListEventHandler implements StateEventHandler {
  const ActivityReactionListEventHandler({
    required this.activityId,
    required this.state,
  });

  final String activityId;
  final ActivityReactionListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.ActivityReactionDeletedEvent) {
      // Only handle reactions for this specific activity
      if (event.activity.id != activityId) return;
      return state.onReactionRemoved(event.reaction.toModel());
    }

    // Handle other activity reaction events if needed
  }
}

import '../../activity_reaction_list_state.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

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
  void handleEvent(StateUpdateEvent event) {
    if (event is ActivityDeleted) {
      // Only handle deletion for this specific activity
      if (event.activityId != activityId) return;
      return state.onActivityDeleted();
    }

    if (event is ActivityReactionUpserted) {
      // Only handle reactions for this specific activity
      if (event.reaction.activityId != activityId) return;
      return state.onReactionUpserted(
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is ActivityReactionDeleted) {
      // Only handle reactions for this specific activity
      if (event.reaction.activityId != activityId) return;
      return state.onReactionRemoved(event.reaction);
    }

    // Handle other activity reaction events if needed
  }
}

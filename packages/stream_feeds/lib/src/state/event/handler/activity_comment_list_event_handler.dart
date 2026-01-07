import '../../activity_comment_list_state.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for activity comment list real-time updates.
///
/// Processes WebSocket events related to comments on a specific activity
/// and updates the activity comment list state accordingly.
class ActivityCommentListEventHandler implements StateEventHandler {
  const ActivityCommentListEventHandler({
    required this.objectId,
    required this.objectType,
    required this.state,
  });

  final String objectId;
  final String objectType;
  final ActivityCommentListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is ActivityDeleted) {
      // Only handle deletion for this specific activity
      if (event.activityId != objectId) return;
      return state.onActivityDeleted();
    }

    if (event is CommentAdded) {
      // Only handle comments for this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      return state.onCommentAdded(event.comment);
    }

    if (event is CommentUpdated) {
      // Only handle comments for this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      return state.onCommentUpdated(event.comment);
    }

    if (event is CommentDeleted) {
      // Only handle comments for this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      return state.onCommentRemoved(event.comment);
    }

    if (event is CommentReactionUpserted) {
      // Only handle reactions for comments on this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      return state.onCommentReactionUpserted(
        event.comment,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      // Only handle reactions for comments on this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      return state.onCommentReactionRemoved(event.comment, event.reaction);
    }

    // Handle other comment-related events if needed
  }
}

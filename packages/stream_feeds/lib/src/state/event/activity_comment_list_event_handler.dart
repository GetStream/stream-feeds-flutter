import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../activity_comment_list_state.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    if (event is api.CommentAddedEvent) {
      // Only handle comments for this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;

      final comment = event.comment.toModel();
      return state.onCommentAdded(comment);
    }

    if (event is api.CommentUpdatedEvent) {
      // Only handle comments for this specific activity
      if (event.comment.objectId != objectId) return;
      if (event.comment.objectType != objectType) return;
      return state.onCommentUpdated(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      final comment = event.comment.toModel();
      // Only handle comments for this specific activity
      if (comment.objectId != objectId) return;
      if (comment.objectType != objectType) return;

      return state.onCommentRemoved(comment.id);
    }

    if (event is api.CommentReactionAddedEvent) {
      final comment = event.comment.toModel();
      // Only handle reactions for comments on this specific activity
      if (comment.objectId != objectId) return;
      if (comment.objectType != objectType) return;

      final reaction = event.reaction.toModel();
      return state.onCommentReactionAdded(comment, reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      final comment = event.comment.toModel();
      // Only handle reactions for comments on this specific activity
      if (comment.objectId != objectId) return;
      if (comment.objectType != objectType) return;

      final reaction = event.reaction.toModel();
      return state.onCommentReactionUpdated(comment, reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      final comment = event.comment.toModel();
      // Only handle reactions for comments on this specific activity
      if (comment.objectId != objectId) return;
      if (comment.objectType != objectType) return;

      final reaction = event.reaction.toModel();
      return state.onCommentReactionRemoved(comment, reaction);
    }

    // Handle other comment-related events if needed
  }
}

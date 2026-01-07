import '../../comment_reply_list_state.dart';
import '../../query/comment_replies_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for comment reply list real-time updates.
///
/// Processes WebSocket events related to comments and their replies
/// and updates the comment reply list state accordingly.
class CommentReplyListEventHandler implements StateEventHandler {
  const CommentReplyListEventHandler({
    required this.query,
    required this.state,
  });

  final CommentRepliesQuery query;
  final CommentReplyListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is CommentAdded) {
      if (event.comment.parentId == null) return;

      return state.onReplyAdded(event.comment);
    }

    if (event is CommentDeleted) {
      if (event.comment.id == query.commentId) {
        // If the parent comment is deleted, clear all replies
        return state.onParentCommentDeleted();
      }

      if (event.comment.parentId == null) return;

      return state.onReplyRemoved(event.comment);
    }

    if (event is CommentUpdated) {
      if (event.comment.parentId == null) return;

      return state.onReplyUpdated(event.comment);
    }

    if (event is CommentReactionUpserted) {
      if (event.comment.parentId == null) return;

      return state.onReplyReactionUpserted(
        event.comment,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      if (event.comment.parentId == null) return;

      return state.onReplyReactionRemoved(event.comment, event.reaction);
    }

    // Handle other comment reply list events here as needed
  }
}

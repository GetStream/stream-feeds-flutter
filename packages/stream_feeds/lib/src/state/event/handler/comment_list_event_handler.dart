import '../../../utils/filter.dart';
import '../../comment_list_state.dart';
import '../../query/comments_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for comment list real-time updates.
///
/// Processes WebSocket events and updates the comment list state accordingly.
class CommentListEventHandler implements StateEventHandler {
  const CommentListEventHandler({
    required this.query,
    required this.state,
  });

  final CommentsQuery query;
  final CommentListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is CommentAdded) {
      // Check if the new comment matches the query filter
      if (!event.comment.matches(query.filter)) return;

      return state.onCommentAdded(event.comment);
    }

    if (event is CommentUpdated) {
      if (!event.comment.matches(query.filter)) {
        // If the updated comment no longer matches the filter, remove it
        return state.onCommentRemoved(event.comment.id);
      }

      return state.onCommentUpdated(event.comment);
    }

    if (event is CommentDeleted) {
      return state.onCommentRemoved(event.comment.id);
    }

    if (event is CommentReactionUpserted) {
      return state.onCommentReactionUpserted(
        event.comment,
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      return state.onCommentReactionRemoved(event.comment, event.reaction);
    }

    // Handle other comment-related events if needed
  }
}

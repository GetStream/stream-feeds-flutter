import '../../../utils/filter.dart';
import '../../comment_reaction_list_state.dart';
import '../../query/comment_reactions_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for comment reaction list real-time updates.
///
/// Processes WebSocket events related to reactions on a specific comment
/// and updates the comment reaction list state accordingly.
class CommentReactionListEventHandler implements StateEventHandler {
  const CommentReactionListEventHandler({
    required this.query,
    required this.state,
  });

  final CommentReactionsQuery query;
  final CommentReactionListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is CommentDeleted) {
      if (event.comment.id != query.commentId) return;
      return state.onCommentDeleted();
    }

    if (event is CommentReactionUpserted) {
      if (event.comment.id != query.commentId) return;
      if (!event.reaction.matches(query.filter)) return;

      return state.onReactionUpserted(
        event.reaction,
        enforceUnique: event.enforceUnique,
      );
    }

    if (event is CommentReactionDeleted) {
      if (event.comment.id != query.commentId) return;
      return state.onReactionRemoved(event.reaction);
    }

    // Handle other comment reaction list events here as needed
  }
}

import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feeds_reaction_data.dart';
import '../../../utils/filter.dart';
import '../../comment_reaction_list_state.dart';
import '../../query/comment_reactions_query.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    if (event is api.CommentDeletedEvent) {
      if (event.comment.id != query.commentId) return;
      return state.onCommentDeleted();
    }

    if (event is api.CommentReactionAddedEvent) {
      if (event.comment.id != query.commentId) return;
      final reaction = event.reaction.toModel();
      if (!reaction.matches(query.filter)) return;

      return state.onReactionAdded(reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      if (event.comment.id != query.commentId) return;
      final reaction = event.reaction.toModel();
      if (!reaction.matches(query.filter)) {
        // If the updated reaction no longer matches the filter, remove it
        return state.onReactionRemoved(reaction);
      }

      return state.onReactionUpdated(reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      return state.onReactionRemoved(event.reaction.toModel());
    }

    // Handle other comment reaction list events here as needed
  }
}

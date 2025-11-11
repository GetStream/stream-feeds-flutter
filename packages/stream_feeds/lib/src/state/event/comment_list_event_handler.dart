import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;

import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../comment_list_state.dart';
import '../query/comments_query.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    bool matchesQueryFilter(CommentData comment) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(comment);
    }

    if (event is api.CommentUpdatedEvent) {
      final comment = event.comment.toModel();
      if (!matchesQueryFilter(comment)) {
        // If the updated comment no longer matches the filter, remove it
        return state.onCommentRemoved(comment.id);
      }

      return state.onCommentUpdated(comment);
    }

    if (event is api.CommentDeletedEvent) {
      return state.onCommentRemoved(event.comment.id);
    }

    if (event is api.CommentReactionAddedEvent) {
      return state.onCommentReactionAdded(
        event.comment.id,
        event.reaction.toModel(),
      );
    }

    if (event is api.CommentReactionDeletedEvent) {
      return state.onCommentReactionRemoved(
        event.comment.id,
        event.reaction.toModel(),
      );
    }

    // Handle other comment-related events if needed
  }
}

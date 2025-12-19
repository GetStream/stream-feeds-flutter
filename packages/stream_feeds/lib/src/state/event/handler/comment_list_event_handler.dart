import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;

import '../../../models/comment_data.dart';
import '../../../models/feeds_reaction_data.dart';
import '../../../utils/filter.dart';
import '../../comment_list_state.dart';
import '../../query/comments_query.dart';
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
    if (event is api.CommentAddedEvent) {
      final comment = event.comment.toModel();
      // Check if the new comment matches the query filter
      if (!comment.matches(query.filter)) return;

      return state.onCommentAdded(comment);
    }

    if (event is api.CommentUpdatedEvent) {
      final comment = event.comment.toModel();
      if (!comment.matches(query.filter)) {
        // If the updated comment no longer matches the filter, remove it
        return state.onCommentRemoved(comment.id);
      }

      return state.onCommentUpdated(comment);
    }

    if (event is api.CommentDeletedEvent) {
      return state.onCommentRemoved(event.comment.id);
    }

    if (event is api.CommentReactionAddedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionAdded(comment, reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionUpdated(comment, reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      final comment = event.comment.toModel();
      final reaction = event.reaction.toModel();
      return state.onCommentReactionRemoved(comment, reaction);
    }

    // Handle other comment-related events if needed
  }
}

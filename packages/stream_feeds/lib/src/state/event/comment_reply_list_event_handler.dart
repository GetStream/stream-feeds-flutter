import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../comment_reply_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for comment reply list real-time updates.
///
/// Processes WebSocket events related to comments and their replies
/// and updates the comment reply list state accordingly.
class CommentReplyListEventHandler implements StateEventHandler {
  const CommentReplyListEventHandler({
    required this.state,
  });

  final CommentReplyListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.CommentAddedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      return state.onReplyAdded(comment);
    }

    if (event is api.CommentDeletedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      return state.onReplyRemoved(comment);
    }

    if (event is api.CommentUpdatedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      return state.onReplyUpdated(comment);
    }

    if (event is api.CommentReactionAddedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      final reaction = event.reaction.toModel();
      return state.onReplyReactionAdded(comment, reaction);
    }

    if (event is api.CommentReactionUpdatedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      final reaction = event.reaction.toModel();
      return state.onReplyReactionUpdated(comment, reaction);
    }

    if (event is api.CommentReactionDeletedEvent) {
      final comment = event.comment.toModel();
      if (comment.parentId == null) return;

      final reaction = event.reaction.toModel();
      return state.onReplyReactionRemoved(comment, reaction);
    }

    // Handle other comment reply list events here as needed
  }
}

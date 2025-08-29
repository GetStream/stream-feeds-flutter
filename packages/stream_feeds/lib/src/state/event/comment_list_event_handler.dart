import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;

import '../../models/comment_data.dart';
import '../comment_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for comment list real-time updates.
///
/// Processes WebSocket events and updates the comment list state accordingly.
class CommentListEventHandler implements StateEventHandler {
  const CommentListEventHandler({
    required this.state,
  });

  final CommentListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.CommentUpdatedEvent) {
      return state.onCommentUpdated(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      return state.onCommentRemoved(event.comment.id);
    }

    // Handle other comment-related events if needed
  }
}

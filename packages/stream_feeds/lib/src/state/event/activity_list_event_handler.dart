import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../activity_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for activity list real-time updates.
///
/// Processes WebSocket events related to activities and their associated content
/// (reactions, comments, bookmarks) and updates the activity list state accordingly.
class ActivityListEventHandler implements StateEventHandler {
  const ActivityListEventHandler({
    required this.state,
  });

  final ActivityListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.ActivityDeletedEvent) {
      return state.onActivityRemoved(event.activity.toModel());
    }

    if (event is api.ActivityReactionAddedEvent) {
      return state.onReactionAdded(event.reaction.toModel());
    }

    if (event is api.ActivityReactionDeletedEvent) {
      return state.onReactionRemoved(event.reaction.toModel());
    }

    if (event is api.BookmarkAddedEvent) {
      return state.onBookmarkAdded(event.bookmark.toModel());
    }

    if (event is api.BookmarkDeletedEvent) {
      return state.onBookmarkRemoved(event.bookmark.toModel());
    }

    if (event is api.CommentAddedEvent) {
      return state.onCommentAdded(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      return state.onCommentRemoved(event.comment.toModel());
    }

    // Handle other activity list events here as needed
  }
}

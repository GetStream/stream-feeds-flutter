import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/comment_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../../repository/capabilities_repository.dart';
import '../activity_list_state.dart';
import 'feed_capabilities_mixin.dart';
import 'state_event_handler.dart';

/// Event handler for activity list real-time updates.
///
/// Processes WebSocket events related to activities and their associated content
/// (reactions, comments, bookmarks) and updates the activity list state accordingly.
class ActivityListEventHandler
    with FeedCapabilitiesMixin
    implements StateEventHandler {
  const ActivityListEventHandler({
    required this.state,
    required this.capabilitiesRepository,
  });

  final ActivityListStateNotifier state;
  @override
  final CapabilitiesRepository capabilitiesRepository;

  @override
  Future<void> handleEvent(WsEvent event) async {
    if (event is api.ActivityUpdatedEvent) {
      final activity = event.activity.toModel();
      state.onActivityUpdated(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) {
        state.onActivityUpdated(updatedActivity);
      }
      return;
    }

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

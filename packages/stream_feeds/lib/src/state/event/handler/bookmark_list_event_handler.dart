import '../../../utils/filter.dart';
import '../../bookmark_list_state.dart';
import '../../query/bookmarks_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

/// Event handler for bookmark list real-time updates.
///
/// Processes WebSocket events related to bookmarks
/// and updates the bookmark list state accordingly.
class BookmarkListEventHandler implements StateEventHandler {
  const BookmarkListEventHandler({
    required this.query,
    required this.state,
  });

  final BookmarksQuery query;
  final BookmarkListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is BookmarkFolderDeleted) {
      return state.onBookmarkFolderRemoved(event.folderId);
    }

    if (event is BookmarkFolderUpdated) {
      return state.onBookmarkFolderUpdated(event.folder);
    }

    if (event is BookmarkAdded) {
      // Check if the new bookmark matches the query filter
      if (!event.bookmark.matches(query.filter)) return;

      return state.onBookmarkAdded(event.bookmark);
    }

    if (event is BookmarkUpdated) {
      if (!event.bookmark.matches(query.filter)) {
        // If the updated bookmark no longer matches the filter, remove it
        return state.onBookmarkRemoved(event.bookmark.id);
      }

      return state.onBookmarkUpdated(event.bookmark);
    }

    if (event is BookmarkDeleted) {
      return state.onBookmarkRemoved(event.bookmark.id);
    }

    // Handle other bookmark list events if needed
  }
}

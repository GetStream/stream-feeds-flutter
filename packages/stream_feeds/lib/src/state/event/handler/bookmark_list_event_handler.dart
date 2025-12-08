import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/bookmark_data.dart';
import '../../../models/bookmark_folder_data.dart';
import '../../bookmark_list_state.dart';
import '../../query/bookmarks_query.dart';
import 'state_event_handler.dart';

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
  void handleEvent(WsEvent event) {
    bool matchesQueryFilter(BookmarkData bookmark) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(bookmark);
    }

    if (event is api.BookmarkFolderDeletedEvent) {
      return state.onBookmarkFolderRemoved(event.bookmarkFolder.id);
    }

    if (event is api.BookmarkFolderUpdatedEvent) {
      return state.onBookmarkFolderUpdated(event.bookmarkFolder.toModel());
    }

    if (event is api.BookmarkUpdatedEvent) {
      final bookmark = event.bookmark.toModel();
      if (!matchesQueryFilter(bookmark)) {
        // If the updated bookmark no longer matches the filter, remove it
        return state.onBookmarkRemoved(bookmark.id);
      }

      return state.onBookmarkUpdated(bookmark);
    }

    // Handle other bookmark list events if needed
  }
}

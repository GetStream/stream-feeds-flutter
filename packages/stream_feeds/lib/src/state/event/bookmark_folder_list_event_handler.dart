import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/bookmark_folder_data.dart';
import '../bookmark_folder_list_state.dart';
import '../query/bookmark_folders_query.dart';
import 'state_event_handler.dart';

/// Event handler for bookmark folder list real-time updates.
///
/// Processes WebSocket events related to bookmark folders
/// and updates the bookmark folder list state accordingly.
class BookmarkFolderListEventHandler implements StateEventHandler {
  const BookmarkFolderListEventHandler({
    required this.query,
    required this.state,
  });

  final BookmarkFoldersQuery query;
  final BookmarkFolderListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    bool matchesQueryFilter(BookmarkFolderData bookmarkFolder) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(bookmarkFolder);
    }

    if (event is api.BookmarkFolderDeletedEvent) {
      return state.onBookmarkFolderRemoved(event.bookmarkFolder.id);
    }

    if (event is api.BookmarkFolderUpdatedEvent) {
      final bookmarkFolder = event.bookmarkFolder.toModel();
      if (!matchesQueryFilter(bookmarkFolder)) {
        // If the updated bookmark folder no longer matches the filter, remove it
        return state.onBookmarkFolderRemoved(bookmarkFolder.id);
      }

      return state.onBookmarkFolderUpdated(bookmarkFolder);
    }

    // Handle other bookmark folder list events if needed
  }
}

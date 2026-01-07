import '../../../utils/filter.dart';
import '../../bookmark_folder_list_state.dart';
import '../../query/bookmark_folders_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

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
  void handleEvent(StateUpdateEvent event) {
    if (event is BookmarkFolderUpdated) {
      if (!event.folder.matches(query.filter)) {
        // If the updated bookmark folder no longer matches the filter, remove it
        return state.onBookmarkFolderRemoved(event.folder.id);
      }

      return state.onBookmarkFolderUpdated(event.folder);
    }

    if (event is BookmarkFolderDeleted) {
      return state.onBookmarkFolderRemoved(event.folderId);
    }

    // Handle other bookmark folder list events if needed
  }
}

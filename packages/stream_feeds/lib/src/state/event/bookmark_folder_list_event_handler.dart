import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/bookmark_folder_data.dart';
import '../bookmark_folder_list_state.dart';
import 'state_event_handler.dart';

/// Event handler for bookmark folder list real-time updates.
///
/// Processes WebSocket events related to bookmark folders
/// and updates the bookmark folder list state accordingly.
class BookmarkFolderListEventHandler implements StateEventHandler {
  const BookmarkFolderListEventHandler({
    required this.state,
  });

  final BookmarkFolderListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.BookmarkFolderDeletedEvent) {
      return state.onBookmarkFolderRemoved(event.bookmarkFolder.id);
    }

    if (event is api.BookmarkFolderUpdatedEvent) {
      return state.onBookmarkFolderUpdated(event.bookmarkFolder.toModel());
    }

    // Handle other bookmark folder list events if needed
  }
}

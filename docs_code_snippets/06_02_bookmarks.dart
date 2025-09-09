// ignore_for_file: file_names, unused_local_variable, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> addingBookmarks() async {
// Adding a bookmark to a new folder
  final bookmark = await feed.addBookmark(activityId: 'activity_123');
// Adding to an existing folder
  final bookmarkWithFolder = await feed.addBookmark(
    activityId: 'activity_123',
    request: const AddBookmarkRequest(folderId: 'folder_456'),
  );
// Update a bookmark (without a folder initially) - add custom data and move it to a new folder
  final updatedBookmark = await feed.updateBookmark(
    activityId: 'activity_123',
    request: const UpdateBookmarkRequest(
      custom: {'color': 'blue'},
      newFolder: AddFolderRequest(
        custom: {'icon': '📁'},
        name: 'New folder name',
      ),
    ),
  );
// Update a bookmark - move it from one existing folder to another existing folder
  final movedBookmark = await feed.updateBookmark(
    activityId: 'activity_123',
    request: const UpdateBookmarkRequest(
      folderId: 'folder_456',
      newFolderId: 'folder_789',
    ),
  );
}

Future<void> removingBookmarks() async {
  // Removing a bookmark
  await feed.deleteBookmark(activityId: 'activity_123', folderId: 'folder_456');
  // When you read a feed we include the bookmark
  final feedData = await feed.getOrCreate();
  print(feed.state.activities[0].ownBookmarks);
}

Future<void> queryingBookmarks() async {
  // Query bookmarks
  const query = BookmarksQuery(limit: 5);
  final bookmarkList = client.bookmarkList(query);
  final page1 = await bookmarkList.get();
  // Get next page
  final page2 = await bookmarkList.queryMoreBookmarks(limit: 3);
  // Query by activity ID
  final activityBookmarkList = client.bookmarkList(
    const BookmarksQuery(
      filter: Filter.equal(BookmarksFilterField.activityId, 'activity_123'),
    ),
  );
  final activityBookmarks = await activityBookmarkList.get();
  // Query by folder ID
  final folderBookmarkList = client.bookmarkList(
    const BookmarksQuery(
      filter: Filter.equal(BookmarksFilterField.folderId, 'folder_456'),
    ),
  );
  final folderBookmarks = await folderBookmarkList.get();
}

Future<void> queryingBookmarkFolders() async {
  // Query bookmark folders
  const query = BookmarkFoldersQuery(limit: 5);
  final bookmarkFolderList = client.bookmarkFolderList(query);
  final page1 = await bookmarkFolderList.get();
  // Get next page
  final page2 = await bookmarkFolderList.queryMoreBookmarkFolders(limit: 3);
  // Query by folder name (partial matching)
  final projectFolderList = client.bookmarkFolderList(
    const BookmarkFoldersQuery(
      filter: Filter.contains(BookmarkFoldersFilterField.name, 'project'),
    ),
  );
  final projectFolders = await projectFolderList.get();
}

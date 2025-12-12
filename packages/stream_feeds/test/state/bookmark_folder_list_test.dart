import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('BookmarkFolderListEventHandler - Local filtering', () {
    final initialFolders = [
      createDefaultBookmarkFolderResponse(id: 'folder-1'),
      createDefaultBookmarkFolderResponse(id: 'folder-2'),
      createDefaultBookmarkFolderResponse(id: 'folder-3'),
    ];

    bookmarkFolderListTest(
      'BookmarkFolderUpdatedEvent - should remove folder when updated to non-matching name',
      build: (client) => client.bookmarkFolderList(
        BookmarkFoldersQuery(
          filter: Filter.equal(
            BookmarkFoldersFilterField.folderName,
            'My Folder',
          ),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(bookmarkFolders: initialFolders),
      ),
      body: (tester) async {
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(3));

        // Send event with folder that has different name (doesn't match filter)
        await tester.emitEvent(
          BookmarkFolderUpdatedEvent(
            type: EventTypes.bookmarkFolderUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(
              id: 'folder-1',
              // Doesn't match folder name
            ).copyWith(name: 'Different Folder'),
          ),
        );

        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(2));
      },
    );

    bookmarkFolderListTest(
      'No filter - should not remove folder when no filter specified',
      build: (client) => client.bookmarkFolderList(
        // No filter - all folders should be accepted
        const BookmarkFoldersQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(bookmarkFolders: initialFolders),
      ),
      body: (tester) async {
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(3));

        await tester.emitEvent(
          BookmarkFolderUpdatedEvent(
            type: EventTypes.bookmarkFolderUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(
              id: 'folder-1',
            ).copyWith(name: 'Different Folder'),
          ),
        );

        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(3));
      },
    );
  });
}

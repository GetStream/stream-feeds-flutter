import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const folderId = 'folder-1';
  const query = BookmarkFoldersQuery();

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Bookmark Folder List - Query Operations', () {
    bookmarkFolderListTest(
      'get - should query initial bookmark folders via API',
      build: (client) => client.bookmarkFolderList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<BookmarkFolderData>>>());
        final folders = result.getOrThrow();

        expect(folders, isA<List<BookmarkFolderData>>());
        expect(folders, hasLength(3));
        expect(folders[0].id, 'folder-1');
        expect(folders[1].id, 'folder-2');
        expect(folders[2].id, 'folder-3');
      },
    );

    bookmarkFolderListTest(
      'queryMoreBookmarkFolders - should load more folders via API',
      build: (client) => client.bookmarkFolderList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          bookmarkFolders: [
            createDefaultBookmarkFolderResponse(id: folderId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has folder
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(tester.bookmarkFolderListState.canLoadMore, isTrue);

        final nextPageQuery = tester.bookmarkFolderList.query.copyWith(
          next: tester.bookmarkFolderListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryBookmarkFolders(
            queryBookmarkFoldersRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryBookmarkFoldersResponse(
            bookmarkFolders: [
              createDefaultBookmarkFolderResponse(id: 'folder-2'),
            ],
          ),
        );

        // Query more folders
        final result =
            await tester.bookmarkFolderList.queryMoreBookmarkFolders();

        expect(result.isSuccess, isTrue);
        final folders = result.getOrNull();
        expect(folders, isNotNull);
        expect(folders, hasLength(1));

        // Verify state was updated with merged folders
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(2));
        expect(tester.bookmarkFolderListState.canLoadMore, isFalse);
      },
      verify: (tester) {
        final nextPageQuery = tester.bookmarkFolderList.query.copyWith(
          next: tester.bookmarkFolderListState.pagination?.next,
        );

        tester.verifyApi(
          (api) => api.queryBookmarkFolders(
            queryBookmarkFoldersRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    bookmarkFolderListTest(
      'queryMoreBookmarkFolders - should return empty list when no more folders',
      build: (client) => client.bookmarkFolderList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarkFolders: [
            createDefaultBookmarkFolderResponse(id: folderId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has folder but no pagination
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(tester.bookmarkFolderListState.canLoadMore, isFalse);
        // Query more folders (should return empty immediately)
        final result =
            await tester.bookmarkFolderList.queryMoreBookmarkFolders();

        expect(result.isSuccess, isTrue);
        final folders = result.getOrNull();
        expect(folders, isEmpty);

        // Verify state was not updated (no new folders, pagination remains null)
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(tester.bookmarkFolderListState.canLoadMore, isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling
  // ============================================================

  group('Bookmark Folder List - Event Handling', () {
    bookmarkFolderListTest(
      'should handle BookmarkFolderUpdatedEvent and update folder',
      build: (client) => client.bookmarkFolderList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarkFolders: [
            createDefaultBookmarkFolderResponse(id: folderId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has folder
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(
          tester.bookmarkFolderListState.bookmarkFolders.first.name,
          'My Folder',
        );

        // Emit event
        await tester.emitEvent(
          BookmarkFolderUpdatedEvent(
            type: EventTypes.bookmarkFolderUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(
              id: folderId,
            ).copyWith(name: 'Updated Folder'),
          ),
        );

        // Verify state has updated folder
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(
          tester.bookmarkFolderListState.bookmarkFolders.first.name,
          'Updated Folder',
        );
      },
    );

    bookmarkFolderListTest(
      'should handle BookmarkFolderDeletedEvent and remove folder',
      build: (client) => client.bookmarkFolderList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarkFolders: [
            createDefaultBookmarkFolderResponse(id: folderId),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has folder
        expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(1));
        expect(
          tester.bookmarkFolderListState.bookmarkFolders.first.id,
          folderId,
        );

        // Emit event
        await tester.emitEvent(
          BookmarkFolderDeletedEvent(
            type: EventTypes.bookmarkFolderDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(id: folderId),
          ),
        );

        // Verify state has no folders
        expect(tester.bookmarkFolderListState.bookmarkFolders, isEmpty);
      },
    );
  });

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

import 'package:stream_feeds/stream_feeds.dart';

import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  const folderId = 'folder-1';
  const activityId = 'activity-1';
  const query = BookmarksQuery();

  // ============================================================
  // FEATURE: Query Operations
  // ============================================================

  group('Bookmark List - Query Operations', () {
    bookmarkListTest(
      'get - should query initial bookmarks via API',
      build: (client) => client.bookmarkList(query),
      body: (tester) async {
        final result = await tester.get();

        expect(result, isA<Result<List<BookmarkData>>>());
        final bookmarks = result.getOrThrow();

        expect(bookmarks, isA<List<BookmarkData>>());
        expect(bookmarks, hasLength(3));
        expect(bookmarks[0].activity.id, 'activity-1');
        expect(bookmarks[1].activity.id, 'activity-2');
        expect(bookmarks[2].activity.id, 'activity-3');
      },
    );

    bookmarkListTest(
      'queryMoreBookmarks - should load more bookmarks via API',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          next: 'next-cursor',
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(tester.bookmarkListState.canLoadMore, isTrue);

        final nextPageQuery = tester.bookmarkList.query.copyWith(
          next: tester.bookmarkListState.pagination?.next,
        );

        tester.mockApi(
          (api) => api.queryBookmarks(
            queryBookmarksRequest: nextPageQuery.toRequest(),
          ),
          result: createDefaultQueryBookmarksResponse(
            bookmarks: [
              createDefaultBookmarkResponse(
                folderId: folderId,
                activityId: 'activity-2',
              ),
            ],
          ),
        );

        // Query more bookmarks
        final result = await tester.bookmarkList.queryMoreBookmarks();

        expect(result.isSuccess, isTrue);
        final bookmarks = result.getOrNull();
        expect(bookmarks, isNotNull);
        expect(bookmarks, hasLength(1));

        // Verify state was updated with merged bookmarks
        expect(tester.bookmarkListState.bookmarks, hasLength(2));
        expect(tester.bookmarkListState.canLoadMore, isFalse);

        tester.verifyApi(
          (api) => api.queryBookmarks(
            queryBookmarksRequest: nextPageQuery.toRequest(),
          ),
        );
      },
    );

    bookmarkListTest(
      'queryMoreBookmarks - should return empty list when no more bookmarks',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark but no pagination
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(tester.bookmarkListState.canLoadMore, isFalse);
        // Query more bookmarks (should return empty immediately)
        final result = await tester.bookmarkList.queryMoreBookmarks();

        expect(result.isSuccess, isTrue);
        final bookmarks = result.getOrNull();
        expect(bookmarks, isEmpty);

        // Verify state was not updated (no new bookmarks, pagination remains null)
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(tester.bookmarkListState.canLoadMore, isFalse);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling - Bookmark Events
  // ============================================================

  group('Bookmark List - Bookmark Events', () {
    bookmarkListTest(
      'should handle BookmarkAddedEvent and add bookmark',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(bookmarks: const []),
      ),
      body: (tester) async {
        // Initial state - no bookmarks
        expect(tester.bookmarkListState.bookmarks, isEmpty);

        // Emit event
        await tester.emitEvent(
          BookmarkAddedEvent(
            type: EventTypes.bookmarkAdded,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ),
        );

        // Verify state has bookmark
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(
          tester.bookmarkListState.bookmarks.first.activity.id,
          activityId,
        );
      },
    );

    bookmarkListTest(
      'should handle BookmarkUpdatedEvent and update bookmark',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(tester.bookmarkListState.bookmarks.first.folder!.id, folderId);

        // Emit event with updated folder
        await tester.emitEvent(
          BookmarkUpdatedEvent(
            type: EventTypes.bookmarkUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              folderId: 'folder-2',
              activityId: activityId,
            ),
          ),
        );

        // Verify state has updated bookmark
        expect(tester.bookmarkListState.bookmarks, hasLength(1));
        expect(tester.bookmarkListState.bookmarks.first.folder!.id, 'folder-2');
      },
    );

    bookmarkListTest(
      'should handle BookmarkDeletedEvent and remove bookmark',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmark
        expect(tester.bookmarkListState.bookmarks, hasLength(1));

        // Emit event
        await tester.emitEvent(
          BookmarkDeletedEvent(
            type: EventTypes.bookmarkDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: activityId,
            ),
          ),
        );

        // Verify state has no bookmarks
        expect(tester.bookmarkListState.bookmarks, isEmpty);
      },
    );
  });

  // ============================================================
  // FEATURE: Event Handling - Bookmark Folder Events
  // ============================================================

  group('Bookmark List - Bookmark Folder Events', () {
    bookmarkListTest(
      'should handle BookmarkFolderUpdatedEvent and update folder in bookmarks',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: 'activity-1',
            ),
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: 'activity-2',
            ),
            createDefaultBookmarkResponse(
              folderId: 'folder-2',
              activityId: 'activity-3',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmarks with folders
        expect(tester.bookmarkListState.bookmarks, hasLength(3));
        expect(tester.bookmarkListState.bookmarks[0].folder!.name, 'My Folder');
        expect(tester.bookmarkListState.bookmarks[1].folder!.name, 'My Folder');

        // Emit event
        await tester.emitEvent(
          BookmarkFolderUpdatedEvent(
            type: EventTypes.bookmarkFolderUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(
              id: folderId,
              name: 'Updated Folder',
            ),
          ),
        );

        // Verify bookmarks with matching folder ID were updated
        expect(tester.bookmarkListState.bookmarks, hasLength(3));
        expect(
          tester.bookmarkListState.bookmarks[0].folder!.name,
          'Updated Folder',
        );
        expect(
          tester.bookmarkListState.bookmarks[1].folder!.name,
          'Updated Folder',
        );
        // Bookmark with different folder should not be affected
        expect(tester.bookmarkListState.bookmarks[2].folder!.name, 'My Folder');
      },
    );

    bookmarkListTest(
      'should handle BookmarkFolderDeletedEvent and remove folder from bookmarks',
      build: (client) => client.bookmarkList(query),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(
          bookmarks: [
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: 'activity-1',
            ),
            createDefaultBookmarkResponse(
              folderId: folderId,
              activityId: 'activity-2',
            ),
            createDefaultBookmarkResponse(
              folderId: 'folder-2',
              activityId: 'activity-3',
            ),
          ],
        ),
      ),
      body: (tester) async {
        // Initial state - has bookmarks with folders
        expect(tester.bookmarkListState.bookmarks, hasLength(3));
        expect(tester.bookmarkListState.bookmarks[0].folder, isNotNull);
        expect(tester.bookmarkListState.bookmarks[1].folder, isNotNull);
        expect(tester.bookmarkListState.bookmarks[2].folder, isNotNull);

        // Emit event
        await tester.emitEvent(
          BookmarkFolderDeletedEvent(
            type: EventTypes.bookmarkFolderDeleted,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmarkFolder: createDefaultBookmarkFolderResponse(id: folderId),
          ),
        );

        // Verify bookmarks with matching folder ID have folder removed
        expect(tester.bookmarkListState.bookmarks, hasLength(3));
        expect(tester.bookmarkListState.bookmarks[0].folder, isNull);
        expect(tester.bookmarkListState.bookmarks[1].folder, isNull);
        // Bookmark with different folder should still have folder
        expect(tester.bookmarkListState.bookmarks[2].folder, isNotNull);
      },
    );
  });

  // ============================================================
  // FEATURE: Local Filtering
  // ============================================================

  group('BookmarkListEventHandler - Local filtering', () {
    final initialBookmarks = [
      createDefaultBookmarkResponse(
        folderId: 'folder-1',
        activityId: 'activity-1',
      ),
      createDefaultBookmarkResponse(
        folderId: 'folder-1',
        activityId: 'activity-2',
      ),
      createDefaultBookmarkResponse(
        folderId: 'folder-1',
        activityId: 'activity-3',
      ),
    ];

    bookmarkListTest(
      'BookmarkUpdatedEvent - should remove bookmark when updated to non-matching user',
      build: (client) => client.bookmarkList(
        BookmarksQuery(
          filter: Filter.equal(BookmarksFilterField.folderId, 'folder-1'),
        ),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(bookmarks: initialBookmarks),
      ),
      body: (tester) async {
        expect(tester.bookmarkListState.bookmarks, hasLength(3));

        await tester.emitEvent(
          BookmarkUpdatedEvent(
            type: EventTypes.bookmarkUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              folderId: 'folder-2',
              activityId: 'activity-1',
            ),
          ),
        );

        expect(tester.bookmarkListState.bookmarks, hasLength(2));
      },
    );

    bookmarkListTest(
      'No filter - should not remove bookmark when no filter specified',
      build: (client) => client.bookmarkList(
        // No filter, all bookmarks should be accepted
        const BookmarksQuery(),
      ),
      setUp: (tester) => tester.get(
        modifyResponse: (it) => it.copyWith(bookmarks: initialBookmarks),
      ),
      body: (tester) async {
        expect(tester.bookmarkListState.bookmarks, hasLength(3));

        await tester.emitEvent(
          BookmarkUpdatedEvent(
            type: EventTypes.bookmarkUpdated,
            createdAt: DateTime.timestamp(),
            custom: const {},
            bookmark: createDefaultBookmarkResponse(
              folderId: 'folder-2',
              activityId: 'activity-1',
            ),
          ),
        );

        expect(tester.bookmarkListState.bookmarks, hasLength(3));
      },
    );
  });
}

import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
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

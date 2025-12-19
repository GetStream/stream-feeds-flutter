import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for bookmark list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'bookmark-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [BookmarkList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [BookmarkListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['bookmark-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// bookmarkListTest(
///   'removes bookmark when updated to non-matching folder',
///   build: (client) => client.bookmarkList(BookmarksQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.bookmarkListState.bookmarks, hasLength(3));
///
///     await tester.emitEvent(BookmarkUpdatedEvent(...));
///
///     expect(tester.bookmarkListState.bookmarks, hasLength(2));
///   },
/// );
/// ```
@isTest
void bookmarkListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required BookmarkList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(BookmarkListTester tester)? setUp,
  required FutureOr<void> Function(BookmarkListTester tester) body,
  FutureOr<void> Function(BookmarkListTester tester)? verify,
  FutureOr<void> Function(BookmarkListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['bookmark-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createBookmarkListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for bookmark list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying bookmark list state.
///
/// Resources are automatically cleaned up after the test completes.
final class BookmarkListTester extends BaseTester<BookmarkList> {
  const BookmarkListTester._({
    required BookmarkList bookmarkList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: bookmarkList);

  /// The bookmark list being tested.
  BookmarkList get bookmarkList => subject;

  /// Current state of the bookmark list.
  BookmarkListState get bookmarkListState => bookmarkList.state;

  /// Stream of bookmark list state updates.
  Stream<BookmarkListState> get bookmarkListStateStream => bookmarkList.stream;

  /// Gets the bookmark list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the bookmark list response
  Future<Result<List<BookmarkData>>> get({
    QueryBookmarksResponse Function(QueryBookmarksResponse)? modifyResponse,
  }) {
    final query = bookmarkList.query;

    final defaultBookmarkListResponse = QueryBookmarksResponse(
      duration: DateTime.now().toIso8601String(),
      bookmarks: [
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
      ],
    );

    mockApi(
      (api) => api.queryBookmarks(
        queryBookmarksRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultBookmarkListResponse),
        _ => defaultBookmarkListResponse,
      },
    );

    return bookmarkList.get();
  }
}

// Creates a BookmarkListTester for testing bookmark list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by bookmarkListTest only.
Future<BookmarkListTester> _createBookmarkListTester({
  required BookmarkList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose bookmark list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => BookmarkListTester._(
      bookmarkList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

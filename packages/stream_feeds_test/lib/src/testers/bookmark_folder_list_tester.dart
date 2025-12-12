import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for bookmark folder list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'bookmark-folder-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [BookmarkFolderList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [BookmarkFolderListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['bookmark-folder-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// bookmarkFolderListTest(
///   'removes folder when updated to non-matching name',
///   build: (client) => client.bookmarkFolderList(BookmarkFoldersQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(3));
///
///     await tester.emitEvent(BookmarkFolderUpdatedEvent(...));
///
///     expect(tester.bookmarkFolderListState.bookmarkFolders, hasLength(2));
///   },
/// );
/// ```
@isTest
void bookmarkFolderListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required BookmarkFolderList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(BookmarkFolderListTester tester)? setUp,
  required FutureOr<void> Function(BookmarkFolderListTester tester) body,
  FutureOr<void> Function(BookmarkFolderListTester tester)? verify,
  FutureOr<void> Function(BookmarkFolderListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['bookmark-folder-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createBookmarkFolderListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for bookmark folder list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying bookmark folder list state.
///
/// Resources are automatically cleaned up after the test completes.
final class BookmarkFolderListTester extends BaseTester<BookmarkFolderList> {
  const BookmarkFolderListTester._({
    required BookmarkFolderList bookmarkFolderList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: bookmarkFolderList);

  /// The bookmark folder list being tested.
  BookmarkFolderList get bookmarkFolderList => subject;

  /// Current state of the bookmark folder list.
  BookmarkFolderListState get bookmarkFolderListState {
    return bookmarkFolderList.state;
  }

  /// Stream of bookmark folder list state updates.
  Stream<BookmarkFolderListState> get bookmarkFolderListStateStream {
    return bookmarkFolderList.stream;
  }

  /// Gets the bookmark folder list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the bookmark folder list response
  Future<Result<List<BookmarkFolderData>>> get({
    QueryBookmarkFoldersResponse Function(
      QueryBookmarkFoldersResponse,
    )? modifyResponse,
  }) {
    final query = bookmarkFolderList.query;

    final defaultBookmarkFolderListResponse = QueryBookmarkFoldersResponse(
      duration: DateTime.now().toIso8601String(),
      bookmarkFolders: [
        createDefaultBookmarkFolderResponse(id: 'folder-1'),
        createDefaultBookmarkFolderResponse(id: 'folder-2'),
        createDefaultBookmarkFolderResponse(id: 'folder-3'),
      ],
    );

    mockApi(
      (api) => api.queryBookmarkFolders(
        queryBookmarkFoldersRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultBookmarkFolderListResponse),
        _ => defaultBookmarkFolderListResponse,
      },
    );

    return bookmarkFolderList.get();
  }
}

// Creates a BookmarkFolderListTester for testing bookmark folder list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by bookmarkFolderListTest only.
Future<BookmarkFolderListTester> _createBookmarkFolderListTester({
  required BookmarkFolderList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose bookmark folder list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => BookmarkFolderListTester._(
      bookmarkFolderList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

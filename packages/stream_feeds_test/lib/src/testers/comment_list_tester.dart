import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for comment list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'comment-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [CommentList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [CommentListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['comment-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// commentListTest(
///   'removes comment when updated to non-matching status',
///   build: (client) => client.commentList(CommentsQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.commentListState.comments, hasLength(3));
///
///     await tester.emitEvent(CommentUpdatedEvent(...));
///
///     expect(tester.commentListState.comments, hasLength(2));
///   },
/// );
/// ```
@isTest
void commentListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required CommentList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(CommentListTester tester)? setUp,
  required FutureOr<void> Function(CommentListTester tester) body,
  FutureOr<void> Function(CommentListTester tester)? verify,
  FutureOr<void> Function(CommentListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['comment-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createCommentListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for comment list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying comment list state.
///
/// Resources are automatically cleaned up after the test completes.
final class CommentListTester extends BaseTester<CommentList> {
  const CommentListTester._({
    required CommentList commentList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: commentList);

  /// The comment list being tested.
  CommentList get commentList => subject;

  /// Current state of the comment list.
  CommentListState get commentListState => commentList.state;

  /// Stream of comment list state updates.
  Stream<CommentListState> get commentListStateStream => commentList.stream;

  /// Gets the comment list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the comment list response
  Future<Result<List<CommentData>>> get({
    QueryCommentsResponse Function(QueryCommentsResponse)? modifyResponse,
  }) {
    final query = commentList.query;

    final defaultCommentListResponse = QueryCommentsResponse(
      duration: DateTime.now().toIso8601String(),
      comments: [
        createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
        createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
        createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
      ],
    );

    mockApi(
      (api) => api.queryComments(
        queryCommentsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultCommentListResponse),
        _ => defaultCommentListResponse,
      },
    );

    return commentList.get();
  }
}

// Creates a CommentListTester for testing comment list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by commentListTest only.
Future<CommentListTester> _createCommentListTester({
  required CommentList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose comment list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => CommentListTester._(
      commentList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

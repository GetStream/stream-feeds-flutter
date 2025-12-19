import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for comment reaction list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'comment-reaction-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [CommentReactionList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [CommentReactionListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['comment-reaction-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// commentReactionListTest(
///   'queries initial reactions',
///   build: (client) => client.commentReactionList(
///     CommentReactionsQuery(
///       commentId: 'comment-1',
///     ),
///   ),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.commentReactionListState.reactions, hasLength(3));
///   },
/// );
/// ```
@isTest
void commentReactionListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required CommentReactionList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(CommentReactionListTester tester)? setUp,
  required FutureOr<void> Function(CommentReactionListTester tester) body,
  FutureOr<void> Function(CommentReactionListTester tester)? verify,
  FutureOr<void> Function(CommentReactionListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['comment-reaction-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createCommentReactionListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for comment reaction list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying comment reaction list state.
///
/// Resources are automatically cleaned up after the test completes.
final class CommentReactionListTester extends BaseTester<CommentReactionList> {
  const CommentReactionListTester._({
    required CommentReactionList commentReactionList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: commentReactionList);

  /// The comment reaction list being tested.
  CommentReactionList get commentReactionList => subject;

  /// Current state of the comment reaction list.
  CommentReactionListState get commentReactionListState {
    return commentReactionList.state;
  }

  /// Stream of comment reaction list state updates.
  Stream<CommentReactionListState> get commentReactionListStateStream {
    return commentReactionList.stream;
  }

  /// Gets the comment reaction list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the comment reaction list response
  Future<Result<List<FeedsReactionData>>> get({
    QueryCommentReactionsResponse Function(
      QueryCommentReactionsResponse,
    )? modifyResponse,
  }) {
    final query = commentReactionList.query;

    final defaultReactionListResponse =
        createDefaultQueryCommentReactionsResponse(
      reactions: [
        createDefaultReactionResponse(commentId: query.commentId),
        createDefaultReactionResponse(
          commentId: query.commentId,
          userId: 'user-2',
        ),
        createDefaultReactionResponse(
          commentId: query.commentId,
          userId: 'user-3',
        ),
      ],
    );

    mockApi(
      (api) => api.queryCommentReactions(
        id: query.commentId,
        queryCommentReactionsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultReactionListResponse),
        _ => defaultReactionListResponse,
      },
    );

    return commentReactionList.get();
  }
}

// Creates a CommentReactionListTester for testing comment reaction list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by commentReactionListTest only.
Future<CommentReactionListTester> _createCommentReactionListTester({
  required StreamFeedsClient client,
  required CommentReactionList subject,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose comment list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => CommentReactionListTester._(
      commentReactionList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

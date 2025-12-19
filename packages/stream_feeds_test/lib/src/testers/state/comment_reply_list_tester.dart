import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for comment reply list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'comment-reply-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [CommentReplyList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [CommentReplyListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['comment-reply-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// commentReplyListTest(
///   'should query initial replies via API',
///   build: (client) => client.commentReplyList(
///     CommentRepliesQuery(
///       commentId: 'comment-1',
///     ),
///   ),
///   body: (tester) async {
///     final result = await tester.commentReplyList.get();
///
///     expect(result.isSuccess, isTrue);
///     expect(tester.commentReplyListState.replies, isEmpty);
///   },
/// );
/// ```
@isTest
void commentReplyListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required CommentReplyList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(CommentReplyListTester tester)? setUp,
  required FutureOr<void> Function(CommentReplyListTester tester) body,
  FutureOr<void> Function(CommentReplyListTester tester)? verify,
  FutureOr<void> Function(CommentReplyListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['comment-reply-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createCommentReplyListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for comment reply list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying comment reply list state.
///
/// Resources are automatically cleaned up after the test completes.
final class CommentReplyListTester extends BaseTester<CommentReplyList> {
  const CommentReplyListTester._({
    required CommentReplyList commentReplyList,
    required super.wsStreamController,
    required super.feedsApi,
    required super.cdnApi,
  }) : super(subject: commentReplyList);

  /// The comment reply list being tested.
  CommentReplyList get commentReplyList => subject;

  /// Current state of the comment reply list.
  CommentReplyListState get commentReplyListState {
    return commentReplyList.state;
  }

  /// Stream of comment reply list state updates.
  Stream<CommentReplyListState> get commentReplyListStateStream {
    return commentReplyList.stream;
  }

  /// Gets the comment reply list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the comment replies response
  Future<Result<List<CommentData>>> get({
    GetCommentRepliesResponse Function(
      GetCommentRepliesResponse,
    )? modifyResponse,
  }) {
    final query = commentReplyList.query;

    final defaultRepliesResponse = createDefaultCommentRepliesResponse(
      comments: [
        createDefaultThreadedCommentResponse(
          id: 'reply-1',
          objectId: query.commentId,
          objectType: 'comment',
          text: 'First reply',
          userId: 'user-1',
        ),
        createDefaultThreadedCommentResponse(
          id: 'reply-2',
          objectId: query.commentId,
          objectType: 'comment',
          text: 'Second reply',
          userId: 'user-2',
        ),
        createDefaultThreadedCommentResponse(
          id: 'reply-3',
          objectId: query.commentId,
          objectType: 'comment',
          text: 'Third reply',
          userId: 'user-3',
        ),
      ],
    );

    mockApi(
      (api) => api.getCommentReplies(
        id: query.commentId,
        depth: query.depth,
        limit: query.limit,
        next: query.next,
        prev: query.previous,
        repliesLimit: query.repliesLimit,
        sort: query.sort,
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultRepliesResponse),
        _ => defaultRepliesResponse,
      },
    );

    return commentReplyList.get();
  }
}

// Creates a CommentReplyListTester for testing comment reply list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by commentReplyListTest only.
Future<CommentReplyListTester> _createCommentReplyListTester({
  required CommentReplyList subject,
  required StreamFeedsClient client,
  required MockCdnApi cdnApi,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose comment reply list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => CommentReplyListTester._(
      commentReplyList: subject,
      wsStreamController: wsStreamController,
      cdnApi: cdnApi,
      feedsApi: feedsApi,
    ),
  );
}

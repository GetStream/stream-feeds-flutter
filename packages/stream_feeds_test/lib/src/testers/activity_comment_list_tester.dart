import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for activity comment list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'activity-comment-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [ActivityCommentList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives an [ActivityCommentListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['activity-comment-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// activityCommentListTest(
///   'queries initial comments',
///   build: (client) => client.activityCommentList(
///     ActivityCommentsQuery(
///       objectId: 'activity-1',
///       objectType: 'activity',
///     ),
///   ),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.activityCommentListState.comments, hasLength(3));
///   },
/// );
/// ```
@isTest
void activityCommentListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required ActivityCommentList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(ActivityCommentListTester tester)? setUp,
  required FutureOr<void> Function(ActivityCommentListTester tester) body,
  FutureOr<void> Function(ActivityCommentListTester tester)? verify,
  FutureOr<void> Function(ActivityCommentListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['activity-comment-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createActivityCommentListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for activity comment list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying activity comment list state.
///
/// Resources are automatically cleaned up after the test completes.
final class ActivityCommentListTester extends BaseTester<ActivityCommentList> {
  const ActivityCommentListTester._({
    required ActivityCommentList activityCommentList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: activityCommentList);

  /// The activity comment list being tested.
  ActivityCommentList get activityCommentList => subject;

  /// Current state of the activity comment list.
  ActivityCommentListState get activityCommentListState {
    return activityCommentList.notifier.state;
  }

  /// Stream of activity comment list state updates.
  Stream<ActivityCommentListState> get activityCommentListStateStream {
    return activityCommentList.stream;
  }

  /// Gets the activity comment list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the comments response
  Future<Result<List<CommentData>>> get({
    GetCommentsResponse Function(GetCommentsResponse)? modifyResponse,
  }) {
    final query = activityCommentList.query;

    final defaultCommentsResponse = createDefaultCommentsResponse(
      comments: [
        createDefaultThreadedCommentResponse(
          id: 'comment-1',
          objectId: query.objectId,
          objectType: query.objectType,
          text: 'First comment',
          userId: 'user-1',
        ),
        createDefaultThreadedCommentResponse(
          id: 'comment-2',
          objectId: query.objectId,
          objectType: query.objectType,
          text: 'Second comment',
          userId: 'user-2',
        ),
        createDefaultThreadedCommentResponse(
          id: 'comment-3',
          objectId: query.objectId,
          objectType: query.objectType,
          text: 'Third comment',
          userId: 'user-3',
        ),
      ],
    );

    mockApi(
      (api) => api.getComments(
        objectId: query.objectId,
        objectType: query.objectType,
        depth: query.depth,
        sort: query.sort,
        limit: query.limit,
        next: query.next,
        prev: query.previous,
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultCommentsResponse),
        _ => defaultCommentsResponse,
      },
    );

    return activityCommentList.get();
  }
}

// Creates an ActivityCommentListTester for testing activity comment list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by activityCommentListTest only.
Future<ActivityCommentListTester> _createActivityCommentListTester({
  required ActivityCommentList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose activity comment list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ActivityCommentListTester._(
      activityCommentList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

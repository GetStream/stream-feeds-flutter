import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for activity reaction list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'activity-reaction-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [ActivityReactionList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives an [ActivityReactionListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['activity-reaction-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// activityReactionListTest(
///   'queries initial reactions',
///   build: (client) => client.activityReactionList(
///     ActivityReactionsQuery(
///       activityId: 'activity-1',
///     ),
///   ),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.activityReactionListState.reactions, hasLength(3));
///   },
/// );
/// ```
@isTest
void activityReactionListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required ActivityReactionList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(ActivityReactionListTester tester)? setUp,
  required FutureOr<void> Function(ActivityReactionListTester tester) body,
  FutureOr<void> Function(ActivityReactionListTester tester)? verify,
  FutureOr<void> Function(ActivityReactionListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['activity-reaction-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createActivityReactionListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for activity reaction list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying activity reaction list state.
///
/// Resources are automatically cleaned up after the test completes.
final class ActivityReactionListTester
    extends BaseTester<ActivityReactionList> {
  const ActivityReactionListTester._({
    required ActivityReactionList activityReactionList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: activityReactionList);

  /// The activity reaction list being tested.
  ActivityReactionList get activityReactionList => subject;

  /// Current state of the activity reaction list.
  ActivityReactionListState get activityReactionListState {
    return activityReactionList.state;
  }

  /// Stream of activity reaction list state updates.
  Stream<ActivityReactionListState> get activityReactionListStateStream {
    return activityReactionList.stream;
  }

  /// Gets the activity reaction list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the activity reaction list response
  Future<Result<List<FeedsReactionData>>> get({
    QueryActivityReactionsResponse Function(
      QueryActivityReactionsResponse,
    )? modifyResponse,
  }) {
    final query = activityReactionList.query;

    final defaultReactionListResponse =
        createDefaultQueryActivityReactionsResponse(
      reactions: [
        createDefaultReactionResponse(activityId: query.activityId),
        createDefaultReactionResponse(
          activityId: query.activityId,
          userId: 'user-2',
        ),
        createDefaultReactionResponse(
          activityId: query.activityId,
          userId: 'user-3',
        ),
      ],
    );

    mockApi(
      (api) => api.queryActivityReactions(
        activityId: query.activityId,
        queryActivityReactionsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultReactionListResponse),
        _ => defaultReactionListResponse,
      },
    );

    return activityReactionList.get();
  }
}

// Creates an ActivityReactionListTester for testing activity reaction list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by activityReactionListTest only.
Future<ActivityReactionListTester> _createActivityReactionListTester({
  required StreamFeedsClient client,
  required ActivityReactionList subject,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose activity reaction list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ActivityReactionListTester._(
      activityReactionList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

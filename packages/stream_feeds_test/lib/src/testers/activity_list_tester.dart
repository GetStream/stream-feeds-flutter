import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for activity list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'activity-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [ActivityList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives an [ActivityListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['activity-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// activityListTest(
///   'marks activity as hidden on event',
///   build: (client) => client.activityList(ActivitiesQuery()),
///   setUp: (tester) => tester.mockApi(
///     (api) => api.queryActivities(...),
///     result: QueryActivitiesResponse(activities: [...]),
///   ),
///   body: (tester) async {
///     await tester.activityList.get();
///
///     expect(tester.activityList.state.activities.first.hidden, false);
///
///     await tester.emitEvent(ActivityFeedbackEvent(...));
///
///     expect(tester.activityList.state.activities.first.hidden, true);
///   },
/// );
/// ```
@isTest
void activityListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required ActivityList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(ActivityListTester tester)? setUp,
  required FutureOr<void> Function(ActivityListTester tester) body,
  FutureOr<void> Function(ActivityListTester tester)? verify,
  FutureOr<void> Function(ActivityListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['activity-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createActivityListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for activity list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying activity list state.
///
/// Resources are automatically cleaned up after the test completes.
final class ActivityListTester extends BaseTester<ActivityList> {
  const ActivityListTester._({
    required ActivityList activityList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: activityList);

  /// The activity list being tested.
  ActivityList get activityList => subject;

  /// Current state of the activity list.
  ActivityListState get activityListState => activityList.state;

  /// Stream of activity list state updates.
  Stream<ActivityListState> get activityListStateStream => activityList.stream;

  /// Gets the activity list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the activity list response
  Future<Result<List<ActivityData>>> get({
    QueryActivitiesResponse Function(QueryActivitiesResponse)? modifyResponse,
  }) {
    final query = activityList.query;

    final defaultActivityListResponse = createDefaultQueryActivitiesResponse(
      activities: [
        createDefaultActivityResponse(id: 'activity-1'),
        createDefaultActivityResponse(id: 'activity-2'),
        createDefaultActivityResponse(id: 'activity-3'),
      ],
    );

    mockApi(
      (api) => api.queryActivities(queryActivitiesRequest: query.toRequest()),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultActivityListResponse),
        _ => defaultActivityListResponse,
      },
    );

    return activityList.get();
  }
}

// Creates an ActivityListTester for testing activity list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by activityListTest only.
Future<ActivityListTester> _createActivityListTester({
  required ActivityList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose activity list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ActivityListTester._(
      activityList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

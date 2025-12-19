import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for activity operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'activity' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [Activity] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives an [ActivityTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['activity'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example (API test):
/// ```dart
/// activityTest(
///   'submits feedback via API',
///   build: (client) => client.activity(
///     activityId: 'activity-1',
///     fid: FeedId(group: 'user', id: 'john'),
///   ),
///   setUp: (tester) => tester.mockApi(
///     (api) => api.activityFeedback(
///       activityId: 'activity-1',
///       activityFeedbackRequest: ActivityFeedbackRequest(hide: true),
///     ),
///     result: createDefaultActivityFeedbackResponse(),
///   ),
///   body: (tester) async {
///     final result = await tester.activity.activityFeedback(
///       activityFeedbackRequest: ActivityFeedbackRequest(hide: true),
///     );
///
///     expect(result.isSuccess, isTrue);
///   },
///   verify: (tester) {
///     tester.verifyApi(
///       (api) => api.activityFeedback(
///         activityId: 'activity-1',
///         activityFeedbackRequest: ActivityFeedbackRequest(hide: true),
///       ),
///     );
///   },
/// );
/// ```
///
/// Example (event test):
/// ```dart
/// activityTest(
///   'marks activity hidden on event',
///   build: (client) => client.activity(
///     activityId: 'activity-1',
///     fid: FeedId(group: 'user', id: 'john'),
///   ),
///   setUp: (tester) async {
///     await tester.get(
///       modifyResponse: (response) => response.copyWith(hidden: false),
///     );
///   },
///   body: (tester) async {
///     expect(tester.activity.state.activity?.hidden, false);
///
///     await tester.emitEvent(ActivityFeedbackEvent(...));
///
///     expect(tester.activity.state.activity?.hidden, true);
///   },
/// );
/// ```
@isTest
void activityTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required Activity Function(StreamFeedsClient client) build,
  FutureOr<void> Function(ActivityTester tester)? setUp,
  required FutureOr<void> Function(ActivityTester tester) body,
  FutureOr<void> Function(ActivityTester tester)? verify,
  FutureOr<void> Function(ActivityTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['activity'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createActivityTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for activity operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying activity state.
///
/// Resources are automatically cleaned up after the test completes.
final class ActivityTester extends BaseTester<Activity> {
  const ActivityTester._({
    required Activity activity,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: activity);

  /// The activity being tested.
  Activity get activity => subject;

  /// Current state of the activity.
  ActivityState get activityState => activity.state;

  /// Stream of activity state updates.
  Stream<ActivityState> get activityStateStream => activity.stream;

  /// Gets the activity by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the activity response
  /// - [modifyCommentsResponse]: Optional function to customize the comments response
  Future<Result<ActivityData>> get({
    ActivityResponse Function(ActivityResponse)? modifyResponse,
    GetCommentsResponse Function(GetCommentsResponse)? modifyCommentsResponse,
  }) {
    final activityId = activity.activityId;
    final feedId = activity.fid.rawValue;

    final defaultActivityResponse = createDefaultActivityResponse(
      id: activityId,
      feeds: [feedId],
    );

    mockApi(
      (api) => api.getActivity(id: activityId),
      result: GetActivityResponse(
        activity: switch (modifyResponse) {
          final modifier? => modifier(defaultActivityResponse),
          _ => defaultActivityResponse,
        },
        duration: DateTime.timestamp().toIso8601String(),
      ),
    );

    final defaultCommentsResponse = createDefaultCommentsResponse();

    mockApi(
      (api) => api.getComments(
        objectId: activityId,
        objectType: 'activity',
        depth: 3, // default depth for comments
      ),
      result: switch (modifyCommentsResponse) {
        final modifier? => modifier(defaultCommentsResponse),
        _ => defaultCommentsResponse,
      },
    );

    return activity.get();
  }
}

// Creates an ActivityTester for testing activity operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by activityTest only.
Future<ActivityTester> _createActivityTester({
  required Activity subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose activity after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ActivityTester._(
      activity: subject,
      feedsApi: feedsApi,
      wsStreamController: wsStreamController,
    ),
  );
}

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for feed operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'feed' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [Feed] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [FeedTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['feed'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// feedTest(
///   'marks activity as hidden on event',
///   build: (client) => client.feedFromId(FeedId(group: 'user', id: 'john')),
///   setUp: (tester) => tester.mockApi(
///     (api) => api.getOrCreateFeed(...),
///     result: createDefaultGetOrCreateFeedResponse(activities: [...]),
///   ),
///   body: (tester) async {
///     await tester.feed.getOrCreate();
///
///     expect(tester.feed.state.activities.first.hidden, false);
///
///     await tester.emitEvent(ActivityFeedbackEvent(...));
///
///     expect(tester.feed.state.activities.first.hidden, true);
///   },
/// );
/// ```
@isTest
void feedTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required Feed Function(StreamFeedsClient client) build,
  FutureOr<void> Function(FeedTester tester)? setUp,
  required FutureOr<void> Function(FeedTester tester) body,
  FutureOr<void> Function(FeedTester tester)? verify,
  FutureOr<void> Function(FeedTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['feed'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createFeedTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for feed operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying feed state.
///
/// Resources are automatically cleaned up after the test completes.
final class FeedTester extends BaseTester<Feed> {
  const FeedTester._({
    required Feed feed,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: feed);

  /// The feed being tested.
  Feed get feed => subject;

  /// The current state of the feed.
  FeedState get feedState => feed.state;

  /// Stream of feed state updates.
  Stream<FeedState> get feedStateStream => feed.stream;

  /// Gets or creates the feed by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the feed response
  Future<Result<FeedData>> getOrCreate({
    GetOrCreateFeedResponse Function(GetOrCreateFeedResponse)? modifyResponse,
  }) {
    final feedId = feed.fid;
    final query = feed.query;

    final defaultFeedResponse = createDefaultGetOrCreateFeedResponse(
      activities: [
        createDefaultActivityResponse(id: 'activity-1'),
        createDefaultActivityResponse(id: 'activity-2'),
        createDefaultActivityResponse(id: 'activity-3'),
      ],
    );

    mockApi(
      (api) => api.getOrCreateFeed(
        feedId: feedId.id,
        feedGroupId: feedId.group,
        getOrCreateFeedRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultFeedResponse),
        _ => defaultFeedResponse,
      },
    );

    return feed.getOrCreate();
  }
}

// Creates a FeedTester for testing feed operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by feedTest only.
Future<FeedTester> _createFeedTester({
  required Feed subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose feed after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => FeedTester._(
      feed: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

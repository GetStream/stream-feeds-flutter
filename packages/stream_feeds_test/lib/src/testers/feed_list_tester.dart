import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for feed list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'feed-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [FeedList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [FeedListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['feed-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// feedListTest(
///   'removes feed when updated to non-matching visibility',
///   build: (client) => client.feedList(FeedsQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.feedListState.feeds, hasLength(3));
///
///     await tester.emitEvent(FeedUpdatedEvent(...));
///
///     expect(tester.feedListState.feeds, hasLength(2));
///   },
/// );
/// ```
@isTest
void feedListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required FeedList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(FeedListTester tester)? setUp,
  required FutureOr<void> Function(FeedListTester tester) body,
  FutureOr<void> Function(FeedListTester tester)? verify,
  FutureOr<void> Function(FeedListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['feed-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createFeedListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for feed list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying feed list state.
///
/// Resources are automatically cleaned up after the test completes.
final class FeedListTester extends BaseTester<FeedList> {
  const FeedListTester._({
    required FeedList feedList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: feedList);

  /// The feed list being tested.
  FeedList get feedList => subject;

  /// Current state of the feed list.
  FeedListState get feedListState => feedList.state;

  /// Stream of feed list state updates.
  Stream<FeedListState> get feedListStateStream => feedList.stream;

  /// Gets the feed list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the feed list response
  Future<Result<List<FeedData>>> get({
    QueryFeedsResponse Function(QueryFeedsResponse)? modifyResponse,
  }) {
    final query = feedList.query;

    final defaultFeedListResponse = QueryFeedsResponse(
      duration: DateTime.now().toIso8601String(),
      feeds: [
        createDefaultFeedResponse(id: 'feed-1'),
        createDefaultFeedResponse(id: 'feed-2'),
        createDefaultFeedResponse(id: 'feed-3'),
      ],
    );

    mockApi(
      (api) => api.queryFeeds(
        queryFeedsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultFeedListResponse),
        _ => defaultFeedListResponse,
      },
    );

    return feedList.get();
  }
}

// Creates a FeedListTester for testing feed list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by feedListTest only.
Future<FeedListTester> _createFeedListTester({
  required FeedList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose feed list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => FeedListTester._(
      feedList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

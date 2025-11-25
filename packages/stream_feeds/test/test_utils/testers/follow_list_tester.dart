import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../fakes.dart';
import '../mocks.dart';
import 'base_tester.dart';

/// Test helper for follow list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'follow-list' by default for filtering.
///
/// [build] constructs the [FollowList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [FollowListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['follow-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// followListTest(
///   'removes follow when updated to non-matching status',
///   build: (client) => client.followList(FollowsQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.followListState.follows, hasLength(3));
///
///     await tester.emitEvent(FollowUpdatedEvent(...));
///
///     expect(tester.followListState.follows, hasLength(2));
///   },
/// );
/// ```
@isTest
void followListTest(
  String description, {
  required FollowList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(FollowListTester tester)? setUp,
  required FutureOr<void> Function(FollowListTester tester) body,
  FutureOr<void> Function(FollowListTester tester)? verify,
  FutureOr<void> Function(FollowListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['follow-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    build: build,
    createTesterFn: _createFollowListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for follow list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying follow list state.
///
/// Resources are automatically cleaned up after the test completes.
final class FollowListTester extends BaseTester<FollowList> {
  const FollowListTester._({
    required FollowList followList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: followList);

  /// The follow list being tested.
  FollowList get followList => subject;

  /// Current state of the follow list.
  FollowListState get followListState => followList.state;

  /// Stream of follow list state updates.
  Stream<FollowListState> get followListStateStream => followList.stream;

  /// Gets the follow list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the follow list response
  Future<Result<List<FollowData>>> get({
    QueryFollowsResponse Function(QueryFollowsResponse)? modifyResponse,
  }) {
    final query = followList.query;

    final defaultFollowListResponse = QueryFollowsResponse(
      duration: DateTime.now().toIso8601String(),
      follows: [
        createDefaultFollowResponse(id: 'follow-1'),
        createDefaultFollowResponse(id: 'follow-2'),
        createDefaultFollowResponse(id: 'follow-3'),
      ],
    );

    mockApi(
      (api) => api.queryFollows(
        queryFollowsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultFollowListResponse),
        _ => defaultFollowListResponse,
      },
    );

    return followList.get();
  }
}

// Creates a FollowListTester for testing follow list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by followListTest only.
Future<FollowListTester> _createFollowListTester({
  required FollowList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose follow list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => FollowListTester._(
      followList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

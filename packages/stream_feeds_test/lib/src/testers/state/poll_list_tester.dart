import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for poll list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'poll-list' by default for filtering.
///
/// [user] is optional, the user for whom the client is configured (defaults to luke_skywalker).

/// [build] constructs the [PollList] under test using the provided [StreamFeedsClient].
/// [connect] is optional, custom connection logic (defaults to successful auth + connect).
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [PollListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['poll-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// pollListTest(
///   'removes poll when updated to non-matching status',
///   build: (client) => client.pollList(PollsQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.pollListState.polls, hasLength(3));
///
///     await tester.emitEvent(PollUpdatedFeedEvent(...));
///
///     expect(tester.pollListState.polls, hasLength(2));
///   },
/// );
/// ```
@isTest
void pollListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required PollList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(PollListTester tester)? connect,
  FutureOr<void> Function(PollListTester tester)? setUp,
  required FutureOr<void> Function(PollListTester tester) body,
  FutureOr<void> Function(PollListTester tester)? verify,
  FutureOr<void> Function(PollListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['poll-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createPollListTester,
    connect: connect,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for poll list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying poll list state.
///
/// Resources are automatically cleaned up after the test completes.
final class PollListTester extends BaseTester<PollList> {
  const PollListTester._({
    required PollList pollList,
    required super.client,
    required super.wsTester,
    required super.feedsApi,
    required super.cdnApi,
  }) : super(subject: pollList);

  /// The poll list being tested.
  PollList get pollList => subject;

  /// Current state of the poll list.
  PollListState get pollListState => pollList.state;

  /// Stream of poll list state updates.
  Stream<PollListState> get pollListStateStream => pollList.stream;

  /// Gets the poll list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the poll list response
  Future<Result<List<PollData>>> get({
    QueryPollsResponse Function(QueryPollsResponse)? modifyResponse,
  }) {
    final query = pollList.query;

    final defaultPollListResponse = QueryPollsResponse(
      duration: DateTime.now().toIso8601String(),
      polls: [
        createDefaultPollResponse(id: 'poll-1'),
        createDefaultPollResponse(id: 'poll-2'),
        createDefaultPollResponse(id: 'poll-3'),
      ],
    );

    mockApi(
      (api) => api.queryPolls(
        queryPollsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultPollListResponse),
        _ => defaultPollListResponse,
      },
    );

    return pollList.get();
  }
}

// Creates a PollListTester for testing poll list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by pollListTest only.
Future<PollListTester> _createPollListTester({
  required PollList subject,
  required StreamFeedsClient client,
  required MockCdnApi cdnApi,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose poll list after test
  test.addTearDown(subject.dispose);

  return createTester(
    webSocketChannel: webSocketChannel,
    create: (wsTester) => PollListTester._(
      pollList: subject,
      client: client,
      wsTester: wsTester,
      cdnApi: cdnApi,
      feedsApi: feedsApi,
    ),
  );
}

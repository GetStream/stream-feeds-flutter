import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../fakes.dart';
import '../mocks.dart';
import 'base_tester.dart';

/// Test helper for poll vote list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'poll-vote-list' by default for filtering.
///
/// [build] constructs the [PollVoteList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [PollVoteListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['poll-vote-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// pollVoteListTest(
///   'removes vote when changed to non-matching option',
///   build: (client) => client.pollVoteList(PollVotesQuery(pollId: 'poll-1')),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.pollVoteListState.votes, hasLength(3));
///
///     await tester.emitEvent(PollVoteChangedFeedEvent(...));
///
///     expect(tester.pollVoteListState.votes, hasLength(2));
///   },
/// );
/// ```
@isTest
void pollVoteListTest(
  String description, {
  required PollVoteList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(PollVoteListTester tester)? setUp,
  required FutureOr<void> Function(PollVoteListTester tester) body,
  FutureOr<void> Function(PollVoteListTester tester)? verify,
  FutureOr<void> Function(PollVoteListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['poll-vote-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    build: build,
    createTesterFn: _createPollVoteListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for poll vote list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying poll vote list state.
///
/// Resources are automatically cleaned up after the test completes.
final class PollVoteListTester extends BaseTester<PollVoteList> {
  const PollVoteListTester._({
    required PollVoteList pollVoteList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: pollVoteList);

  /// The poll vote list being tested.
  PollVoteList get pollVoteList => subject;

  /// Current state of the poll vote list.
  PollVoteListState get pollVoteListState => pollVoteList.state;

  /// Stream of poll vote list state updates.
  Stream<PollVoteListState> get pollVoteListStateStream => pollVoteList.stream;

  /// Gets the poll vote list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the poll vote list response
  Future<Result<List<PollVoteData>>> get({
    PollVotesResponse Function(PollVotesResponse)? modifyResponse,
  }) {
    final query = pollVoteList.query;

    final defaultPollVoteListResponse = PollVotesResponse(
      duration: DateTime.now().toIso8601String(),
      votes: [
        createDefaultPollVoteResponse(
          id: 'vote-1',
          pollId: query.pollId,
        ),
        createDefaultPollVoteResponse(
          id: 'vote-2',
          pollId: query.pollId,
        ),
        createDefaultPollVoteResponse(
          id: 'vote-3',
          pollId: query.pollId,
        ),
      ],
    );

    mockApi(
      (api) => api.queryPollVotes(
        pollId: query.pollId,
        queryPollVotesRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultPollVoteListResponse),
        _ => defaultPollVoteListResponse,
      },
    );

    return pollVoteList.get();
  }
}

// Creates a PollVoteListTester for testing poll vote list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by pollVoteListTest only.
Future<PollVoteListTester> _createPollVoteListTester({
  required PollVoteList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose poll vote list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => PollVoteListTester._(
      pollVoteList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

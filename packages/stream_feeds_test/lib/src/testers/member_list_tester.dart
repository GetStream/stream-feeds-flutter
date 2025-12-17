import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import '../helpers/test_data.dart';
import 'base_tester.dart';

/// Test helper for member list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'member-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).

/// [build] constructs the [MemberList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [MemberListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['member-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// memberListTest(
///   'queries initial members',
///   build: (client) => client.memberList(
///     MembersQuery(fid: FeedId(group: 'user', id: 'john')),
///   ),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.memberListState.members, hasLength(3));
///   },
/// );
/// ```
@isTest
void memberListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required MemberList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(MemberListTester tester)? setUp,
  required FutureOr<void> Function(MemberListTester tester) body,
  FutureOr<void> Function(MemberListTester tester)? verify,
  FutureOr<void> Function(MemberListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['member-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createMemberListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for member list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying member list state.
///
/// Resources are automatically cleaned up after the test completes.
final class MemberListTester extends BaseTester<MemberList> {
  const MemberListTester._({
    required MemberList memberList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: memberList);

  /// The member list being tested.
  MemberList get memberList => subject;

  /// Current state of the member list.
  MemberListState get memberListState => memberList.state;

  /// Stream of member list state updates.
  Stream<MemberListState> get memberListStateStream => memberList.stream;

  /// Gets the member list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the member list response
  Future<Result<List<FeedMemberData>>> get({
    QueryFeedMembersResponse Function(QueryFeedMembersResponse)? modifyResponse,
  }) {
    final query = memberList.query;

    final defaultMemberListResponse = createDefaultQueryFeedMembersResponse(
      members: [
        createDefaultFeedMemberResponse(id: 'member-1'),
        createDefaultFeedMemberResponse(id: 'member-2'),
        createDefaultFeedMemberResponse(id: 'member-3'),
      ],
    );

    mockApi(
      (api) => api.queryFeedMembers(
        feedId: query.fid.id,
        feedGroupId: query.fid.group,
        queryFeedMembersRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultMemberListResponse),
        _ => defaultMemberListResponse,
      },
    );

    return memberList.get();
  }
}

// Creates a MemberListTester for testing member list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by memberListTest only.
Future<MemberListTester> _createMemberListTester({
  required StreamFeedsClient client,
  required MemberList subject,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) async {
  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => MemberListTester._(
      memberList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

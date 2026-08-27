import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for user list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'user-list' by default for filtering.
///
/// [user] is optional, the user for whom the client is configured (defaults to luke_skywalker).
/// [build] constructs the [UserList] under test using the provided [StreamFeedsClient].
/// [connect] is optional, custom connection logic (defaults to successful auth + connect).
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [UserListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['user-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// userListTest(
///   'should query initial users',
///   build: (client) => client.userList(const UsersQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.userListState.users, hasLength(3));
///   },
/// );
/// ```
@isTest
void userListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required UserList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(UserListTester tester)? connect,
  FutureOr<void> Function(UserListTester tester)? setUp,
  required FutureOr<void> Function(UserListTester tester) body,
  FutureOr<void> Function(UserListTester tester)? verify,
  FutureOr<void> Function(UserListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['user-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createUserListTester,
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

/// A test utility for user list operations.
///
/// Provides helper methods for querying users and verifying user list state.
///
/// Resources are automatically cleaned up after the test completes.
final class UserListTester extends BaseTester<UserList> {
  const UserListTester._({
    required UserList userList,
    required super.client,
    required super.wsTester,
    required super.feedsApi,
    required super.cdnApi,
  }) : super(subject: userList);

  /// The user list being tested.
  UserList get userList => subject;

  /// Current state of the user list.
  UserListState get userListState => userList.state;

  /// Stream of user list state updates.
  Stream<UserListState> get userListStateStream => userList.stream;

  /// The payload of the single `queryUsers` request made so far.
  ///
  /// Read this to assert on what the SDK actually sent, rather than on a
  /// payload the test built itself from the same query.
  QueryUsersPayload get capturedQueryUsersPayload {
    final captured = captureApi(
      (api) => api.queryUsers(payload: captureAny(named: 'payload')),
    );

    return captured.single! as QueryUsersPayload;
  }

  /// Gets the user list by fetching it from the API.
  ///
  /// Call this to set up initial state before querying more users.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the user list response
  Future<Result<List<UserData>>> get({
    QueryUsersResponse Function(QueryUsersResponse)? modifyResponse,
  }) {
    final query = userList.query;

    final defaultUserListResponse = createDefaultQueryUsersResponse(
      users: [
        createDefaultFullUserResponse(name: 'Luke'),
        createDefaultFullUserResponse(id: 'user-2', name: 'Leia'),
        createDefaultFullUserResponse(id: 'user-3', name: 'Han'),
      ],
    );

    mockApi(
      (api) => api.queryUsers(payload: query.toRequest()),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultUserListResponse),
        _ => defaultUserListResponse,
      },
    );

    return userList.get();
  }
}

// Creates a UserListTester for testing user list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by userListTest only.
Future<UserListTester> _createUserListTester({
  required UserList subject,
  required StreamFeedsClient client,
  required MockCdnApi cdnApi,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose user list after test
  test.addTearDown(subject.dispose);

  return createTester(
    webSocketChannel: webSocketChannel,
    create: (wsTester) => UserListTester._(
      userList: subject,
      client: client,
      wsTester: wsTester,
      cdnApi: cdnApi,
      feedsApi: feedsApi,
    ),
  );
}

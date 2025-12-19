import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../../helpers/mocks.dart';
import '../../helpers/test_data.dart';
import '../base_tester.dart';

/// Test helper for moderation config list operations.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
/// Tests are tagged with 'moderation-config-list' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).
/// [build] constructs the [ModerationConfigList] under test using the provided [StreamFeedsClient].
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [ModerationConfigListTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for cleanup operations.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['moderation-config-list'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// moderationConfigListTest(
///   'should query initial configs',
///   build: (client) => client.moderationConfigList(ModerationConfigsQuery()),
///   setUp: (tester) => tester.get(),
///   body: (tester) async {
///     expect(tester.moderationConfigListState.configs, hasLength(3));
///   },
/// );
/// ```
@isTest
void moderationConfigListTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required ModerationConfigList Function(StreamFeedsClient client) build,
  FutureOr<void> Function(ModerationConfigListTester tester)? setUp,
  required FutureOr<void> Function(ModerationConfigListTester tester) body,
  FutureOr<void> Function(ModerationConfigListTester tester)? verify,
  FutureOr<void> Function(ModerationConfigListTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['moderation-config-list'],
  test.Timeout? timeout,
}) {
  return testWithTester(
    description,
    user: user,
    build: build,
    createTesterFn: _createModerationConfigListTester,
    setUp: setUp,
    body: body,
    verify: verify,
    tearDown: tearDown,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for moderation config list operations with WebSocket support.
///
/// Provides helper methods for emitting events and verifying moderation config list state.
///
/// Resources are automatically cleaned up after the test completes.
final class ModerationConfigListTester
    extends BaseTester<ModerationConfigList> {
  const ModerationConfigListTester._({
    required ModerationConfigList moderationConfigList,
    required super.wsStreamController,
    required super.feedsApi,
  }) : super(subject: moderationConfigList);

  /// The moderation config list being tested.
  ModerationConfigList get moderationConfigList => subject;

  /// Current state of the moderation config list.
  ModerationConfigListState get moderationConfigListState {
    return moderationConfigList.state;
  }

  /// Stream of moderation config list state updates.
  Stream<ModerationConfigListState> get moderationConfigListStateStream {
    return moderationConfigList.stream;
  }

  /// Gets the moderation config list by fetching it from the API.
  ///
  /// Call this in event tests to set up initial state before emitting events.
  /// Skip this in API tests that only verify method calls.
  ///
  /// Parameters:
  /// - [modifyResponse]: Optional function to customize the moderation config list response
  Future<Result<List<ModerationConfigData>>> get({
    QueryModerationConfigsResponse Function(
      QueryModerationConfigsResponse,
    )? modifyResponse,
  }) {
    final query = moderationConfigList.query;

    final defaultConfigListResponse =
        createDefaultQueryModerationConfigsResponse(
      configs: [
        createDefaultModerationConfigResponse(key: 'config-1'),
        createDefaultModerationConfigResponse(key: 'config-2'),
        createDefaultModerationConfigResponse(key: 'config-3'),
      ],
    );

    mockApi(
      (api) => api.queryModerationConfigs(
        queryModerationConfigsRequest: query.toRequest(),
      ),
      result: switch (modifyResponse) {
        final modifier? => modifier(defaultConfigListResponse),
        _ => defaultConfigListResponse,
      },
    );

    return moderationConfigList.get();
  }
}

// Creates a ModerationConfigListTester for testing moderation config list operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by moderationConfigListTest only.
Future<ModerationConfigListTester> _createModerationConfigListTester({
  required ModerationConfigList subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  // Dispose moderation config list after test
  test.addTearDown(subject.dispose);

  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ModerationConfigListTester._(
      moderationConfigList: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

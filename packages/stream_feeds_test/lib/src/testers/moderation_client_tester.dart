import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import 'base_tester.dart';

/// Test helper for moderation client operations.
///
/// Automatically sets up client and test infrastructure.
/// Tests are tagged with 'moderation-client' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [ModerationClientTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['moderation-client'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// moderationClientTest(
///   'should ban user via API',
///   setUp: (tester) {
///     tester.mockApi(
///       (api) => api.ban(banRequest: any(named: 'banRequest')),
///       result: createDefaultBanResponse(),
///     );
///   },
///   body: (tester) async {
///     const request = BanRequest(targetUserId: 'user-123');
///     final result = await tester.moderation.ban(banRequest: request);
///     expect(result.isSuccess, isTrue);
///   },
///   verify: (tester) => tester.verifyApi(
///     (api) => api.ban(banRequest: any(named: 'banRequest')),
///   ),
/// );
/// ```
@isTest
void moderationClientTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  FutureOr<void> Function(ModerationClientTester tester)? setUp,
  required FutureOr<void> Function(ModerationClientTester tester) body,
  FutureOr<void> Function(ModerationClientTester tester)? verify,
  bool skip = false,
  Iterable<String> tags = const ['moderation-client'],
  test.Timeout? timeout,
}) {
  return testWithTester<StreamFeedsClient, ModerationClientTester>(
    description,
    user: user,
    build: (client) => client,
    createTesterFn: _createModerationClientTester,
    setUp: setUp,
    body: body,
    verify: verify,
    skip: skip,
    tags: tags,
    timeout: timeout,
  );
}

/// A test utility for moderation client operations.
///
/// Provides helper methods for mocking and verifying moderation API calls.
///
/// Resources are automatically cleaned up after the test completes.
final class ModerationClientTester extends BaseTester<StreamFeedsClient> {
  const ModerationClientTester._({
    required super.subject,
    required super.wsStreamController,
    required super.feedsApi,
  });

  /// The Stream Feeds client being tested.
  StreamFeedsClient get client => subject;

  /// The moderation client for performing moderation operations.
  ModerationClient get moderation => subject.moderation;
}

// Creates a ModerationClientTester for testing moderation client operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by moderationClientTest only.
Future<ModerationClientTester> _createModerationClientTester({
  required StreamFeedsClient subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  return createTester(
    client: client,
    webSocketChannel: webSocketChannel,
    create: (wsStreamController) => ModerationClientTester._(
      subject: subject,
      wsStreamController: wsStreamController,
      feedsApi: feedsApi,
    ),
  );
}

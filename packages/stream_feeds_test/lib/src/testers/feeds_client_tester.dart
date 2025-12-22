import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/mocks.dart';
import 'base_tester.dart';

/// Test helper for feeds client operations.
///
/// Automatically sets up client and test infrastructure.
/// Tests are tagged with 'feeds-client' by default for filtering.
///
/// [user] is optional, the authenticated user for the test client (defaults to luke_skywalker).
/// [setUp] is optional and runs before [body] for setting up mocks and test state.
/// [body] is the test callback that receives a [FeedsClientTester] for interactions.
/// [verify] is optional and runs after [body] for verifying API calls and interactions.
/// [tearDown] is optional and runs after [verify] for custom cleanup.
/// [skip] is optional, skip this test.
/// [tags] is optional, tags for test filtering. Defaults to ['feeds-client'].
/// [timeout] is optional, custom timeout for this test.
///
/// Example:
/// ```dart
/// feedsClientTest(
///   'should create feed successfully',
///   body: (tester) async {
///     final query = FeedQuery(fid: FeedId(group: 'user', id: 'john'));
///
///     tester.mockApi(
///       (api) => api.getOrCreateFeed(...),
///       result: createDefaultGetOrCreateFeedResponse(),
///     );
///
///     final feed = tester.client.feed(query.fid);
///     await feed.getOrCreate();
///   },
/// );
/// ```
@isTest
void feedsClientTest(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  FutureOr<void> Function(FeedsClientTester tester)? connect,
  FutureOr<void> Function(FeedsClientTester tester)? setUp,
  required FutureOr<void> Function(FeedsClientTester tester) body,
  FutureOr<void> Function(FeedsClientTester tester)? verify,
  FutureOr<void> Function(FeedsClientTester tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const ['feeds-client'],
  test.Timeout? timeout,
}) {
  return testWithTester<StreamFeedsClient, FeedsClientTester>(
    description,
    user: user,
    build: (client) => client,
    createTesterFn: _createFeedsClientTester,
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

/// A test utility for feeds client operations.
///
/// Provides helper methods for mocking and verifying feeds API calls and CDN operations.
///
/// Resources are automatically cleaned up after the test completes.
final class FeedsClientTester extends BaseTester<StreamFeedsClient> {
  const FeedsClientTester._({
    required super.client,
    required super.wsTester,
    required super.feedsApi,
    required super.cdnApi,
  }) : super(subject: client);
}

// Creates a FeedsClientTester for testing feeds client operations.
//
// Automatically sets up WebSocket connection and registers cleanup handlers.
// This function is for internal use by feedsClientTest only.
Future<FeedsClientTester> _createFeedsClientTester({
  required StreamFeedsClient subject,
  required StreamFeedsClient client,
  required MockCdnApi cdnApi,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
}) {
  return createTester(
    webSocketChannel: webSocketChannel,
    create: (wsTester) => FeedsClientTester._(
      client: subject,
      wsTester: wsTester,
      cdnApi: cdnApi,
      feedsApi: feedsApi,
    ),
  );
}

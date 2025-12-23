import 'dart:async';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../helpers/api_mocker_mixin.dart';
import '../helpers/cdn_mocker_mixin.dart';
import '../helpers/mocks.dart';
import 'websocket_tester.dart';

/// Factory function signature for creating tester instances.
///
/// All concrete tester factory functions must conform to this signature.
typedef TesterFactory<S, T extends BaseTester<S>> = Future<T> Function({
  required S subject,
  required StreamFeedsClient client,
  required MockCdnApi cdnApi,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
});

/// Base class for all test utilities with WebSocket support.
///
/// Provides common functionality for emitting events, pumping the event queue,
/// and making assertions about the state object being tested.
///
/// Type parameter [S] is the subject being tested.
abstract base class BaseTester<S> with ApiMockerMixin, CdnMockerMixin {
  const BaseTester({
    required this.subject,
    required this.cdnApi,
    required this.feedsApi,
    required WebSocketTester wsTester,
    required StreamFeedsClient client,
  })  : _client = client,
        _wsTester = wsTester;

  /// The subject being tested.
  final S subject;

  @override
  @protected
  final MockCdnApi cdnApi;

  @override
  @protected
  final MockDefaultApi feedsApi;

  /// The underlying StreamFeedsClient from which the subject was built.
  ///
  /// Use this to access client-level properties and methods.
  ///
  /// Example:
  /// ```dart
  /// final userId = tester.client.user.id;
  /// ```
  ///
  /// Note: prefer using [subject] for testing the specific state object.
  StreamFeedsClient get client => _client;
  final StreamFeedsClient _client;

  /// The user for whom the test client is configured.
  ///
  /// This is the user that will be used for authentication and performing all
  /// actions through the client. Convenience getter that returns `client.user`.
  ///
  /// Example:
  /// ```dart
  /// // Use the configured user's ID for authentication
  /// tester.mockSuccessfulAuth(tester.user.id);
  ///
  /// // Verify actions are performed as this user
  /// expect(tester.user.id, equals('luke_skywalker'));
  /// ```
  User get user => _client.user;

  // WebSocket tester for managing WebSocket interactions.
  final WebSocketTester _wsTester;

  /// Configures WebSocket mocks to simulate successful authentication for [userId].
  ///
  /// Use this in test setup to configure how the WebSocket should respond to
  /// connection attempts.
  ///
  /// Example:
  /// ```dart
  /// tester.mockSuccessfulAuth('user-123');
  /// await client.connect(); // Will succeed
  /// ```
  void mockSuccessfulAuth(String userId) {
    return _wsTester.mockSuccessfulAuth(userId);
  }

  /// Configures WebSocket mocks to simulate authentication failure.
  ///
  /// The [errorCode] parameter allows customizing the error code returned.
  /// Default is 40 (expiredToken), which prevents automatic reconnection.
  ///
  /// Use this in test setup when testing error scenarios.
  ///
  /// Example:
  /// ```dart
  /// // Default error code (no reconnection)
  /// tester.mockFailedAuth();
  ///
  /// // Custom error code (triggers reconnection)
  /// tester.mockFailedAuth(errorCode: 5);
  ///
  /// await expectLater(client.connect(), throwsA(isA<ClientException>()));
  /// ```
  void mockFailedAuth({int errorCode = 40}) {
    return _wsTester.mockFailedAuth(errorCode: errorCode);
  }

  /// Emits a WebSocket event and pumps the event loop.
  ///
  /// This method emits the given [event] through the WebSocket stream and
  /// then pumps the event loop to allow async event handlers to run.
  ///
  /// Use this to test how state objects react to real-time events.
  ///
  /// Example:
  /// ```dart
  /// await tester.emitEvent({'type': 'activity.added', ...});
  /// expect(tester.subject.state.activities, hasLength(1));
  /// ```
  Future<void> emitEvent(Object event) async {
    _wsTester.emitEvent(event);
    await pumpEventQueue();
  }

  /// Waits for events to be processed.
  ///
  /// Returns a [Future] that completes after the [event loop][] has run the given
  /// number of [times] (20 by default).
  ///
  /// [event loop]: https://medium.com/dartlang/dart-asynchronous-programming-isolates-and-event-loops-bffc3e296a6a
  ///
  /// Awaiting this approximates waiting until all asynchronous work (other than
  /// work that's waiting for external resources) completes.
  ///
  /// Example:
  /// ```dart
  /// // Pump event queue 20 times (default)
  /// await tester.pumpEventQueue();
  ///
  /// // Pump event queue 50 times for more complex async operations
  /// await tester.pumpEventQueue(times: 50);
  /// ```
  Future<void> pumpEventQueue({int times = 20}) {
    return test.pumpEventQueue(times: times);
  }
}

/// Creates a tester instance with WebSocket support.
///
/// This is a generic factory function that handles common setup for creating
/// test utilities. It automatically:
/// - Creates a WebSocket stream controller
/// - Sets up WebSocket tester with the mock channel
/// - Registers cleanup for the stream controller
///
/// The [create] callback receives the [WebSocketTester] instance and should
/// return the concrete tester instance.
///
/// This function is for internal use by concrete tester factories only.
Future<T> createTester<T extends BaseTester<Object?>>({
  required MockWebSocketChannel webSocketChannel,
  required T Function(WebSocketTester ws) create,
}) async {
  // Create WebSocket stream controller
  final wsStreamController = StreamController<Object>();
  test.addTearDown(wsStreamController.close); // Close controller after test

  // Create WebSocket tester
  final ws = WebSocketTester(
    channel: webSocketChannel,
    streamController: wsStreamController,
  );

  return create(ws);
}

/// Generic test helper for state objects with WebSocket support.
///
/// Automatically sets up the test client, WebSocket infrastructure, and
/// coordinates the test lifecycle.
///
/// Parameters:
/// - [user]: the user for whom the client is configured (defaults to luke_skywalker)
/// - [build]: constructs the subject under test using the provided StreamFeedsClient
/// - [createTesterFn]: the concrete tester factory function
/// - [connect]: optional, custom connection logic (defaults to successful auth + connect)
/// - [setUp]: optional, runs before body for setting up mocks and test state
/// - [body]: the test callback that receives a tester for interactions
/// - [verify]: optional, runs after body for verifying API calls
/// - [tearDown]: optional, runs after verify for custom cleanup
/// - [skip]: optional, skip this test
/// - [tags]: optional, tags for test filtering
/// - [timeout]: optional, custom timeout for this test
///
/// This function is for internal use by concrete test helpers.
void testWithTester<S, T extends BaseTester<S>>(
  String description, {
  User user = const User(id: 'luke_skywalker'),
  required S Function(StreamFeedsClient client) build,
  required TesterFactory<S, T> createTesterFn,
  FutureOr<void> Function(T tester)? connect,
  FutureOr<void> Function(T tester)? setUp,
  required FutureOr<void> Function(T tester) body,
  FutureOr<void> Function(T tester)? verify,
  FutureOr<void> Function(T tester)? tearDown,
  bool skip = false,
  Iterable<String> tags = const [],
  test.Timeout? timeout,
}) {
  return test.test(
    description,
    skip: skip,
    tags: tags,
    timeout: timeout,
    () async {
      await _runZonedGuarded(() async {
        final cdnApi = MockCdnApi();
        final feedsApi = MockDefaultApi();
        final webSocketChannel = MockWebSocketChannel();

        final client = StreamFeedsClient(
          apiKey: 'apiKey',
          user: user,
          tokenProvider: TokenProvider.static(
            generateTestUserToken(user.id),
          ),
          feedsRestApi: feedsApi,
          wsProvider: (options) => webSocketChannel,
          config: FeedsConfig(
            cdnClient: FeedsCdnClient(cdnApi),
          ),
        );

        final tester = await createTesterFn(
          subject: build.call(client),
          client: client,
          cdnApi: cdnApi,
          feedsApi: feedsApi,
          webSocketChannel: webSocketChannel,
        );

        final connectFn = connect ?? _defaultConnect;
        await connectFn.call(tester);

        await setUp?.call(tester);
        await body(tester);
        await verify?.call(tester);
        await tearDown?.call(tester);
      });
    },
  );
}

// Default connect implementation: mock successful auth and connect client.
Future<void> _defaultConnect(BaseTester<Object?> tester) async {
  // Mock successful authentication for the client's user
  tester.mockSuccessfulAuth(tester.client.user.id);

  // Connect client
  await tester.client.connect();
  test.addTearDown(tester.client.disconnect); // Disconnect client after test

  // Verify client is connected
  test.expect(tester.client.connectionState.value, test.isA<Connected>());
}

// Runs the test body in a guarded zone to catch all errors.
//
// This ensures that errors from event handlers, timers, and unawaited
// futures are properly caught and reported, not just errors in the
// main async chain.
Future<void> _runZonedGuarded(Future<void> Function() body) {
  final completer = Completer<void>();
  runZonedGuarded(() async {
    await body();
    if (!completer.isCompleted) completer.complete();
  }, (error, stackTrace) {
    if (!completer.isCompleted) completer.completeError(error, stackTrace);
  });
  return completer.future;
}

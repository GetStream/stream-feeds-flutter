import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart' as test;

import '../mocks.dart';
import '../ws_test_helpers.dart';
import 'api_mocker_mixin.dart';

/// Factory function signature for creating tester instances.
///
/// All concrete tester factory functions must conform to this signature.
typedef TesterFactory<S, T extends BaseTester<S>> = Future<T> Function({
  required S subject,
  required StreamFeedsClient client,
  required MockDefaultApi feedsApi,
  required MockWebSocketChannel webSocketChannel,
});

/// Base class for all test utilities with WebSocket support.
///
/// Provides common functionality for emitting events, pumping the event queue,
/// and making assertions about the state object being tested.
///
/// Type parameter [S] is the subject being tested.
abstract base class BaseTester<S> with ApiMockerMixin {
  const BaseTester({
    required this.subject,
    required this.feedsApi,
    required StreamController<Object> wsStreamController,
  }) : _wsStreamController = wsStreamController;

  /// The subject being tested.
  final S subject;

  @override
  @protected
  final MockDefaultApi feedsApi;

  // WebSocket stream controller for emitting events.
  final StreamController<Object> _wsStreamController;

  /// Emits a WebSocket event and waits for it to be processed.
  Future<void> emitEvent(Object event) async {
    _wsStreamController.add(jsonEncode(event));
    await pump();
  }

  /// Waits for events to be processed.
  ///
  /// By default uses a zero-duration delay to allow the event loop to process
  /// pending events. Pass [duration] for longer waits if needed.
  ///
  /// Example:
  /// ```dart
  /// await tester.pump(); // Default zero duration
  /// await tester.pump(Duration(milliseconds: 100)); // Wait 100ms
  /// ```
  Future<void> pump([Duration duration = Duration.zero]) {
    return Future<Object?>.delayed(duration);
  }

  /// Asserts that [actual] matches [matcher].
  ///
  /// The [actual] parameter is a function that receives the subject
  /// and returns a value to assert.
  ///
  /// Example:
  /// ```dart
  /// tester.expect((subject) => subject.state.someField, expectedValue);
  /// ```
  @Deprecated('Use regular expect instead')
  void expect(
    Object? Function(S subject) actual,
    Object? matcher, {
    String? reason,
  }) {
    return test.expect(
      actual(subject),
      test.wrapMatcher(matcher),
      reason: reason,
    );
  }

  /// Asserts that [actual] matches [matcher] asynchronously.
  ///
  /// The [actual] parameter is a function that receives the subject
  /// and returns a value to assert.
  ///
  /// Example:
  /// ```dart
  /// await tester.expectLater(
  ///   (subject) => subject.stream,
  ///   emits(expectedValue),
  /// );
  /// ```
  Future<void> expectLater(
    Object? Function(S subject) actual,
    Object? matcher, {
    String? reason,
  }) {
    return test.expectLater(
      actual(subject),
      test.wrapMatcher(matcher),
      reason: reason,
    );
  }
}

/// Creates a tester instance with WebSocket support.
///
/// This is a generic factory function that handles all the common setup
/// for creating test utilities. It automatically:
/// - Creates and registers WebSocket components for cleanup
/// - Sets up WebSocket connection
/// - Connects the client
/// - Registers client disconnection for cleanup
///
/// The create callback receives the WebSocket stream controller and should
/// return the concrete tester instance.
///
/// This function is for internal use by concrete tester factories only.
Future<T> createTester<T extends BaseTester<Object?>>({
  required StreamFeedsClient client,
  required MockWebSocketChannel webSocketChannel,
  required T Function(StreamController<Object>) create,
}) async {
  // Create WebSocket components
  final wsStreamController = StreamController<Object>();
  final webSocketSink = MockWebSocketSink();

  // Register automatic cleanup
  test.addTearDown(() async {
    await webSocketSink.close();
    await wsStreamController.close();
  });

  // Setup WebSocket connection
  WsTestConnection(
    wsStreamController: wsStreamController,
    webSocketSink: webSocketSink,
    webSocketChannel: webSocketChannel,
  ).setUp();

  // Connect client
  await client.connect();
  test.addTearDown(client.disconnect); // Disconnect client after test

  return create(wsStreamController);
}

/// Generic test helper for state objects with WebSocket support.
///
/// Automatically sets up WebSocket connection, client, and test infrastructure.
///
/// Parameters:
/// - build: constructs the subject under test using the provided StreamFeedsClient
/// - createTesterFn: the concrete tester factory function
/// - setUp: optional, runs before body for setting up mocks and test state
/// - body: the test callback that receives a tester for interactions
/// - verify: optional, runs after body for verifying API calls
/// - tearDown: optional, runs after verify for custom cleanup
/// - skip: optional, skip this test
/// - tags: optional, tags for test filtering
/// - timeout: optional, custom timeout for this test
///
/// This function is for internal use by concrete test helpers.
void testWithTester<S, T extends BaseTester<S>>(
  String description, {
  required S Function(StreamFeedsClient client) build,
  required TesterFactory<S, T> createTesterFn,
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
        const user = User(id: 'luke_skywalker');
        final userToken = UserToken(testToken);

        final feedsApi = MockDefaultApi();
        final webSocketChannel = MockWebSocketChannel();

        final client = StreamFeedsClient(
          apiKey: 'apiKey',
          user: user,
          tokenProvider: TokenProvider.static(userToken),
          feedsRestApi: feedsApi,
          wsProvider: (options) => webSocketChannel,
        );

        final tester = await createTesterFn(
          subject: build.call(client),
          client: client,
          feedsApi: feedsApi,
          webSocketChannel: webSocketChannel,
        );

        await setUp?.call(tester);
        await body(tester);
        await verify?.call(tester);
        await tearDown?.call(tester);
      });
    },
  );
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

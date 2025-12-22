import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../helpers/mocks.dart';

/// A test utility for managing WebSocket connection mocking and event emission.
///
/// This class encapsulates WebSocket channel mocking, authentication simulation,
/// and event emission for testing real-time features. It provides methods to
/// configure WebSocket behavior for both successful and failed connection scenarios.
///
/// ## Usage
///
/// ```dart
/// final wsTester = WebSocketTester(
///   channel: mockWebSocketChannel,
///   streamController: wsStreamController,
/// );
///
/// // Setup for successful connection
/// wsTester.mockSuccessfulAuth('user-123');
///
/// // Or setup for failed authentication
/// wsTester.mockFailedAuth();
/// ```
///
/// This class is used internally by testers and should not be instantiated directly
/// in test code.
final class WebSocketTester {
  /// Creates a [WebSocketTester] with the given [channel] and [streamController].
  ///
  /// The [channel] is the mock WebSocket channel to configure, and [streamController]
  /// is used to emit events that simulate server responses.
  WebSocketTester({
    required MockWebSocketChannel channel,
    required StreamController<Object> streamController,
  })  : _channel = channel,
        _streamController = streamController;

  // The mock WebSocket channel being configured.
  final MockWebSocketChannel _channel;

  // The stream controller used to emit WebSocket events.
  final StreamController<Object> _streamController;

  // Function to reset previous mock configuration, allowing reconfiguration
  // between test scenarios.
  WebSocketResetFunction? _resetFunction;

  /// Configures WebSocket mocks to simulate successful authentication.
  ///
  /// Sets up the WebSocket channel to respond with a health check event when
  /// authentication is attempted with the specified [userId]. If a different
  /// user ID is provided during authentication, it will simulate a failure.
  ///
  /// Call this before connecting the client in your test setup.
  ///
  /// Example:
  /// ```dart
  /// wsTester.mockSuccessfulAuth('user-123');
  /// await client.connect(); // Will succeed
  /// ```
  void mockSuccessfulAuth(String userId) {
    _resetFunction?.call(); // Reset previous mocks if any
    _resetFunction = _whenListenWebSocket(
      _channel,
      _streamController,
      onConnectionAttempt: (token) {
        if (token.userId != userId) {
          // Wrong user ID - simulate authentication failure (Invalid signature)
          return emitEvent(_createConnectionErrorEvent(43));
        }

        // Correct user ID - simulate successful authentication
        return emitEvent(_createConnectedEvent(userId));
      },
    );
  }

  /// Configures WebSocket mocks to simulate authentication failure.
  ///
  /// Sets up the WebSocket channel to always respond with an error event
  /// when authentication is attempted, regardless of the provided credentials.
  /// The WebSocket stream will be closed after emitting the error event to
  /// simulate the server closing the connection.
  ///
  /// The [errorCode] parameter allows customizing the error code returned.
  /// Default is 40 (expiredToken), which prevents automatic reconnection.
  /// All errors use HTTP status code 401.
  ///
  /// **Backend Error Codes (401 Status):**
  ///
  /// **No Reconnection (Token expired errors 40-42):**
  /// - `40`: expiredToken - Token has expired
  /// - `41`: tokenNotValidYet - Token not yet valid
  /// - `42`: tokenUsedBeforeIAT - Token used before issued
  ///
  /// **Triggers Reconnection:**
  /// - `2`: accessKeyError - Invalid API key
  /// - `5`: authFailed - Authentication failed
  /// - `43`: invalidTokenSignature - Invalid signature
  ///
  /// Call this before connecting the client when testing error scenarios.
  ///
  /// Example:
  /// ```dart
  /// // Test with token expired error (no reconnection)
  /// wsTester.mockFailedAuth();
  ///
  /// // Test with auth failed error (triggers reconnection)
  /// wsTester.mockFailedAuth(errorCode: 5);
  ///
  /// await expectLater(
  ///   client.connect(),
  ///   throwsA(isA<ClientException>()),
  /// );
  /// ```
  void mockFailedAuth({int errorCode = 40}) {
    _resetFunction?.call(); // Reset previous mocks if any
    _resetFunction = _whenListenWebSocket(
      _channel,
      _streamController,
      onConnectionAttempt: (_) {
        // Always emit authentication failure event
        return emitEvent(_createConnectionErrorEvent(errorCode));
      },
    );
  }

  /// Emits a WebSocket event to simulate a server message.
  ///
  /// The [event] should be a JSON-encodable object representing a WebSocket
  /// event. This is typically used to test real-time event handling in state
  /// objects.
  ///
  /// **Note:** You must call [mockSuccessfulAuth] or [mockFailedAuth] before
  /// calling this method.
  ///
  /// Example:
  /// ```dart
  /// wsTester.emitEvent({
  ///   'type': 'activity.added',
  ///   'activity': {...},
  /// });
  /// ```
  void emitEvent(Object event) {
    _streamController.add(jsonEncode(event));
  }
}

// A function type for resetting WebSocket mock configuration.
//
// This allows reconfiguring WebSocket mocks between different test scenarios
// by resetting the previous mock setup.
typedef WebSocketResetFunction = void Function();

// Configures WebSocket channel mocks for testing.
//
// Sets up the [webSocketChannel] to stream events from [wsStreamController]
// and configures authentication handling. When a token is sent through the
// WebSocket sink, the [onConnectionAttempt] callback is invoked to simulate
// server authentication response.
//
// Returns a function that can be called to reset the mock configuration,
// allowing the WebSocket to be reconfigured for different test scenarios.
WebSocketResetFunction _whenListenWebSocket(
  MockWebSocketChannel webSocketChannel,
  StreamController<Object> wsStreamController, {
  void Function(UserToken token)? onConnectionAttempt,
}) {
  final webSocketSink = MockWebSocketSink();
  final webSocketStream = wsStreamController.stream.asBroadcastStream();

  // Mock sink close operation
  when(
    () => webSocketSink.close(any(), any()),
  ).thenAnswer((_) => Future<void>.value());

  // Mock channel ready state
  when(
    () => webSocketChannel.ready,
  ).thenAnswer((_) => Future<void>.value());

  // Mock channel stream to use our test stream controller
  when(
    () => webSocketChannel.stream,
  ).thenAnswer((_) => webSocketStream);

  // Mock channel sink to use our test sink
  when(
    () => webSocketChannel.sink,
  ).thenAnswer((_) => webSocketSink);

  // Handle authentication: when a token is sent, invoke the callback
  when(
    () => webSocketSink.add(any<Object>()),
  ).thenAnswer((invocation) {
    final event = jsonDecode(
      invocation.positionalArguments.first as String,
    ) as Map<String, dynamic>;

    // Extract token from authentication message
    if (event['token'] case final String token) {
      final userToken = UserToken(token);
      return onConnectionAttempt?.call(userToken);
    }
  });

  // Return reset function to clear this mock configuration
  return () => reset(webSocketSink);
}

// Creates a connected event for successful WebSocket authentication.
//
// This event simulates a successful server response during the authentication
// handshake. The connected event signals that the connection is established
// and ready to receive real-time updates.
Map<String, Object?> _createConnectedEvent(String userId) {
  final now = DateTime.timestamp().millisecondsSinceEpoch;
  return <String, Object?>{
    'type': 'connection.ok',
    'connection_id': 'test-connection-id',
    'created_at': now,
    'me': <String, Object?>{
      'id': userId,
      'banned': false,
      'channel_mutes': <Map<String, Object?>>[],
      'created_at': now,
      'updated_at': now,
      'custom': <String, Object?>{},
      'devices': <Map<String, Object?>>[],
      'invisible': false,
      'language': 'en',
      'mutes': <Map<String, Object?>>[],
      'online': true,
      'role': 'user',
      'teams': <String>[],
      'total_unread_count': 0,
      'unread_channels': 0,
      'unread_count': 0,
      'unread_threads': 0,
    },
  };
}

// Creates a connection error event for failed WebSocket authentication.
//
// This event simulates an authentication failure response from the server.
// The error contains details about why the authentication failed. All errors
// use HTTP status code 401.
//
// The [errorCode] parameter determines the specific error code returned,
// which controls the automatic reconnection behavior:
// - Error codes 40-42 prevent automatic reconnection (token expired errors)
// - Other error codes (2, 5, 43) trigger automatic reconnection
//
// See [mockFailedAuth] for the complete list of backend error codes and
// their reconnection behavior.
Map<String, Object?> _createConnectionErrorEvent(int errorCode) {
  return <String, Object?>{
    'type': 'connection.error',
    'connection_id': 'test-connection-id',
    'created_at': DateTime.timestamp().millisecondsSinceEpoch,
    'error': <String, Object?>{
      'code': errorCode,
      'message': 'Authentication failed',
      'StatusCode': 401,
      'details': <int>[],
      'duration': '0ms',
      'more_info': 'https://getstream.io/feeds/docs/',
    },
  };
}

import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/ws/events/events.dart';

import 'mocks.dart';

/// Sets up WebSocket channel mocks for testing.
///
/// Configures [webSocketChannel] to use [wsStreamController] for its stream
/// when the channel's stream is listened to. Also creates a mock sink for
/// sending messages and handles authentication by automatically responding
/// with a health check event when a token is sent.
///
/// Example:
/// ```dart
/// final wsStreamController = StreamController<Object>();
/// whenListenWebSocket(webSocketChannel, wsStreamController);
/// ```
void whenListenWebSocket(
  MockWebSocketChannel webSocketChannel,
  StreamController<Object> wsStreamController,
) {
  final webSocketSink = MockWebSocketSink();
  final webSocketStream = wsStreamController.stream.asBroadcastStream();

  when(
    webSocketSink.close,
  ).thenAnswer((_) => Future<void>.value());

  when(
    () => webSocketChannel.ready,
  ).thenAnswer((_) => Future<void>.value());

  when(
    () => webSocketChannel.stream,
  ).thenAnswer((_) => webSocketStream);

  when(
    () => webSocketChannel.sink,
  ).thenAnswer((_) => webSocketSink);

  // Handle authentication: when a token is sent, respond with health check
  when(
    () => webSocketSink.add(any<Object>()),
  ).thenAnswer((invocation) {
    final event = jsonDecode(
      invocation.positionalArguments.first as String,
    ) as Map<String, dynamic>;

    if (event['token'] != null) {
      return wsStreamController.add(
        jsonEncode(
          HealthCheckEvent(
            connectionId: 'connectionId',
            createdAt: DateTime.now(),
            custom: const {},
            type: 'health.check',
          ),
        ),
      );
    }
  });
}

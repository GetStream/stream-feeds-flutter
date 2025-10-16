import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/ws/events/events.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'mocks.dart';

class WsTestConnection {
  WsTestConnection({
    required this.wsStreamController,
    required this.webSocketSink,
    required this.webSocketChannel,
  });

  StreamController<Object> wsStreamController;
  MockWebSocketSink webSocketSink;
  MockWebSocketChannel webSocketChannel;

  void setUp() {
    final wsAuthenticationHelper = WsAuthenticationHelper(
      wsStreamController: wsStreamController,
    );

    when(() => webSocketSink.add(any<Object>())).thenAnswer(
      wsAuthenticationHelper.handleAuthentication,
    );

    when(() => webSocketSink.close()).thenAnswer(
      (_) => Future.value(),
    );

    when(() => webSocketChannel.ready).thenAnswer(
      (_) => Future.value(),
    );
    when(() => webSocketChannel.stream).thenAnswer(
      (_) => wsStreamController.stream,
    );

    when(() => webSocketChannel.sink).thenAnswer(
      (_) => webSocketSink,
    );
  }
}

class WsAuthenticationHelper {
  WsAuthenticationHelper({
    required this.wsStreamController,
  });

  StreamController<Object> wsStreamController;

  /// Returns true if the event is a [WsAuthMessageRequest].
  /// If it is, it will add a [HealthCheckEvent] to the stream.
  bool handleAuthentication(Invocation invocation) {
    final Map<String, dynamic> event =
        jsonDecode(invocation.positionalArguments.first as String);

    if (event['token'] != null) {
      wsStreamController.add(
        jsonEncode(
          HealthCheckEvent(
            connectionId: 'connectionId',
            createdAt: DateTime.now(),
            custom: const {},
            type: 'health.check',
          ).toJson(),
        ),
      );
      return true;
    }

    return false;
  }
}

import 'dart:convert';

import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import 'events/events.dart';

class FeedsWsCodec implements WebSocketMessageCodec<WsEvent, WsRequest> {
  const FeedsWsCodec();

  @override
  Object encode(WsRequest message) {
    final jsonData = message.toJson();
    return json.encode(jsonData);
  }

  @override
  WsEvent decode(Object message) {
    final jsonData = json.decode(message.toString()) as Map<String, Object?>;
    final event = api.WSEvent.fromJson(jsonData).wrapped;

    // Handle unknown events by mapping them to known event types if possible
    if (event is api.UnknownWSEvent) return _parseUnknownEvent(event);

    return event;
  }

  WsEvent _parseUnknownEvent(api.UnknownWSEvent unknownEvent) {
    return switch (unknownEvent.type) {
      'health.check' => HealthCheckEvent.fromJson(unknownEvent.rawJson),
      'connection.ok' => ConnectedEvent.fromJson(unknownEvent.rawJson),
      'connection.error' => ConnectionErrorEvent.fromJson(unknownEvent.rawJson),
      _ => unknownEvent,
    };
  }
}

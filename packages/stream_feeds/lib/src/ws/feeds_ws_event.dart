import 'dart:convert';

import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import 'events/events.dart';

abstract class FeedsWsEvent {
  const FeedsWsEvent._();

  static WsEvent? fromEventObject(Object message) {
    try {
      final jsonData = json.decode(message.toString()) as Map<String, Object?>;
      final event = api.WSEvent.fromJson(jsonData).wrapped;

      if (event is api.UnknownWSEvent) {
        return _parseUnknownEvent(event);
      }

      return event;
    } catch (e, stk) {
      return null;
    }
  }
}

WsEvent _parseUnknownEvent(api.UnknownWSEvent unknownEvent) {
  return switch (unknownEvent.type) {
    'connection.ok' => ConnectedEvent.fromJson(unknownEvent.rawJson),
    'connection.error' => ConnectionErrorEvent.fromJson(unknownEvent.rawJson),
    _ => unknownEvent,
  };
}

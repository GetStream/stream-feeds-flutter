// ignore_for_file: prefer_single_quotes

import 'dart:convert';

import 'package:stream_core/stream_core.dart' as core;

import '../generated/api/api.g.dart' as api;

class FeedsWsEvent extends core.WsEvent {
  const FeedsWsEvent(this.event);

  final api.WSClientEvent? event;

  static core.WsEvent fromEventObject(Object message) {
    try {
      final json = jsonDecode(message.toString()) as Map<String, dynamic>;
      final type = json['type'];
      switch (type) {
        case "connection.ok":
          return core.HealthCheckPongEvent(
            healthCheckInfo: core.HealthCheckInfo(
              connectionId: json['connection_id'],
            ),
          );
        case 'connection.error':
          return core.WsErrorEvent(error: json['error'], message: message);
        default:
          final event = api.WSClientEvent.fromJson(json);

          if (event is api.WSClientEventHealthCheckEvent) {
            return core.HealthCheckPongEvent(
              healthCheckInfo: core.HealthCheckInfo(
                connectionId: event.healthCheckEvent.connectionId,
              ),
            );
          }
          print(type);
          return FeedsWsEvent(event);
      }
    } catch (e) {
      return core.WsErrorEvent(error: e, message: message);
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart' as core;

import '../../generated/api/models.dart' as api;

part 'events.freezed.dart';
part 'events.g.dart';

@freezed
@JsonSerializable()
class ConnectedEvent extends core.WsEvent with _$ConnectedEvent {
  const ConnectedEvent({
    required this.connectionId,
    required this.me,
  });

  @override
  final String connectionId;

  @override
  final api.OwnUserResponse me;

  Map<String, dynamic> toJson() => _$ConnectedEventToJson(this);

  static ConnectedEvent fromJson(Map<String, dynamic> json) =>
      _$ConnectedEventFromJson(json);
}

@freezed
@JsonSerializable()
class ConnectionErrorEvent extends core.WsEvent with _$ConnectionErrorEvent {
  const ConnectionErrorEvent({
    required this.connectionId,
    required this.createdAt,
    required this.error,
    required this.type,
  });

  @override
  final String connectionId;

  @override
  final DateTime createdAt;

  @override
  final api.StreamApiError error;

  @override
  final String type;

  Map<String, dynamic> toJson() => _$ConnectionErrorEventToJson(this);

  static ConnectionErrorEvent fromJson(Map<String, dynamic> json) =>
      _$ConnectionErrorEventFromJson(json);
}

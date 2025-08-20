// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectedEvent _$ConnectedEventFromJson(Map<String, dynamic> json) =>
    ConnectedEvent(
      connectionId: json['connection_id'] as String,
      me: OwnUserResponse.fromJson(json['me'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectedEventToJson(ConnectedEvent instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'me': instance.me.toJson(),
    };

ConnectionErrorEvent _$ConnectionErrorEventFromJson(
        Map<String, dynamic> json) =>
    ConnectionErrorEvent(
      connectionId: json['connection_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      error: StreamApiError.fromJson(json['error'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$ConnectionErrorEventToJson(
        ConnectionErrorEvent instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'created_at': instance.createdAt.toIso8601String(),
      'error': instance.error.toJson(),
      'type': instance.type,
    };

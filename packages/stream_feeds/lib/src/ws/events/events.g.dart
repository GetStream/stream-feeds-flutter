// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthCheckEvent _$HealthCheckEventFromJson(Map<String, dynamic> json) =>
    HealthCheckEvent(
      cid: json['cid'] as String?,
      connectionId: json['connection_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      me: json['me'] == null
          ? null
          : OwnUserResponse.fromJson(json['me'] as Map<String, dynamic>),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String? ?? 'health.check',
    );

Map<String, dynamic> _$HealthCheckEventToJson(HealthCheckEvent instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'connection_id': instance.connectionId,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'me': instance.me?.toJson(),
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ConnectedEvent _$ConnectedEventFromJson(Map<String, dynamic> json) =>
    ConnectedEvent(
      connectionId: json['connection_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      me: OwnUserResponse.fromJson(json['me'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'connection.ok',
    );

ConnectionErrorEvent _$ConnectionErrorEventFromJson(
        Map<String, dynamic> json) =>
    ConnectionErrorEvent(
      connectionId: json['connection_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      error: StreamApiError.fromJson(json['error'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'connection.error',
    );

Map<String, dynamic> _$ConnectionErrorEventToJson(
        ConnectionErrorEvent instance) =>
    <String, dynamic>{
      'connection_id': instance.connectionId,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'error': instance.error.toJson(),
      'type': instance.type,
    };

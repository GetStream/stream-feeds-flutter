// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_check_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthCheckEvent _$HealthCheckEventFromJson(Map<String, dynamic> json) =>
    HealthCheckEvent(
      cid: json['cid'] as String?,
      connectionId: json['connection_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      me: json['me'] == null
          ? null
          : OwnUserResponse.fromJson(json['me'] as Map<String, dynamic>),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
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

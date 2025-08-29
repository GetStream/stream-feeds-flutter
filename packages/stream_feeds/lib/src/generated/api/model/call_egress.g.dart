// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_egress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallEgress _$CallEgressFromJson(Map<String, dynamic> json) => CallEgress(
      appPk: (json['app_pk'] as num).toInt(),
      callId: json['call_id'] as String,
      callType: json['call_type'] as String,
      config: json['config'] == null
          ? null
          : EgressTaskConfig.fromJson(json['config'] as Map<String, dynamic>),
      egressId: json['egress_id'] as String,
      egressType: json['egress_type'] as String,
      instanceIp: json['instance_ip'] as String,
      startedAt: const EpochDateTimeConverter()
          .fromJson((json['started_at'] as num).toInt()),
      state: json['state'] as String,
      stoppedAt: _$JsonConverterFromJson<int, DateTime>(
          json['stopped_at'], const EpochDateTimeConverter().fromJson),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$CallEgressToJson(CallEgress instance) =>
    <String, dynamic>{
      'app_pk': instance.appPk,
      'call_id': instance.callId,
      'call_type': instance.callType,
      'config': instance.config?.toJson(),
      'egress_id': instance.egressId,
      'egress_type': instance.egressType,
      'instance_ip': instance.instanceIp,
      'started_at': const EpochDateTimeConverter().toJson(instance.startedAt),
      'state': instance.state,
      'stopped_at': _$JsonConverterToJson<int, DateTime>(
          instance.stoppedAt, const EpochDateTimeConverter().toJson),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
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

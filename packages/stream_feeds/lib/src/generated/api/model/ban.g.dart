// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ban _$BanFromJson(Map<String, dynamic> json) => Ban(
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      expires: _$JsonConverterFromJson<int, DateTime>(
          json['expires'], const EpochDateTimeConverter().fromJson),
      reason: json['reason'] as String?,
      shadow: json['shadow'] as bool,
      target: json['target'] == null
          ? null
          : User.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BanToJson(Ban instance) => <String, dynamic>{
      'channel': instance.channel?.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy?.toJson(),
      'expires': _$JsonConverterToJson<int, DateTime>(
          instance.expires, const EpochDateTimeConverter().toJson),
      'reason': instance.reason,
      'shadow': instance.shadow,
      'target': instance.target?.toJson(),
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

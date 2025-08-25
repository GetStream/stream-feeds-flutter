// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMute _$UserMuteFromJson(Map<String, dynamic> json) => UserMute(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      expires: _$JsonConverterFromJson<int, DateTime>(
          json['expires'], const EpochDateTimeConverter().fromJson),
      target: json['target'] == null
          ? null
          : User.fromJson(json['target'] as Map<String, dynamic>),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMuteToJson(UserMute instance) => <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'expires': _$JsonConverterToJson<int, DateTime>(
          instance.expires, const EpochDateTimeConverter().toJson),
      'target': instance.target?.toJson(),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
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

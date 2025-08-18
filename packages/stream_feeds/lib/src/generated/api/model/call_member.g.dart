// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallMember _$CallMemberFromJson(Map<String, dynamic> json) => CallMember(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      role: json['role'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$CallMemberToJson(CallMember instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'role': instance.role,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
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

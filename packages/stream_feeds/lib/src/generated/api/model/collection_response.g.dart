// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponse _$CollectionResponseFromJson(Map<String, dynamic> json) =>
    CollectionResponse(
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['created_at'], const EpochDateTimeConverter().fromJson),
      custom: json['custom'] as Map<String, dynamic>?,
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['updated_at'], const EpochDateTimeConverter().fromJson),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$CollectionResponseToJson(CollectionResponse instance) =>
    <String, dynamic>{
      'created_at': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const EpochDateTimeConverter().toJson),
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
      'updated_at': _$JsonConverterToJson<int, DateTime>(
          instance.updatedAt, const EpochDateTimeConverter().toJson),
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

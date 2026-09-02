// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponse _$CollectionResponseFromJson(Map<String, dynamic> json) => CollectionResponse(
  createdAt: _$JsonConverterFromJson<Object, DateTime>(
    json['created_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  custom: json['custom'] as Map<String, dynamic>?,
  id: json['id'] as String,
  name: json['name'] as String,
  updatedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['updated_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$CollectionResponseToJson(CollectionResponse instance) => <String, dynamic>{
  'created_at': _$JsonConverterToJson<Object, DateTime>(
    instance.createdAt,
    const StreamDateTimeConverter().toJson,
  ),
  'custom': instance.custom,
  'id': instance.id,
  'name': instance.name,
  'updated_at': _$JsonConverterToJson<Object, DateTime>(
    instance.updatedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'user_id': instance.userId,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

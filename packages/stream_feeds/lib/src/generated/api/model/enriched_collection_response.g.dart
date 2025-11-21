// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enriched_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrichedCollectionResponse _$EnrichedCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    EnrichedCollectionResponse(
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['created_at'], const EpochDateTimeConverter().fromJson),
      custom: json['custom'] as Map<String, dynamic>?,
      id: json['id'] as String,
      name: json['name'] as String,
      status: $enumDecode(
          _$EnrichedCollectionResponseStatusEnumMap, json['status'],
          unknownValue: EnrichedCollectionResponseStatus.unknown),
      updatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['updated_at'], const EpochDateTimeConverter().fromJson),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$EnrichedCollectionResponseToJson(
        EnrichedCollectionResponse instance) =>
    <String, dynamic>{
      'created_at': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const EpochDateTimeConverter().toJson),
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
      'status': _$EnrichedCollectionResponseStatusEnumMap[instance.status]!,
      'updated_at': _$JsonConverterToJson<int, DateTime>(
          instance.updatedAt, const EpochDateTimeConverter().toJson),
      'user_id': instance.userId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$EnrichedCollectionResponseStatusEnumMap = {
  EnrichedCollectionResponseStatus.notfound: 'notfound',
  EnrichedCollectionResponseStatus.ok: 'ok',
  EnrichedCollectionResponseStatus.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

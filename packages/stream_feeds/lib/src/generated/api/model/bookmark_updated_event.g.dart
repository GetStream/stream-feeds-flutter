// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_updated_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkUpdatedEvent _$BookmarkUpdatedEventFromJson(
  Map<String, dynamic> json,
) => BookmarkUpdatedEvent(
  bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  custom: json['custom'] as Map<String, dynamic>,
  receivedAt: _$JsonConverterFromJson<Object, DateTime>(
    json['received_at'],
    const StreamDateTimeConverter().fromJson,
  ),
  type: json['type'] as String,
  user: json['user'] == null ? null : UserResponseCommonFields.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookmarkUpdatedEventToJson(
  BookmarkUpdatedEvent instance,
) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'custom': instance.custom,
  'received_at': _$JsonConverterToJson<Object, DateTime>(
    instance.receivedAt,
    const StreamDateTimeConverter().toJson,
  ),
  'type': instance.type,
  'user': instance.user?.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

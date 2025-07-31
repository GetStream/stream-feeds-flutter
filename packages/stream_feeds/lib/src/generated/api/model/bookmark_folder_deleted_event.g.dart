// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_folder_deleted_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkFolderDeletedEvent _$BookmarkFolderDeletedEventFromJson(
        Map<String, dynamic> json) =>
    BookmarkFolderDeletedEvent(
      bookmarkFolder: BookmarkFolderResponse.fromJson(
          json['bookmark_folder'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkFolderDeletedEventToJson(
        BookmarkFolderDeletedEvent instance) =>
    <String, dynamic>{
      'bookmark_folder': instance.bookmarkFolder.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
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

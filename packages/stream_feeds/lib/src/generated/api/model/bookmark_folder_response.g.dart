// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_folder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkFolderResponse _$BookmarkFolderResponseFromJson(
        Map<String, dynamic> json) =>
    BookmarkFolderResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$BookmarkFolderResponseToJson(
        BookmarkFolderResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };

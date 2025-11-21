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
      custom: json['custom'] as Map<String, dynamic>?,
      id: json['id'] as String,
      name: json['name'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkFolderResponseToJson(
        BookmarkFolderResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
    };

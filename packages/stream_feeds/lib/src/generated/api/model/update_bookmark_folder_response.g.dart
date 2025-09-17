// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bookmark_folder_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookmarkFolderResponse _$UpdateBookmarkFolderResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateBookmarkFolderResponse(
      bookmarkFolder: BookmarkFolderResponse.fromJson(
          json['bookmark_folder'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateBookmarkFolderResponseToJson(
        UpdateBookmarkFolderResponse instance) =>
    <String, dynamic>{
      'bookmark_folder': instance.bookmarkFolder.toJson(),
      'duration': instance.duration,
    };

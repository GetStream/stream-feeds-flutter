// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_bookmark_folders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryBookmarkFoldersResponse _$QueryBookmarkFoldersResponseFromJson(
        Map<String, dynamic> json) =>
    QueryBookmarkFoldersResponse(
      bookmarkFolders: (json['bookmark_folders'] as List<dynamic>)
          .map(
              (e) => BookmarkFolderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryBookmarkFoldersResponseToJson(
        QueryBookmarkFoldersResponse instance) =>
    <String, dynamic>{
      'bookmark_folders':
          instance.bookmarkFolders.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };

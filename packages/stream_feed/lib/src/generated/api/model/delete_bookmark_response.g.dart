// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteBookmarkResponse _$DeleteBookmarkResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteBookmarkResponse(
      bookmark:
          BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$DeleteBookmarkResponseToJson(
        DeleteBookmarkResponse instance) =>
    <String, dynamic>{
      'bookmark': instance.bookmark.toJson(),
      'duration': instance.duration,
    };

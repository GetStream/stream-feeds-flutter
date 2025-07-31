// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBookmarkResponse _$AddBookmarkResponseFromJson(Map<String, dynamic> json) =>
    AddBookmarkResponse(
      bookmark:
          BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$AddBookmarkResponseToJson(
        AddBookmarkResponse instance) =>
    <String, dynamic>{
      'bookmark': instance.bookmark.toJson(),
      'duration': instance.duration,
    };

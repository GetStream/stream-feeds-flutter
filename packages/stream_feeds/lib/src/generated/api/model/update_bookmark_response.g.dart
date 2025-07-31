// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBookmarkResponse _$UpdateBookmarkResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateBookmarkResponse(
      bookmark:
          BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateBookmarkResponseToJson(
        UpdateBookmarkResponse instance) =>
    <String, dynamic>{
      'bookmark': instance.bookmark.toJson(),
      'duration': instance.duration,
    };

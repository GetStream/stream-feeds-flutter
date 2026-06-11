// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentBookmarkResponse _$DeleteCommentBookmarkResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentBookmarkResponse(
      bookmark:
          BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$DeleteCommentBookmarkResponseToJson(
        DeleteCommentBookmarkResponse instance) =>
    <String, dynamic>{
      'bookmark': instance.bookmark.toJson(),
      'duration': instance.duration,
    };

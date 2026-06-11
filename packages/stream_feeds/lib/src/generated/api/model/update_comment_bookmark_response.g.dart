// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentBookmarkResponse _$UpdateCommentBookmarkResponseFromJson(Map<String, dynamic> json) =>
    UpdateCommentBookmarkResponse(
      bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateCommentBookmarkResponseToJson(UpdateCommentBookmarkResponse instance) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'duration': instance.duration,
};

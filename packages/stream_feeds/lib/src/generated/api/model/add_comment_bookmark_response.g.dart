// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_bookmark_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentBookmarkResponse _$AddCommentBookmarkResponseFromJson(
  Map<String, dynamic> json,
) => AddCommentBookmarkResponse(
  bookmark: BookmarkResponse.fromJson(json['bookmark'] as Map<String, dynamic>),
  duration: json['duration'] as String,
);

Map<String, dynamic> _$AddCommentBookmarkResponseToJson(
  AddCommentBookmarkResponse instance,
) => <String, dynamic>{
  'bookmark': instance.bookmark.toJson(),
  'duration': instance.duration,
};

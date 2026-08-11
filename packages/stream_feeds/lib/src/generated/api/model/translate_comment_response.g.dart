// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateCommentResponse _$TranslateCommentResponseFromJson(
  Map<String, dynamic> json,
) => TranslateCommentResponse(
  comment: CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
  duration: json['duration'] as String,
);

Map<String, dynamic> _$TranslateCommentResponseToJson(
  TranslateCommentResponse instance,
) => <String, dynamic>{
  'comment': instance.comment.toJson(),
  'duration': instance.duration,
};

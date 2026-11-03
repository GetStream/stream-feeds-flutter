// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentFeedbackResponse _$CommentFeedbackResponseFromJson(
  Map<String, dynamic> json,
) => CommentFeedbackResponse(
  commentId: json['comment_id'] as String,
  duration: json['duration'] as String,
  hide: json['hide'] as bool,
);

Map<String, dynamic> _$CommentFeedbackResponseToJson(
  CommentFeedbackResponse instance,
) => <String, dynamic>{
  'comment_id': instance.commentId,
  'duration': instance.duration,
  'hide': instance.hide,
};

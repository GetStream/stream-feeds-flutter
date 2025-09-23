// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCommentResponse _$DeleteCommentResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteCommentResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$DeleteCommentResponseToJson(
        DeleteCommentResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
    };

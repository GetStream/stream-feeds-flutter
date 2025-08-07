// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentResponse _$UpdateCommentResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCommentResponse(
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateCommentResponseToJson(
        UpdateCommentResponse instance) =>
    <String, dynamic>{
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
    };

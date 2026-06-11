// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment_partial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCommentPartialResponse _$UpdateCommentPartialResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCommentPartialResponse(
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateCommentPartialResponseToJson(
        UpdateCommentPartialResponse instance) =>
    <String, dynamic>{
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentResponse _$GetCommentResponseFromJson(Map<String, dynamic> json) =>
    GetCommentResponse(
      comment:
          CommentResponse.fromJson(json['comment'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$GetCommentResponseToJson(GetCommentResponse instance) =>
    <String, dynamic>{
      'comment': instance.comment.toJson(),
      'duration': instance.duration,
    };

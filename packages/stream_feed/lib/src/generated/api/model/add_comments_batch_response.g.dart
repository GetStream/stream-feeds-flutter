// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comments_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentsBatchResponse _$AddCommentsBatchResponseFromJson(
        Map<String, dynamic> json) =>
    AddCommentsBatchResponse(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$AddCommentsBatchResponseToJson(
        AddCommentsBatchResponse instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
    };

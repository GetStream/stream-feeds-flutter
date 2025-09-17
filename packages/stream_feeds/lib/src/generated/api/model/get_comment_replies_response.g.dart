// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_replies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentRepliesResponse _$GetCommentRepliesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCommentRepliesResponse(
      comments: (json['comments'] as List<dynamic>)
          .map((e) =>
              ThreadedCommentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$GetCommentRepliesResponseToJson(
        GetCommentRepliesResponse instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommentsResponse _$QueryCommentsResponseFromJson(
        Map<String, dynamic> json) =>
    QueryCommentsResponse(
      comments: (json['comments'] as List<dynamic>)
          .map((e) => CommentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryCommentsResponseToJson(
        QueryCommentsResponse instance) =>
    <String, dynamic>{
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCommentsResponse _$GetCommentsResponseFromJson(Map<String, dynamic> json) => GetCommentsResponse(
  commentCount: (json['comment_count'] as num).toInt(),
  comments: (json['comments'] as List<dynamic>)
      .map(
        (e) => ThreadedCommentResponse.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  duration: json['duration'] as String,
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: json['sort'] as String,
  topLevelCommentCount: (json['top_level_comment_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetCommentsResponseToJson(
  GetCommentsResponse instance,
) => <String, dynamic>{
  'comment_count': instance.commentCount,
  'comments': instance.comments.map((e) => e.toJson()).toList(),
  'duration': instance.duration,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort,
  'top_level_comment_count': instance.topLevelCommentCount,
};

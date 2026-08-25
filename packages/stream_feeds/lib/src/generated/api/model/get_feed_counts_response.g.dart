// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_feed_counts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFeedCountsResponse _$GetFeedCountsResponseFromJson(
  Map<String, dynamic> json,
) => GetFeedCountsResponse(
  activityCount: (json['activity_count'] as num).toInt(),
  commentCount: (json['comment_count'] as num).toInt(),
  duration: json['duration'] as String,
  totalCount: (json['total_count'] as num).toInt(),
);

Map<String, dynamic> _$GetFeedCountsResponseToJson(
  GetFeedCountsResponse instance,
) => <String, dynamic>{
  'activity_count': instance.activityCount,
  'comment_count': instance.commentCount,
  'duration': instance.duration,
  'total_count': instance.totalCount,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregated_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregatedActivityResponse _$AggregatedActivityResponseFromJson(
  Map<String, dynamic> json,
) => AggregatedActivityResponse(
  activities: (json['activities'] as List<dynamic>)
      .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  activityCount: (json['activity_count'] as num).toInt(),
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  group: json['group'] as String,
  isRead: json['is_read'] as bool?,
  isSeen: json['is_seen'] as bool?,
  isWatched: json['is_watched'] as bool?,
  score: (json['score'] as num).toDouble(),
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
  userCount: (json['user_count'] as num).toInt(),
  userCountTruncated: json['user_count_truncated'] as bool,
);

Map<String, dynamic> _$AggregatedActivityResponseToJson(
  AggregatedActivityResponse instance,
) => <String, dynamic>{
  'activities': instance.activities.map((e) => e.toJson()).toList(),
  'activity_count': instance.activityCount,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'group': instance.group,
  'is_read': instance.isRead,
  'is_seen': instance.isSeen,
  'is_watched': instance.isWatched,
  'score': instance.score,
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
  'user_count': instance.userCount,
  'user_count_truncated': instance.userCountTruncated,
};

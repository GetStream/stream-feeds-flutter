// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregated_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregatedActivityResponse _$AggregatedActivityResponseFromJson(
        Map<String, dynamic> json) =>
    AggregatedActivityResponse(
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityCount: (json['activity_count'] as num).toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      group: json['group'] as String,
      score: json['score'] as num,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      userCount: (json['user_count'] as num).toInt(),
    );

Map<String, dynamic> _$AggregatedActivityResponseToJson(
        AggregatedActivityResponse instance) =>
    <String, dynamic>{
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'activity_count': instance.activityCount,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'group': instance.group,
      'score': instance.score,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user_count': instance.userCount,
    };

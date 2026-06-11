// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertActivitiesResponse _$UpsertActivitiesResponseFromJson(
  Map<String, dynamic> json,
) => UpsertActivitiesResponse(
  activities: (json['activities'] as List<dynamic>)
      .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  duration: json['duration'] as String,
  mentionNotificationsCreated: (json['mention_notifications_created'] as num?)?.toInt(),
);

Map<String, dynamic> _$UpsertActivitiesResponseToJson(
  UpsertActivitiesResponse instance,
) => <String, dynamic>{
  'activities': instance.activities.map((e) => e.toJson()).toList(),
  'duration': instance.duration,
  'mention_notifications_created': instance.mentionNotificationsCreated,
};

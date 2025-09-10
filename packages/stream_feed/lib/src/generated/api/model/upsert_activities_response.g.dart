// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertActivitiesResponse _$UpsertActivitiesResponseFromJson(
        Map<String, dynamic> json) =>
    UpsertActivitiesResponse(
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpsertActivitiesResponseToJson(
        UpsertActivitiesResponse instance) =>
    <String, dynamic>{
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
    };

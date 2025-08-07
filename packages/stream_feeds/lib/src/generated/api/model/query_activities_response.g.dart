// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryActivitiesResponse _$QueryActivitiesResponseFromJson(
        Map<String, dynamic> json) =>
    QueryActivitiesResponse(
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryActivitiesResponseToJson(
        QueryActivitiesResponse instance) =>
    <String, dynamic>{
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };

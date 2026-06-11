// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_pinned_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPinnedActivitiesResponse _$QueryPinnedActivitiesResponseFromJson(Map<String, dynamic> json) =>
    QueryPinnedActivitiesResponse(
      duration: json['duration'] as String,
      next: json['next'] as String?,
      pinnedActivities: (json['pinned_activities'] as List<dynamic>)
          .map((e) => ActivityPinResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryPinnedActivitiesResponseToJson(QueryPinnedActivitiesResponse instance) => <String, dynamic>{
  'duration': instance.duration,
  'next': instance.next,
  'pinned_activities': instance.pinnedActivities.map((e) => e.toJson()).toList(),
  'prev': instance.prev,
};

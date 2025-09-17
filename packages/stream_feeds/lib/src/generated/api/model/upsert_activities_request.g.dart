// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpsertActivitiesRequest _$UpsertActivitiesRequestFromJson(
        Map<String, dynamic> json) =>
    UpsertActivitiesRequest(
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpsertActivitiesRequestToJson(
        UpsertActivitiesRequest instance) =>
    <String, dynamic>{
      'activities': instance.activities.map((e) => e.toJson()).toList(),
    };

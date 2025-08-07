// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivitiesResponse _$DeleteActivitiesResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteActivitiesResponse(
      deletedActivityIds: (json['deleted_activity_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$DeleteActivitiesResponseToJson(
        DeleteActivitiesResponse instance) =>
    <String, dynamic>{
      'deleted_activity_ids': instance.deletedActivityIds,
      'duration': instance.duration,
    };

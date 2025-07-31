// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivitiesRequest _$DeleteActivitiesRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteActivitiesRequest(
      activityIds: (json['activity_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hardDelete: json['hard_delete'] as bool?,
    );

Map<String, dynamic> _$DeleteActivitiesRequestToJson(
        DeleteActivitiesRequest instance) =>
    <String, dynamic>{
      'activity_ids': instance.activityIds,
      'hard_delete': instance.hardDelete,
    };

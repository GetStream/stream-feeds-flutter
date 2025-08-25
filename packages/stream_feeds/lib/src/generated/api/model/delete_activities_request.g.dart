// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivitiesRequest _$DeleteActivitiesRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteActivitiesRequest(
      hardDelete: json['hard_delete'] as bool?,
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DeleteActivitiesRequestToJson(
        DeleteActivitiesRequest instance) =>
    <String, dynamic>{
      'hard_delete': instance.hardDelete,
      'ids': instance.ids,
    };

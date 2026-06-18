// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteActivitiesRequest _$DeleteActivitiesRequestFromJson(
  Map<String, dynamic> json,
) => DeleteActivitiesRequest(
  deleteNotificationActivity: json['delete_notification_activity'] as bool?,
  hardDelete: json['hard_delete'] as bool?,
  ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
);

Map<String, dynamic> _$DeleteActivitiesRequestToJson(
  DeleteActivitiesRequest instance,
) => <String, dynamic>{
  'delete_notification_activity': instance.deleteNotificationActivity,
  'hard_delete': instance.hardDelete,
  'ids': instance.ids,
};

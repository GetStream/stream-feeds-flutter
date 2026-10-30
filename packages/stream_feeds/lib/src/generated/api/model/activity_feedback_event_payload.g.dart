// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_event_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackEventPayload _$ActivityFeedbackEventPayloadFromJson(
  Map<String, dynamic> json,
) => ActivityFeedbackEventPayload(
  action: json['action'] as ActivityFeedbackEventPayloadAction,
  activityId: json['activity_id'] as String,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  updatedAt: const StreamDateTimeConverter().fromJson(
    json['updated_at'] as Object,
  ),
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
  value: json['value'] as String,
);

Map<String, dynamic> _$ActivityFeedbackEventPayloadToJson(
  ActivityFeedbackEventPayload instance,
) => <String, dynamic>{
  'action': instance.action,
  'activity_id': instance.activityId,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'updated_at': const StreamDateTimeConverter().toJson(instance.updatedAt),
  'user': instance.user.toJson(),
  'value': instance.value,
};

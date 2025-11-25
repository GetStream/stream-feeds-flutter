// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_event_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackEventPayload _$ActivityFeedbackEventPayloadFromJson(
        Map<String, dynamic> json) =>
    ActivityFeedbackEventPayload(
      action: $enumDecode(
          _$ActivityFeedbackEventPayloadActionEnumMap, json['action'],
          unknownValue: ActivityFeedbackEventPayloadAction.unknown),
      activityId: json['activity_id'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      value: json['value'] as String,
    );

Map<String, dynamic> _$ActivityFeedbackEventPayloadToJson(
        ActivityFeedbackEventPayload instance) =>
    <String, dynamic>{
      'action': _$ActivityFeedbackEventPayloadActionEnumMap[instance.action]!,
      'activity_id': instance.activityId,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user.toJson(),
      'value': instance.value,
    };

const _$ActivityFeedbackEventPayloadActionEnumMap = {
  ActivityFeedbackEventPayloadAction.hide: 'hide',
  ActivityFeedbackEventPayloadAction.showLess: 'show_less',
  ActivityFeedbackEventPayloadAction.showMore: 'show_more',
  ActivityFeedbackEventPayloadAction.unknown: '_unknown',
};

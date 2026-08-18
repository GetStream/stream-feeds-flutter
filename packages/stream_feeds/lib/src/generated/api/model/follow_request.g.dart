// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) => FollowRequest(
  activityCopyLimit: (json['activity_copy_limit'] as num?)?.toInt(),
  copyCustomToNotification: json['copy_custom_to_notification'] as bool?,
  createNotificationActivity: json['create_notification_activity'] as bool?,
  custom: json['custom'] as Map<String, dynamic>?,
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  pushPreference: json['push_preference'] == null
      ? null
      : FollowRequestPushPreference.fromJson(
          json['push_preference'] as String,
        ),
  skipPush: json['skip_push'] as bool?,
  source: json['source'] as String,
  target: json['target'] as String,
);

Map<String, dynamic> _$FollowRequestToJson(FollowRequest instance) => <String, dynamic>{
  'activity_copy_limit': instance.activityCopyLimit,
  'copy_custom_to_notification': instance.copyCustomToNotification,
  'create_notification_activity': instance.createNotificationActivity,
  'custom': instance.custom,
  'enrich_own_fields': instance.enrichOwnFields,
  'push_preference': instance.pushPreference?.toJson(),
  'skip_push': instance.skipPush,
  'source': instance.source,
  'target': instance.target,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFollowRequest _$UpdateFollowRequestFromJson(Map<String, dynamic> json) =>
    UpdateFollowRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: json['custom'] as Map<String, dynamic>?,
      followerRole: json['follower_role'] as String?,
      pushPreference: $enumDecodeNullable(
          _$UpdateFollowRequestPushPreferenceEnumMap, json['push_preference'],
          unknownValue: UpdateFollowRequestPushPreference.unknown),
      skipPush: json['skip_push'] as bool?,
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$UpdateFollowRequestToJson(
        UpdateFollowRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'follower_role': instance.followerRole,
      'push_preference':
          _$UpdateFollowRequestPushPreferenceEnumMap[instance.pushPreference],
      'skip_push': instance.skipPush,
      'source': instance.source,
      'target': instance.target,
    };

const _$UpdateFollowRequestPushPreferenceEnumMap = {
  UpdateFollowRequestPushPreference.all: 'all',
  UpdateFollowRequestPushPreference.none: 'none',
  UpdateFollowRequestPushPreference.unknown: '_unknown',
};

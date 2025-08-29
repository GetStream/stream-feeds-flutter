// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) =>
    FollowRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: json['custom'] as Map<String, dynamic>?,
      pushPreference: $enumDecodeNullable(
          _$FollowRequestPushPreferenceEnumMap, json['push_preference'],
          unknownValue: FollowRequestPushPreference.unknown),
      skipPush: json['skip_push'] as bool?,
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$FollowRequestToJson(FollowRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'push_preference':
          _$FollowRequestPushPreferenceEnumMap[instance.pushPreference],
      'skip_push': instance.skipPush,
      'source': instance.source,
      'target': instance.target,
    };

const _$FollowRequestPushPreferenceEnumMap = {
  FollowRequestPushPreference.all: 'all',
  FollowRequestPushPreference.none: 'none',
  FollowRequestPushPreference.unknown: '_unknown',
};

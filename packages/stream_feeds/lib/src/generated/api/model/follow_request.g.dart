// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) =>
    FollowRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      pushPreference: $enumDecodeNullable(
          _$FollowRequestPushPreferenceEnumEnumMap, json['push_preference']),
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$FollowRequestToJson(FollowRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'push_preference':
          _$FollowRequestPushPreferenceEnumEnumMap[instance.pushPreference],
      'source': instance.source,
      'target': instance.target,
    };

const _$FollowRequestPushPreferenceEnumEnumMap = {
  FollowRequestPushPreferenceEnum.all: 'all',
  FollowRequestPushPreferenceEnum.none: 'none',
  FollowRequestPushPreferenceEnum.unknown: 'unknown',
};

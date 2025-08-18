// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleFollowRequest _$SingleFollowRequestFromJson(Map<String, dynamic> json) =>
    SingleFollowRequest(
      createNotificationActivity: json['create_notification_activity'] as bool?,
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      pushPreference: $enumDecodeNullable(
          _$SingleFollowRequestPushPreferenceEnumMap, json['push_preference'],
          unknownValue: SingleFollowRequestPushPreference.unknown),
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$SingleFollowRequestToJson(
        SingleFollowRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'push_preference':
          _$SingleFollowRequestPushPreferenceEnumMap[instance.pushPreference],
      'source': instance.source,
      'target': instance.target,
    };

const _$SingleFollowRequestPushPreferenceEnumMap = {
  SingleFollowRequestPushPreference.all: 'all',
  SingleFollowRequestPushPreference.none: 'none',
  SingleFollowRequestPushPreference.unknown: '_unknown',
};

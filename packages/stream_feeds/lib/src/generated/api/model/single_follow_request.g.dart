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
          _$SingleFollowRequestPushPreferenceEnumEnumMap,
          json['push_preference']),
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$SingleFollowRequestToJson(
        SingleFollowRequest instance) =>
    <String, dynamic>{
      'create_notification_activity': instance.createNotificationActivity,
      'custom': instance.custom,
      'push_preference': _$SingleFollowRequestPushPreferenceEnumEnumMap[
          instance.pushPreference],
      'source': instance.source,
      'target': instance.target,
    };

const _$SingleFollowRequestPushPreferenceEnumEnumMap = {
  SingleFollowRequestPushPreferenceEnum.all: 'all',
  SingleFollowRequestPushPreferenceEnum.none: 'none',
  SingleFollowRequestPushPreferenceEnum.unknown: 'unknown',
};

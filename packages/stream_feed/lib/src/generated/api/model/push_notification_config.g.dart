// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationConfig _$PushNotificationConfigFromJson(
        Map<String, dynamic> json) =>
    PushNotificationConfig(
      activityTypes: (json['activity_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enabled: json['enabled'] as bool?,
    );

Map<String, dynamic> _$PushNotificationConfigToJson(
        PushNotificationConfig instance) =>
    <String, dynamic>{
      'activity_types': instance.activityTypes,
      'enabled': instance.enabled,
    };

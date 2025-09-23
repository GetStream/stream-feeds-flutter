// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotificationConfig _$PushNotificationConfigFromJson(
        Map<String, dynamic> json) =>
    PushNotificationConfig(
      enablePush: json['enable_push'] as bool?,
      pushTypes: (json['push_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PushNotificationConfigToJson(
        PushNotificationConfig instance) =>
    <String, dynamic>{
      'enable_push': instance.enablePush,
      'push_types': instance.pushTypes,
    };

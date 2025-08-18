// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_notification_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventNotificationSettings _$EventNotificationSettingsFromJson(
        Map<String, dynamic> json) =>
    EventNotificationSettings(
      apns: APNS.fromJson(json['apns'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      fcm: FCM.fromJson(json['fcm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventNotificationSettingsToJson(
        EventNotificationSettings instance) =>
    <String, dynamic>{
      'apns': instance.apns.toJson(),
      'enabled': instance.enabled,
      'fcm': instance.fcm.toJson(),
    };

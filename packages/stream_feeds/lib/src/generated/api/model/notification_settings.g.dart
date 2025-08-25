// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationSettings _$NotificationSettingsFromJson(
        Map<String, dynamic> json) =>
    NotificationSettings(
      callLiveStarted: EventNotificationSettings.fromJson(
          json['call_live_started'] as Map<String, dynamic>),
      callMissed: EventNotificationSettings.fromJson(
          json['call_missed'] as Map<String, dynamic>),
      callNotification: EventNotificationSettings.fromJson(
          json['call_notification'] as Map<String, dynamic>),
      callRing: EventNotificationSettings.fromJson(
          json['call_ring'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      sessionStarted: EventNotificationSettings.fromJson(
          json['session_started'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationSettingsToJson(
        NotificationSettings instance) =>
    <String, dynamic>{
      'call_live_started': instance.callLiveStarted.toJson(),
      'call_missed': instance.callMissed.toJson(),
      'call_notification': instance.callNotification.toJson(),
      'call_ring': instance.callRing.toJson(),
      'enabled': instance.enabled,
      'session_started': instance.sessionStarted.toJson(),
    };

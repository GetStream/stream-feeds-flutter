// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionSettings _$SessionSettingsFromJson(Map<String, dynamic> json) =>
    SessionSettings(
      inactivityTimeoutSeconds:
          (json['inactivity_timeout_seconds'] as num).toInt(),
    );

Map<String, dynamic> _$SessionSettingsToJson(SessionSettings instance) =>
    <String, dynamic>{
      'inactivity_timeout_seconds': instance.inactivityTimeoutSeconds,
    };

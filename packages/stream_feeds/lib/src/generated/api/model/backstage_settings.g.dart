// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backstage_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackstageSettings _$BackstageSettingsFromJson(Map<String, dynamic> json) =>
    BackstageSettings(
      enabled: json['enabled'] as bool,
      joinAheadTimeSeconds: (json['join_ahead_time_seconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BackstageSettingsToJson(BackstageSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'join_ahead_time_seconds': instance.joinAheadTimeSeconds,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broadcast_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BroadcastSettings _$BroadcastSettingsFromJson(Map<String, dynamic> json) =>
    BroadcastSettings(
      enabled: json['enabled'] as bool,
      hls: json['hls'] == null
          ? null
          : HLSSettings.fromJson(json['hls'] as Map<String, dynamic>),
      rtmp: json['rtmp'] == null
          ? null
          : RTMPSettings.fromJson(json['rtmp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BroadcastSettingsToJson(BroadcastSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'hls': instance.hls?.toJson(),
      'rtmp': instance.rtmp?.toJson(),
    };

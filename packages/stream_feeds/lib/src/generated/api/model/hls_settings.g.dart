// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hls_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HLSSettings _$HLSSettingsFromJson(Map<String, dynamic> json) => HLSSettings(
      autoOn: json['auto_on'] as bool,
      enabled: json['enabled'] as bool,
      layout: json['layout'] == null
          ? null
          : LayoutSettings.fromJson(json['layout'] as Map<String, dynamic>),
      qualityTracks: (json['quality_tracks'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HLSSettingsToJson(HLSSettings instance) =>
    <String, dynamic>{
      'auto_on': instance.autoOn,
      'enabled': instance.enabled,
      'layout': instance.layout?.toJson(),
      'quality_tracks': instance.qualityTracks,
    };

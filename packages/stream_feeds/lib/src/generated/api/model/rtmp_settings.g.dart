// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtmp_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RTMPSettings _$RTMPSettingsFromJson(Map<String, dynamic> json) => RTMPSettings(
      enabled: json['enabled'] as bool,
      layout: json['layout'] == null
          ? null
          : LayoutSettings.fromJson(json['layout'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : RTMPLocation.fromJson(json['location'] as Map<String, dynamic>),
      qualityName: json['quality_name'] as String?,
    );

Map<String, dynamic> _$RTMPSettingsToJson(RTMPSettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'layout': instance.layout?.toJson(),
      'location': instance.location?.toJson(),
      'quality_name': instance.qualityName,
    };

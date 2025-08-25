// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtmp_egress_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RTMPEgressConfig _$RTMPEgressConfigFromJson(Map<String, dynamic> json) =>
    RTMPEgressConfig(
      compositeAppSettings: json['composite_app_settings'] == null
          ? null
          : CompositeAppSettings.fromJson(
              json['composite_app_settings'] as Map<String, dynamic>),
      quality: json['quality'] == null
          ? null
          : Quality.fromJson(json['quality'] as Map<String, dynamic>),
      rtmpLocation: json['rtmp_location'] as String?,
    );

Map<String, dynamic> _$RTMPEgressConfigToJson(RTMPEgressConfig instance) =>
    <String, dynamic>{
      'composite_app_settings': instance.compositeAppSettings?.toJson(),
      'quality': instance.quality?.toJson(),
      'rtmp_location': instance.rtmpLocation,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSettings _$VideoSettingsFromJson(Map<String, dynamic> json) =>
    VideoSettings(
      accessRequestEnabled: json['access_request_enabled'] as bool,
      cameraDefaultOn: json['camera_default_on'] as bool,
      cameraFacing: $enumDecode(
          _$VideoSettingsCameraFacingEnumMap, json['camera_facing'],
          unknownValue: VideoSettingsCameraFacing.unknown),
      enabled: json['enabled'] as bool,
      targetResolution: TargetResolution.fromJson(
          json['target_resolution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoSettingsToJson(VideoSettings instance) =>
    <String, dynamic>{
      'access_request_enabled': instance.accessRequestEnabled,
      'camera_default_on': instance.cameraDefaultOn,
      'camera_facing':
          _$VideoSettingsCameraFacingEnumMap[instance.cameraFacing]!,
      'enabled': instance.enabled,
      'target_resolution': instance.targetResolution.toJson(),
    };

const _$VideoSettingsCameraFacingEnumMap = {
  VideoSettingsCameraFacing.back: 'back',
  VideoSettingsCameraFacing.external: 'external',
  VideoSettingsCameraFacing.front: 'front',
  VideoSettingsCameraFacing.unknown: '_unknown',
};

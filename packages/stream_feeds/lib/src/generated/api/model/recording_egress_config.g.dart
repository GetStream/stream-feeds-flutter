// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_egress_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingEgressConfig _$RecordingEgressConfigFromJson(
        Map<String, dynamic> json) =>
    RecordingEgressConfig(
      audioOnly: json['audio_only'] as bool?,
      compositeAppSettings: json['composite_app_settings'] == null
          ? null
          : CompositeAppSettings.fromJson(
              json['composite_app_settings'] as Map<String, dynamic>),
      externalStorage: json['external_storage'] == null
          ? null
          : ExternalStorage.fromJson(
              json['external_storage'] as Map<String, dynamic>),
      quality: json['quality'] == null
          ? null
          : Quality.fromJson(json['quality'] as Map<String, dynamic>),
      storageName: json['storage_name'] as String?,
      videoOrientationHint: json['video_orientation_hint'] == null
          ? null
          : VideoOrientation.fromJson(
              json['video_orientation_hint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordingEgressConfigToJson(
        RecordingEgressConfig instance) =>
    <String, dynamic>{
      'audio_only': instance.audioOnly,
      'composite_app_settings': instance.compositeAppSettings?.toJson(),
      'external_storage': instance.externalStorage?.toJson(),
      'quality': instance.quality?.toJson(),
      'storage_name': instance.storageName,
      'video_orientation_hint': instance.videoOrientationHint?.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_recording_egress_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameRecordingEgressConfig _$FrameRecordingEgressConfigFromJson(
        Map<String, dynamic> json) =>
    FrameRecordingEgressConfig(
      captureIntervalInSeconds:
          (json['capture_interval_in_seconds'] as num?)?.toInt(),
      externalStorage: json['external_storage'] == null
          ? null
          : ExternalStorage.fromJson(
              json['external_storage'] as Map<String, dynamic>),
      quality: json['quality'] == null
          ? null
          : Quality.fromJson(json['quality'] as Map<String, dynamic>),
      storageName: json['storage_name'] as String?,
    );

Map<String, dynamic> _$FrameRecordingEgressConfigToJson(
        FrameRecordingEgressConfig instance) =>
    <String, dynamic>{
      'capture_interval_in_seconds': instance.captureIntervalInSeconds,
      'external_storage': instance.externalStorage?.toJson(),
      'quality': instance.quality?.toJson(),
      'storage_name': instance.storageName,
    };

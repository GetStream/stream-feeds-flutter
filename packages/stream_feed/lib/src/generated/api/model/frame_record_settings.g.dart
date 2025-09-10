// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frame_record_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FrameRecordSettings _$FrameRecordSettingsFromJson(Map<String, dynamic> json) =>
    FrameRecordSettings(
      captureIntervalInSeconds:
          (json['capture_interval_in_seconds'] as num).toInt(),
      mode: $enumDecode(_$FrameRecordSettingsModeEnumMap, json['mode'],
          unknownValue: FrameRecordSettingsMode.unknown),
      quality: json['quality'] as String?,
    );

Map<String, dynamic> _$FrameRecordSettingsToJson(
        FrameRecordSettings instance) =>
    <String, dynamic>{
      'capture_interval_in_seconds': instance.captureIntervalInSeconds,
      'mode': _$FrameRecordSettingsModeEnumMap[instance.mode]!,
      'quality': instance.quality,
    };

const _$FrameRecordSettingsModeEnumMap = {
  FrameRecordSettingsMode.autoOn: 'auto-on',
  FrameRecordSettingsMode.available: 'available',
  FrameRecordSettingsMode.disabled: 'disabled',
  FrameRecordSettingsMode.unknown: '_unknown',
};

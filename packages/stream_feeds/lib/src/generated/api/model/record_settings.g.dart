// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordSettings _$RecordSettingsFromJson(Map<String, dynamic> json) =>
    RecordSettings(
      audioOnly: json['audio_only'] as bool?,
      layout: json['layout'] == null
          ? null
          : LayoutSettings.fromJson(json['layout'] as Map<String, dynamic>),
      mode: json['mode'] as String,
      quality: json['quality'] as String?,
    );

Map<String, dynamic> _$RecordSettingsToJson(RecordSettings instance) =>
    <String, dynamic>{
      'audio_only': instance.audioOnly,
      'layout': instance.layout?.toJson(),
      'mode': instance.mode,
      'quality': instance.quality,
    };

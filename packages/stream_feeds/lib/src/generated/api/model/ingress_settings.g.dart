// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingress_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngressSettings _$IngressSettingsFromJson(Map<String, dynamic> json) =>
    IngressSettings(
      audioEncodingOptions: json['audio_encoding_options'] == null
          ? null
          : IngressAudioEncodingOptions.fromJson(
              json['audio_encoding_options'] as Map<String, dynamic>),
      enabled: json['enabled'] as bool,
      videoEncodingOptions:
          (json['video_encoding_options'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, IngressVideoEncodingOptions.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$IngressSettingsToJson(IngressSettings instance) =>
    <String, dynamic>{
      'audio_encoding_options': instance.audioEncodingOptions?.toJson(),
      'enabled': instance.enabled,
      'video_encoding_options':
          instance.videoEncodingOptions?.map((k, e) => MapEntry(k, e.toJson())),
    };

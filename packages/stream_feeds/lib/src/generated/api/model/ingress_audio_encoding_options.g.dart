// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingress_audio_encoding_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngressAudioEncodingOptions _$IngressAudioEncodingOptionsFromJson(
        Map<String, dynamic> json) =>
    IngressAudioEncodingOptions(
      bitrate: (json['bitrate'] as num).toInt(),
      channels: $enumDecode(
          _$IngressAudioEncodingOptionsChannelsEnumMap, json['channels'],
          unknownValue: IngressAudioEncodingOptionsChannels.unknown),
      enableDtx: json['enable_dtx'] as bool,
    );

Map<String, dynamic> _$IngressAudioEncodingOptionsToJson(
        IngressAudioEncodingOptions instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'channels':
          _$IngressAudioEncodingOptionsChannelsEnumMap[instance.channels]!,
      'enable_dtx': instance.enableDtx,
    };

const _$IngressAudioEncodingOptionsChannelsEnumMap = {
  IngressAudioEncodingOptionsChannels.n1: '1',
  IngressAudioEncodingOptionsChannels.n2: '2',
  IngressAudioEncodingOptionsChannels.unknown: '_unknown',
};

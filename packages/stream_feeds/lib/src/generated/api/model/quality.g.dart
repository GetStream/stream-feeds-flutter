// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quality _$QualityFromJson(Map<String, dynamic> json) => Quality(
      bitdepth: (json['bitdepth'] as num?)?.toInt(),
      framerate: (json['framerate'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      name: json['name'] as String?,
      videoBitrate: (json['video_bitrate'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QualityToJson(Quality instance) => <String, dynamic>{
      'bitdepth': instance.bitdepth,
      'framerate': instance.framerate,
      'height': instance.height,
      'name': instance.name,
      'video_bitrate': instance.videoBitrate,
      'width': instance.width,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingress_video_layer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngressVideoLayer _$IngressVideoLayerFromJson(Map<String, dynamic> json) =>
    IngressVideoLayer(
      bitrate: (json['bitrate'] as num).toInt(),
      codec: $enumDecode(_$IngressVideoLayerCodecEnumMap, json['codec'],
          unknownValue: IngressVideoLayerCodec.unknown),
      frameRate: (json['frame_rate'] as num).toInt(),
      maxDimension: (json['max_dimension'] as num).toInt(),
      minDimension: (json['min_dimension'] as num).toInt(),
    );

Map<String, dynamic> _$IngressVideoLayerToJson(IngressVideoLayer instance) =>
    <String, dynamic>{
      'bitrate': instance.bitrate,
      'codec': _$IngressVideoLayerCodecEnumMap[instance.codec]!,
      'frame_rate': instance.frameRate,
      'max_dimension': instance.maxDimension,
      'min_dimension': instance.minDimension,
    };

const _$IngressVideoLayerCodecEnumMap = {
  IngressVideoLayerCodec.h264: 'h264',
  IngressVideoLayerCodec.vp8: 'vp8',
  IngressVideoLayerCodec.unknown: '_unknown',
};

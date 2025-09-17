// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingress_video_encoding_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngressVideoEncodingOptions _$IngressVideoEncodingOptionsFromJson(
        Map<String, dynamic> json) =>
    IngressVideoEncodingOptions(
      layers: (json['layers'] as List<dynamic>)
          .map((e) => IngressVideoLayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IngressVideoEncodingOptionsToJson(
        IngressVideoEncodingOptions instance) =>
    <String, dynamic>{
      'layers': instance.layers.map((e) => e.toJson()).toList(),
    };

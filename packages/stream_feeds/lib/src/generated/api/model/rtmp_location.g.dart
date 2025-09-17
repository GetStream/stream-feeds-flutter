// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtmp_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RTMPLocation _$RTMPLocationFromJson(Map<String, dynamic> json) => RTMPLocation(
      name: json['name'] as String,
      streamKey: json['stream_key'] as String,
      streamUrl: json['stream_url'] as String,
    );

Map<String, dynamic> _$RTMPLocationToJson(RTMPLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stream_key': instance.streamKey,
      'stream_url': instance.streamUrl,
    };

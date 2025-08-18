// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APNS _$APNSFromJson(Map<String, dynamic> json) => APNS(
      body: json['body'] as String,
      contentAvailable: (json['content_available'] as num?)?.toInt(),
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      mutableContent: (json['mutable_content'] as num?)?.toInt(),
      sound: json['sound'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$APNSToJson(APNS instance) => <String, dynamic>{
      'body': instance.body,
      'content_available': instance.contentAvailable,
      'data': instance.data,
      'mutable_content': instance.mutableContent,
      'sound': instance.sound,
      'title': instance.title,
    };

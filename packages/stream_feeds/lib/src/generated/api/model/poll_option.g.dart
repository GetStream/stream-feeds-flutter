// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollOption _$PollOptionFromJson(Map<String, dynamic> json) => PollOption(
      custom: json['custom'] as Map<String, dynamic>,
      id: json['id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$PollOptionToJson(PollOption instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'id': instance.id,
      'text': instance.text,
    };

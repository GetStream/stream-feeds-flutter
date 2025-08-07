// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_option_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollOptionInput _$PollOptionInputFromJson(Map<String, dynamic> json) =>
    PollOptionInput(
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$PollOptionInputToJson(PollOptionInput instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'text': instance.text,
    };

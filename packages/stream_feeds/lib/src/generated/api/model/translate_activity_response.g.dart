// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranslateActivityResponse _$TranslateActivityResponseFromJson(
  Map<String, dynamic> json,
) => TranslateActivityResponse(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  duration: json['duration'] as String,
);

Map<String, dynamic> _$TranslateActivityResponseToJson(
  TranslateActivityResponse instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'duration': instance.duration,
};

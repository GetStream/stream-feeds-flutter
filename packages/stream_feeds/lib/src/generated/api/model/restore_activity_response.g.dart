// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restore_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestoreActivityResponse _$RestoreActivityResponseFromJson(
  Map<String, dynamic> json,
) => RestoreActivityResponse(
  activity: ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
  duration: json['duration'] as String,
);

Map<String, dynamic> _$RestoreActivityResponseToJson(
  RestoreActivityResponse instance,
) => <String, dynamic>{
  'activity': instance.activity.toJson(),
  'duration': instance.duration,
};

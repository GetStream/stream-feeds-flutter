// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddActivityResponse _$AddActivityResponseFromJson(Map<String, dynamic> json) =>
    AddActivityResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$AddActivityResponseToJson(
        AddActivityResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
    };

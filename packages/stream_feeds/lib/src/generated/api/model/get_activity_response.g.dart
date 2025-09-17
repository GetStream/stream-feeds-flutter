// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActivityResponse _$GetActivityResponseFromJson(Map<String, dynamic> json) =>
    GetActivityResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$GetActivityResponseToJson(
        GetActivityResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
    };

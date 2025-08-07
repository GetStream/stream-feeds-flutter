// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityResponse _$UpdateActivityResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateActivityResponseToJson(
        UpdateActivityResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
    };

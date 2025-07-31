// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_partial_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityPartialResponse _$UpdateActivityPartialResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityPartialResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateActivityPartialResponseToJson(
        UpdateActivityPartialResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
    };

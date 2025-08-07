// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinActivityResponse _$PinActivityResponseFromJson(Map<String, dynamic> json) =>
    PinActivityResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      duration: json['duration'] as String,
      fid: json['fid'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$PinActivityResponseToJson(
        PinActivityResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'duration': instance.duration,
      'fid': instance.fid,
      'user_id': instance.userId,
    };

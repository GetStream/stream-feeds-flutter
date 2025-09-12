// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unpin_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnpinActivityResponse _$UnpinActivityResponseFromJson(
        Map<String, dynamic> json) =>
    UnpinActivityResponse(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      feed: json['feed'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$UnpinActivityResponseToJson(
        UnpinActivityResponse instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'duration': instance.duration,
      'feed': instance.feed,
      'user_id': instance.userId,
    };

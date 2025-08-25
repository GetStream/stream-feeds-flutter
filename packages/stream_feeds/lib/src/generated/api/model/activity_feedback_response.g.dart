// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityFeedbackResponse _$ActivityFeedbackResponseFromJson(
        Map<String, dynamic> json) =>
    ActivityFeedbackResponse(
      activityId: json['activity_id'] as String,
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$ActivityFeedbackResponseToJson(
        ActivityFeedbackResponse instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'duration': instance.duration,
    };

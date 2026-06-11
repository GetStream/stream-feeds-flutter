// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_activity_metrics_event_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackActivityMetricsEventResult _$TrackActivityMetricsEventResultFromJson(
        Map<String, dynamic> json) =>
    TrackActivityMetricsEventResult(
      activityId: json['activity_id'] as String,
      allowed: json['allowed'] as bool,
      error: json['error'] as String?,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$TrackActivityMetricsEventResultToJson(
        TrackActivityMetricsEventResult instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'allowed': instance.allowed,
      'error': instance.error,
      'metric': instance.metric,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_activity_metrics_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackActivityMetricsEvent _$TrackActivityMetricsEventFromJson(
  Map<String, dynamic> json,
) => TrackActivityMetricsEvent(
  activityId: json['activity_id'] as String,
  delta: (json['delta'] as num?)?.toInt(),
  metric: json['metric'] as String,
);

Map<String, dynamic> _$TrackActivityMetricsEventToJson(
  TrackActivityMetricsEvent instance,
) => <String, dynamic>{
  'activity_id': instance.activityId,
  'delta': instance.delta,
  'metric': instance.metric,
};

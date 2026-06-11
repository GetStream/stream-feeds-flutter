// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_activity_metrics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackActivityMetricsRequest _$TrackActivityMetricsRequestFromJson(
        Map<String, dynamic> json) =>
    TrackActivityMetricsRequest(
      events: (json['events'] as List<dynamic>)
          .map((e) =>
              TrackActivityMetricsEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackActivityMetricsRequestToJson(
        TrackActivityMetricsRequest instance) =>
    <String, dynamic>{
      'events': instance.events.map((e) => e.toJson()).toList(),
    };

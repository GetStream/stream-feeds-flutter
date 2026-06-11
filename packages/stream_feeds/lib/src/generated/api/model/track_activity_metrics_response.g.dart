// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_activity_metrics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackActivityMetricsResponse _$TrackActivityMetricsResponseFromJson(
        Map<String, dynamic> json) =>
    TrackActivityMetricsResponse(
      duration: json['duration'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => TrackActivityMetricsEventResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackActivityMetricsResponseToJson(
        TrackActivityMetricsResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

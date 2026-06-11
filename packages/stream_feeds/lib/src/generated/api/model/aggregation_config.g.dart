// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregation_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregationConfig _$AggregationConfigFromJson(Map<String, dynamic> json) =>
    AggregationConfig(
      activitiesSort: json['activities_sort'] as String?,
      format: json['format'] as String?,
      groupSize: (json['group_size'] as num?)?.toInt(),
      scoreStrategy: json['score_strategy'] as String?,
    );

Map<String, dynamic> _$AggregationConfigToJson(AggregationConfig instance) =>
    <String, dynamic>{
      'activities_sort': instance.activitiesSort,
      'format': instance.format,
      'group_size': instance.groupSize,
      'score_strategy': instance.scoreStrategy,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregation_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregationConfig _$AggregationConfigFromJson(Map<String, dynamic> json) =>
    AggregationConfig(
      format: json['format'] as String?,
      groupSize: (json['group_size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AggregationConfigToJson(AggregationConfig instance) =>
    <String, dynamic>{
      'format': instance.format,
      'group_size': instance.groupSize,
    };

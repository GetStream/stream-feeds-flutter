// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_selector_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitySelectorConfig _$ActivitySelectorConfigFromJson(
        Map<String, dynamic> json) =>
    ActivitySelectorConfig(
      cutoffTime: const EpochDateTimeConverter()
          .fromJson((json['cutoff_time'] as num).toInt()),
      filter: json['filter'] as Map<String, dynamic>?,
      minPopularity: (json['min_popularity'] as num?)?.toInt(),
      sort: (json['sort'] as List<dynamic>?)
          ?.map((e) => SortParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ActivitySelectorConfigToJson(
        ActivitySelectorConfig instance) =>
    <String, dynamic>{
      'cutoff_time': const EpochDateTimeConverter().toJson(instance.cutoffTime),
      'filter': instance.filter,
      'min_popularity': instance.minPopularity,
      'sort': instance.sort?.map((e) => e.toJson()).toList(),
      'type': instance.type,
    };

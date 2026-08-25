// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_processor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityProcessorConfig _$ActivityProcessorConfigFromJson(
  Map<String, dynamic> json,
) => ActivityProcessorConfig(
  config: json['config'] as Map<String, dynamic>?,
  minTextLength: (json['min_text_length'] as num?)?.toInt(),
  minWordCount: (json['min_word_count'] as num?)?.toInt(),
  type: json['type'] as String,
);

Map<String, dynamic> _$ActivityProcessorConfigToJson(
  ActivityProcessorConfig instance,
) => <String, dynamic>{
  'config': instance.config,
  'min_text_length': instance.minTextLength,
  'min_word_count': instance.minWordCount,
  'type': instance.type,
};

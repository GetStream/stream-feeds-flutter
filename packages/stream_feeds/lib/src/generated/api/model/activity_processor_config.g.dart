// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_processor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityProcessorConfig _$ActivityProcessorConfigFromJson(
        Map<String, dynamic> json) =>
    ActivityProcessorConfig(
      config: json['config'] as Map<String, dynamic>?,
      openaiKey: json['openai_key'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ActivityProcessorConfigToJson(
        ActivityProcessorConfig instance) =>
    <String, dynamic>{
      'config': instance.config,
      'openai_key': instance.openaiKey,
      'type': instance.type,
    };

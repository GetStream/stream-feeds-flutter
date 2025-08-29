// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      aiImageConfig: json['ai_image_config'] == null
          ? null
          : AIImageConfig.fromJson(
              json['ai_image_config'] as Map<String, dynamic>),
      aiTextConfig: json['ai_text_config'] == null
          ? null
          : AITextConfig.fromJson(
              json['ai_text_config'] as Map<String, dynamic>),
      aiVideoConfig: json['ai_video_config'] == null
          ? null
          : AIVideoConfig.fromJson(
              json['ai_video_config'] as Map<String, dynamic>),
      async: json['async'] as bool,
      automodPlatformCircumventionConfig:
          json['automod_platform_circumvention_config'] == null
              ? null
              : AutomodPlatformCircumventionConfig.fromJson(
                  json['automod_platform_circumvention_config']
                      as Map<String, dynamic>),
      automodSemanticFiltersConfig: json['automod_semantic_filters_config'] ==
              null
          ? null
          : AutomodSemanticFiltersConfig.fromJson(
              json['automod_semantic_filters_config'] as Map<String, dynamic>),
      automodToxicityConfig: json['automod_toxicity_config'] == null
          ? null
          : AutomodToxicityConfig.fromJson(
              json['automod_toxicity_config'] as Map<String, dynamic>),
      blockListConfig: json['block_list_config'] == null
          ? null
          : BlockListConfig.fromJson(
              json['block_list_config'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      key: json['key'] as String,
      llmConfig: json['llm_config'] == null
          ? null
          : LLMConfig.fromJson(json['llm_config'] as Map<String, dynamic>),
      team: json['team'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      velocityFilterConfig: json['velocity_filter_config'] == null
          ? null
          : VelocityFilterConfig.fromJson(
              json['velocity_filter_config'] as Map<String, dynamic>),
      videoCallRuleConfig: json['video_call_rule_config'] == null
          ? null
          : VideoCallRuleConfig.fromJson(
              json['video_call_rule_config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'ai_image_config': instance.aiImageConfig?.toJson(),
      'ai_text_config': instance.aiTextConfig?.toJson(),
      'ai_video_config': instance.aiVideoConfig?.toJson(),
      'async': instance.async,
      'automod_platform_circumvention_config':
          instance.automodPlatformCircumventionConfig?.toJson(),
      'automod_semantic_filters_config':
          instance.automodSemanticFiltersConfig?.toJson(),
      'automod_toxicity_config': instance.automodToxicityConfig?.toJson(),
      'block_list_config': instance.blockListConfig?.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'key': instance.key,
      'llm_config': instance.llmConfig?.toJson(),
      'team': instance.team,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'velocity_filter_config': instance.velocityFilterConfig?.toJson(),
      'video_call_rule_config': instance.videoCallRuleConfig?.toJson(),
    };

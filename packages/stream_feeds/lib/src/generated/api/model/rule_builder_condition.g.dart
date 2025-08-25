// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_builder_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuleBuilderCondition _$RuleBuilderConditionFromJson(
        Map<String, dynamic> json) =>
    RuleBuilderCondition(
      confidence: (json['confidence'] as num?)?.toDouble(),
      contentCountRuleParams: json['content_count_rule_params'] == null
          ? null
          : ContentCountRuleParameters.fromJson(
              json['content_count_rule_params'] as Map<String, dynamic>),
      imageContentParams: json['image_content_params'] == null
          ? null
          : ImageContentParameters.fromJson(
              json['image_content_params'] as Map<String, dynamic>),
      imageRuleParams: json['image_rule_params'] == null
          ? null
          : ImageRuleParameters.fromJson(
              json['image_rule_params'] as Map<String, dynamic>),
      textContentParams: json['text_content_params'] == null
          ? null
          : TextContentParameters.fromJson(
              json['text_content_params'] as Map<String, dynamic>),
      textRuleParams: json['text_rule_params'] == null
          ? null
          : TextRuleParameters.fromJson(
              json['text_rule_params'] as Map<String, dynamic>),
      type: json['type'] as String,
      userCreatedWithinParams: json['user_created_within_params'] == null
          ? null
          : UserCreatedWithinParameters.fromJson(
              json['user_created_within_params'] as Map<String, dynamic>),
      userRuleParams: json['user_rule_params'] == null
          ? null
          : UserRuleParameters.fromJson(
              json['user_rule_params'] as Map<String, dynamic>),
      videoContentParams: json['video_content_params'] == null
          ? null
          : VideoContentParameters.fromJson(
              json['video_content_params'] as Map<String, dynamic>),
      videoRuleParams: json['video_rule_params'] == null
          ? null
          : VideoRuleParameters.fromJson(
              json['video_rule_params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RuleBuilderConditionToJson(
        RuleBuilderCondition instance) =>
    <String, dynamic>{
      'confidence': instance.confidence,
      'content_count_rule_params': instance.contentCountRuleParams?.toJson(),
      'image_content_params': instance.imageContentParams?.toJson(),
      'image_rule_params': instance.imageRuleParams?.toJson(),
      'text_content_params': instance.textContentParams?.toJson(),
      'text_rule_params': instance.textRuleParams?.toJson(),
      'type': instance.type,
      'user_created_within_params': instance.userCreatedWithinParams?.toJson(),
      'user_rule_params': instance.userRuleParams?.toJson(),
      'video_content_params': instance.videoContentParams?.toJson(),
      'video_rule_params': instance.videoRuleParams?.toJson(),
    };

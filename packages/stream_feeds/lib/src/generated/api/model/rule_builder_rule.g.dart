// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_builder_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuleBuilderRule _$RuleBuilderRuleFromJson(Map<String, dynamic> json) =>
    RuleBuilderRule(
      action:
          RuleBuilderAction.fromJson(json['action'] as Map<String, dynamic>),
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => RuleBuilderCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      cooldownPeriod: json['cooldown_period'] as String?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) =>
              RuleBuilderConditionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      logic: json['logic'] as String?,
      ruleType: json['rule_type'] as String,
    );

Map<String, dynamic> _$RuleBuilderRuleToJson(RuleBuilderRule instance) =>
    <String, dynamic>{
      'action': instance.action.toJson(),
      'conditions': instance.conditions?.map((e) => e.toJson()).toList(),
      'cooldown_period': instance.cooldownPeriod,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'logic': instance.logic,
      'rule_type': instance.ruleType,
    };

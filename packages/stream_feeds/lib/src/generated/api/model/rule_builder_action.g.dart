// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_builder_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuleBuilderAction _$RuleBuilderActionFromJson(Map<String, dynamic> json) =>
    RuleBuilderAction(
      banOptions: json['ban_options'] == null
          ? null
          : BanOptions.fromJson(json['ban_options'] as Map<String, dynamic>),
      flagContentOptions: json['flag_content_options'] == null
          ? null
          : FlagContentOptions.fromJson(
              json['flag_content_options'] as Map<String, dynamic>),
      flagUserOptions: json['flag_user_options'] == null
          ? null
          : FlagUserOptions.fromJson(
              json['flag_user_options'] as Map<String, dynamic>),
      removeContentOptions: json['remove_content_options'] == null
          ? null
          : BlockContentOptions.fromJson(
              json['remove_content_options'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$RuleBuilderActionToJson(RuleBuilderAction instance) =>
    <String, dynamic>{
      'ban_options': instance.banOptions?.toJson(),
      'flag_content_options': instance.flagContentOptions?.toJson(),
      'flag_user_options': instance.flagUserOptions?.toJson(),
      'remove_content_options': instance.removeContentOptions?.toJson(),
      'type': instance.type,
    };

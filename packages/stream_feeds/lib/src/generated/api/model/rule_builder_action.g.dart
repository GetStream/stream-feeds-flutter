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
      flagUserOptions: json['flag_user_options'] == null
          ? null
          : FlagUserOptions.fromJson(
              json['flag_user_options'] as Map<String, dynamic>),
      type: $enumDecode(_$RuleBuilderActionTypeEnumMap, json['type'],
          unknownValue: RuleBuilderActionType.unknown),
    );

Map<String, dynamic> _$RuleBuilderActionToJson(RuleBuilderAction instance) =>
    <String, dynamic>{
      'ban_options': instance.banOptions?.toJson(),
      'flag_user_options': instance.flagUserOptions?.toJson(),
      'type': _$RuleBuilderActionTypeEnumMap[instance.type]!,
    };

const _$RuleBuilderActionTypeEnumMap = {
  RuleBuilderActionType.banUser: 'ban_user',
  RuleBuilderActionType.blockContent: 'block_content',
  RuleBuilderActionType.bounceContent: 'bounce_content',
  RuleBuilderActionType.bounceFlagContent: 'bounce_flag_content',
  RuleBuilderActionType.bounceRemoveContent: 'bounce_remove_content',
  RuleBuilderActionType.flagContent: 'flag_content',
  RuleBuilderActionType.flagUser: 'flag_user',
  RuleBuilderActionType.shadowContent: 'shadow_content',
  RuleBuilderActionType.unknown: '_unknown',
};

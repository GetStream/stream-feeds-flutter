// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_action_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModerationActionConfig _$ModerationActionConfigFromJson(
        Map<String, dynamic> json) =>
    ModerationActionConfig(
      action: json['action'] as String,
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      description: json['description'] as String,
      entityType: json['entity_type'] as String,
      icon: json['icon'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$ModerationActionConfigToJson(
        ModerationActionConfig instance) =>
    <String, dynamic>{
      'action': instance.action,
      'custom': instance.custom,
      'description': instance.description,
      'entity_type': instance.entityType,
      'icon': instance.icon,
      'order': instance.order,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_rule_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCallRuleConfig _$VideoCallRuleConfigFromJson(Map<String, dynamic> json) =>
    VideoCallRuleConfig(
      rules: (json['rules'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, HarmConfig.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$VideoCallRuleConfigToJson(
        VideoCallRuleConfig instance) =>
    <String, dynamic>{
      'rules': instance.rules.map((k, e) => MapEntry(k, e.toJson())),
    };

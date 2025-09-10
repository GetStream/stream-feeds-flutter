// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harm_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarmConfig _$HarmConfigFromJson(Map<String, dynamic> json) => HarmConfig(
      actionSequences: (json['action_sequences'] as List<dynamic>)
          .map((e) => ActionSequence.fromJson(e as Map<String, dynamic>))
          .toList(),
      severity: (json['severity'] as num).toInt(),
    );

Map<String, dynamic> _$HarmConfigToJson(HarmConfig instance) =>
    <String, dynamic>{
      'action_sequences':
          instance.actionSequences.map((e) => e.toJson()).toList(),
      'severity': instance.severity,
    };

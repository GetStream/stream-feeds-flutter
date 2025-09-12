// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_rule_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextRuleParameters _$TextRuleParametersFromJson(Map<String, dynamic> json) =>
    TextRuleParameters(
      blocklistMatch: (json['blocklist_match'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      containsUrl: json['contains_url'] as bool?,
      harmLabels: (json['harm_labels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      llmHarmLabels: (json['llm_harm_labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      severity: json['severity'] as String?,
      threshold: (json['threshold'] as num?)?.toInt(),
      timeWindow: json['time_window'] as String?,
    );

Map<String, dynamic> _$TextRuleParametersToJson(TextRuleParameters instance) =>
    <String, dynamic>{
      'blocklist_match': instance.blocklistMatch,
      'contains_url': instance.containsUrl,
      'harm_labels': instance.harmLabels,
      'llm_harm_labels': instance.llmHarmLabels,
      'severity': instance.severity,
      'threshold': instance.threshold,
      'time_window': instance.timeWindow,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingConfig _$RankingConfigFromJson(Map<String, dynamic> json) =>
    RankingConfig(
      defaults: json['defaults'] as Map<String, dynamic>?,
      functions: (json['functions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, DecayFunctionConfig.fromJson(e as Map<String, dynamic>)),
      ),
      score: json['score'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$RankingConfigToJson(RankingConfig instance) =>
    <String, dynamic>{
      'defaults': instance.defaults,
      'functions': instance.functions?.map((k, e) => MapEntry(k, e.toJson())),
      'score': instance.score,
      'type': instance.type,
    };

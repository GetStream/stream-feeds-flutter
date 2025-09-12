// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decay_function_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DecayFunctionConfig _$DecayFunctionConfigFromJson(Map<String, dynamic> json) =>
    DecayFunctionConfig(
      base: json['base'] as String?,
      decay: json['decay'] as String?,
      direction: json['direction'] as String?,
      offset: json['offset'] as String?,
      origin: json['origin'] as String?,
      scale: json['scale'] as String?,
    );

Map<String, dynamic> _$DecayFunctionConfigToJson(
        DecayFunctionConfig instance) =>
    <String, dynamic>{
      'base': instance.base,
      'decay': instance.decay,
      'direction': instance.direction,
      'offset': instance.offset,
      'origin': instance.origin,
      'scale': instance.scale,
    };

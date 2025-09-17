// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortParam _$SortParamFromJson(Map<String, dynamic> json) => SortParam(
      direction: (json['direction'] as num).toInt(),
      field: json['field'] as String,
    );

Map<String, dynamic> _$SortParamToJson(SortParam instance) => <String, dynamic>{
      'direction': instance.direction,
      'field': instance.field,
    };

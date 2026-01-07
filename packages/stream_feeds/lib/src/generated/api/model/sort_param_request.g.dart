// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_param_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortParamRequest _$SortParamRequestFromJson(Map<String, dynamic> json) =>
    SortParamRequest(
      direction: (json['direction'] as num?)?.toInt(),
      field: json['field'] as String?,
      type: $enumDecodeNullable(_$SortParamRequestTypeEnumMap, json['type'],
          unknownValue: SortParamRequestType.unknown),
    );

Map<String, dynamic> _$SortParamRequestToJson(SortParamRequest instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'field': instance.field,
      'type': _$SortParamRequestTypeEnumMap[instance.type],
    };

const _$SortParamRequestTypeEnumMap = {
  SortParamRequestType.boolean: 'boolean',
  SortParamRequestType.empty: '',
  SortParamRequestType.number: 'number',
  SortParamRequestType.unknown: '_unknown',
};

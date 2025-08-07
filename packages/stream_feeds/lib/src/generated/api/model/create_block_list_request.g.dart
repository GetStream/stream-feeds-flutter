// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_block_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBlockListRequest _$CreateBlockListRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBlockListRequest(
      name: json['name'] as String,
      team: json['team'] as String?,
      type: $enumDecodeNullable(
          _$CreateBlockListRequestTypeEnumEnumMap, json['type']),
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateBlockListRequestToJson(
        CreateBlockListRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'team': instance.team,
      'type': _$CreateBlockListRequestTypeEnumEnumMap[instance.type],
      'words': instance.words,
    };

const _$CreateBlockListRequestTypeEnumEnumMap = {
  CreateBlockListRequestTypeEnum.domain: 'domain',
  CreateBlockListRequestTypeEnum.domainAllowlist: 'domain_allowlist',
  CreateBlockListRequestTypeEnum.email: 'email',
  CreateBlockListRequestTypeEnum.regex: 'regex',
  CreateBlockListRequestTypeEnum.word: 'word',
  CreateBlockListRequestTypeEnum.unknown: 'unknown',
};

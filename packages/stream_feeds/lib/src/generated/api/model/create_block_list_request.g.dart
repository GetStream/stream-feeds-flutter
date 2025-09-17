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
          _$CreateBlockListRequestTypeEnumMap, json['type'],
          unknownValue: CreateBlockListRequestType.unknown),
      words: (json['words'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateBlockListRequestToJson(
        CreateBlockListRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'team': instance.team,
      'type': _$CreateBlockListRequestTypeEnumMap[instance.type],
      'words': instance.words,
    };

const _$CreateBlockListRequestTypeEnumMap = {
  CreateBlockListRequestType.domain: 'domain',
  CreateBlockListRequestType.domainAllowlist: 'domain_allowlist',
  CreateBlockListRequestType.email: 'email',
  CreateBlockListRequestType.regex: 'regex',
  CreateBlockListRequestType.word: 'word',
  CreateBlockListRequestType.unknown: '_unknown',
};

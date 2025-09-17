// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_block_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBlockListRequest _$UpdateBlockListRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateBlockListRequest(
      team: json['team'] as String?,
      words:
          (json['words'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UpdateBlockListRequestToJson(
        UpdateBlockListRequest instance) =>
    <String, dynamic>{
      'team': instance.team,
      'words': instance.words,
    };

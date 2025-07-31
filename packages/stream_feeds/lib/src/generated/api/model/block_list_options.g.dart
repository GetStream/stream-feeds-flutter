// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_list_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockListOptions _$BlockListOptionsFromJson(Map<String, dynamic> json) =>
    BlockListOptions(
      behavior:
          $enumDecode(_$BlockListOptionsBehaviorEnumEnumMap, json['behavior']),
      blocklist: json['blocklist'] as String,
    );

Map<String, dynamic> _$BlockListOptionsToJson(BlockListOptions instance) =>
    <String, dynamic>{
      'behavior': _$BlockListOptionsBehaviorEnumEnumMap[instance.behavior]!,
      'blocklist': instance.blocklist,
    };

const _$BlockListOptionsBehaviorEnumEnumMap = {
  BlockListOptionsBehaviorEnum.block: 'block',
  BlockListOptionsBehaviorEnum.flag: 'flag',
  BlockListOptionsBehaviorEnum.shadowBlock: 'shadow_block',
  BlockListOptionsBehaviorEnum.unknown: 'unknown',
};

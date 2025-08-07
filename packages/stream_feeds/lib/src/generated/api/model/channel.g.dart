// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      activeLiveLocations: (json['active_live_locations'] as List<dynamic>?)
          ?.map((e) => SharedLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoTranslationEnabled: json['auto_translation_enabled'] as bool?,
      autoTranslationLanguage: json['auto_translation_language'] as String,
      cid: json['cid'] as String,
      config: json['config'] == null
          ? null
          : ChannelConfig.fromJson(json['config'] as Map<String, dynamic>),
      configOverrides: json['config_overrides'] == null
          ? null
          : ConfigOverrides.fromJson(
              json['config_overrides'] as Map<String, dynamic>),
      cooldown: (json['cooldown'] as num?)?.toInt(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      disabled: json['disabled'] as bool,
      frozen: json['frozen'] as bool,
      id: json['id'] as String,
      invites: (json['invites'] as List<dynamic>?)
          ?.map((e) => ChannelMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastCampaigns: json['last_campaigns'] as String?,
      lastMessageAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_message_at'], const EpochDateTimeConverter().fromJson),
      memberCount: (json['member_count'] as num?)?.toInt(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => ChannelMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      team: json['team'] as String?,
      truncatedBy: json['truncated_by'] == null
          ? null
          : User.fromJson(json['truncated_by'] as Map<String, dynamic>),
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'active_live_locations':
          instance.activeLiveLocations?.map((e) => e.toJson()).toList(),
      'auto_translation_enabled': instance.autoTranslationEnabled,
      'auto_translation_language': instance.autoTranslationLanguage,
      'cid': instance.cid,
      'config': instance.config?.toJson(),
      'config_overrides': instance.configOverrides?.toJson(),
      'cooldown': instance.cooldown,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy?.toJson(),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'disabled': instance.disabled,
      'frozen': instance.frozen,
      'id': instance.id,
      'invites': instance.invites?.map((e) => e.toJson()).toList(),
      'last_campaigns': instance.lastCampaigns,
      'last_message_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastMessageAt, const EpochDateTimeConverter().toJson),
      'member_count': instance.memberCount,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'team': instance.team,
      'truncated_by': instance.truncatedBy?.toJson(),
      'type': instance.type,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

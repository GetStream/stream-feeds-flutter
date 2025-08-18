// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelConfig _$ChannelConfigFromJson(Map<String, dynamic> json) =>
    ChannelConfig(
      allowedFlagReasons: (json['allowed_flag_reasons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      automod: $enumDecode(_$ChannelConfigAutomodEnumMap, json['automod'],
          unknownValue: ChannelConfigAutomod.unknown),
      automodBehavior: $enumDecode(
          _$ChannelConfigAutomodBehaviorEnumMap, json['automod_behavior'],
          unknownValue: ChannelConfigAutomodBehavior.unknown),
      automodThresholds: json['automod_thresholds'] == null
          ? null
          : Thresholds.fromJson(
              json['automod_thresholds'] as Map<String, dynamic>),
      blocklist: json['blocklist'] as String?,
      blocklistBehavior: $enumDecodeNullable(
          _$ChannelConfigBlocklistBehaviorEnumMap, json['blocklist_behavior'],
          unknownValue: ChannelConfigBlocklistBehavior.unknown),
      blocklists: (json['blocklists'] as List<dynamic>?)
          ?.map((e) => BlockListOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      commands:
          (json['commands'] as List<dynamic>).map((e) => e as String).toList(),
      connectEvents: json['connect_events'] as bool,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      customEvents: json['custom_events'] as bool,
      markMessagesPending: json['mark_messages_pending'] as bool,
      maxMessageLength: (json['max_message_length'] as num).toInt(),
      mutes: json['mutes'] as bool,
      name: json['name'] as String,
      partitionSize: (json['partition_size'] as num?)?.toInt(),
      partitionTtl: (json['partition_ttl'] as num?)?.toInt(),
      polls: json['polls'] as bool,
      pushNotifications: json['push_notifications'] as bool,
      quotes: json['quotes'] as bool,
      reactions: json['reactions'] as bool,
      readEvents: json['read_events'] as bool,
      reminders: json['reminders'] as bool,
      replies: json['replies'] as bool,
      search: json['search'] as bool,
      sharedLocations: json['shared_locations'] as bool,
      skipLastMsgUpdateForSystemMsgs:
          json['skip_last_msg_update_for_system_msgs'] as bool,
      typingEvents: json['typing_events'] as bool,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      uploads: json['uploads'] as bool,
      urlEnrichment: json['url_enrichment'] as bool,
      userMessageReminders: json['user_message_reminders'] as bool,
    );

Map<String, dynamic> _$ChannelConfigToJson(ChannelConfig instance) =>
    <String, dynamic>{
      'allowed_flag_reasons': instance.allowedFlagReasons,
      'automod': _$ChannelConfigAutomodEnumMap[instance.automod]!,
      'automod_behavior':
          _$ChannelConfigAutomodBehaviorEnumMap[instance.automodBehavior]!,
      'automod_thresholds': instance.automodThresholds?.toJson(),
      'blocklist': instance.blocklist,
      'blocklist_behavior':
          _$ChannelConfigBlocklistBehaviorEnumMap[instance.blocklistBehavior],
      'blocklists': instance.blocklists?.map((e) => e.toJson()).toList(),
      'commands': instance.commands,
      'connect_events': instance.connectEvents,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom_events': instance.customEvents,
      'mark_messages_pending': instance.markMessagesPending,
      'max_message_length': instance.maxMessageLength,
      'mutes': instance.mutes,
      'name': instance.name,
      'partition_size': instance.partitionSize,
      'partition_ttl': instance.partitionTtl,
      'polls': instance.polls,
      'push_notifications': instance.pushNotifications,
      'quotes': instance.quotes,
      'reactions': instance.reactions,
      'read_events': instance.readEvents,
      'reminders': instance.reminders,
      'replies': instance.replies,
      'search': instance.search,
      'shared_locations': instance.sharedLocations,
      'skip_last_msg_update_for_system_msgs':
          instance.skipLastMsgUpdateForSystemMsgs,
      'typing_events': instance.typingEvents,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'uploads': instance.uploads,
      'url_enrichment': instance.urlEnrichment,
      'user_message_reminders': instance.userMessageReminders,
    };

const _$ChannelConfigAutomodEnumMap = {
  ChannelConfigAutomod.aI: 'AI',
  ChannelConfigAutomod.disabled: 'disabled',
  ChannelConfigAutomod.simple: 'simple',
  ChannelConfigAutomod.unknown: '_unknown',
};

const _$ChannelConfigAutomodBehaviorEnumMap = {
  ChannelConfigAutomodBehavior.block: 'block',
  ChannelConfigAutomodBehavior.flag: 'flag',
  ChannelConfigAutomodBehavior.shadowBlock: 'shadow_block',
  ChannelConfigAutomodBehavior.unknown: '_unknown',
};

const _$ChannelConfigBlocklistBehaviorEnumMap = {
  ChannelConfigBlocklistBehavior.block: 'block',
  ChannelConfigBlocklistBehavior.flag: 'flag',
  ChannelConfigBlocklistBehavior.shadowBlock: 'shadow_block',
  ChannelConfigBlocklistBehavior.unknown: '_unknown',
};

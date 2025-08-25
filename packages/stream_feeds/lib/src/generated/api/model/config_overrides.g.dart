// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_overrides.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigOverrides _$ConfigOverridesFromJson(Map<String, dynamic> json) =>
    ConfigOverrides(
      blocklist: json['blocklist'] as String?,
      blocklistBehavior: $enumDecodeNullable(
          _$ConfigOverridesBlocklistBehaviorEnumMap, json['blocklist_behavior'],
          unknownValue: ConfigOverridesBlocklistBehavior.unknown),
      commands:
          (json['commands'] as List<dynamic>).map((e) => e as String).toList(),
      countMessages: json['count_messages'] as bool?,
      grants: (json['grants'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      maxMessageLength: (json['max_message_length'] as num?)?.toInt(),
      quotes: json['quotes'] as bool?,
      reactions: json['reactions'] as bool?,
      replies: json['replies'] as bool?,
      sharedLocations: json['shared_locations'] as bool?,
      typingEvents: json['typing_events'] as bool?,
      uploads: json['uploads'] as bool?,
      urlEnrichment: json['url_enrichment'] as bool?,
      userMessageReminders: json['user_message_reminders'] as bool?,
    );

Map<String, dynamic> _$ConfigOverridesToJson(ConfigOverrides instance) =>
    <String, dynamic>{
      'blocklist': instance.blocklist,
      'blocklist_behavior':
          _$ConfigOverridesBlocklistBehaviorEnumMap[instance.blocklistBehavior],
      'commands': instance.commands,
      'count_messages': instance.countMessages,
      'grants': instance.grants,
      'max_message_length': instance.maxMessageLength,
      'quotes': instance.quotes,
      'reactions': instance.reactions,
      'replies': instance.replies,
      'shared_locations': instance.sharedLocations,
      'typing_events': instance.typingEvents,
      'uploads': instance.uploads,
      'url_enrichment': instance.urlEnrichment,
      'user_message_reminders': instance.userMessageReminders,
    };

const _$ConfigOverridesBlocklistBehaviorEnumMap = {
  ConfigOverridesBlocklistBehavior.block: 'block',
  ConfigOverridesBlocklistBehavior.flag: 'flag',
  ConfigOverridesBlocklistBehavior.unknown: '_unknown',
};

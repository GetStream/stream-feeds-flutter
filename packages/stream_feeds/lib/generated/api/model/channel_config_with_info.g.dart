// Code generated by GetStream internal OpenAPI code generator. DO NOT EDIT.

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: use_string_in_part_of_directives
// ignore_for_file: unnecessary_raw_strings
// ignore_for_file: unnecessary_null_in_if_null_operators
// ignore_for_file: public_member_api_docs
// ignore_for_file: prefer_single_quotes
// ignore_for_file: require_trailing_commas

part of openapi.api;

enum ChannelConfigWithInfoAutomodEnum {
  aI('AI'),
  disabled('disabled'),
  simple('simple'),
  unknown('_unknown');

  const ChannelConfigWithInfoAutomodEnum(this.value);
  final String value;

  static ChannelConfigWithInfoAutomodEnum? fromValue(String? json) {
    switch (json) {
      case null:
        return null;
      case 'AI':
        return ChannelConfigWithInfoAutomodEnum.aI;
      case 'disabled':
        return ChannelConfigWithInfoAutomodEnum.disabled;
      case 'simple':
        return ChannelConfigWithInfoAutomodEnum.simple;
      default:
        return ChannelConfigWithInfoAutomodEnum.unknown;
    }
  }
}

enum ChannelConfigWithInfoAutomodBehaviorEnum {
  block('block'),
  flag('flag'),
  shadowBlock('shadow_block'),
  unknown('_unknown');

  const ChannelConfigWithInfoAutomodBehaviorEnum(this.value);
  final String value;

  static ChannelConfigWithInfoAutomodBehaviorEnum? fromValue(String? json) {
    switch (json) {
      case null:
        return null;
      case 'block':
        return ChannelConfigWithInfoAutomodBehaviorEnum.block;
      case 'flag':
        return ChannelConfigWithInfoAutomodBehaviorEnum.flag;
      case 'shadow_block':
        return ChannelConfigWithInfoAutomodBehaviorEnum.shadowBlock;
      default:
        return ChannelConfigWithInfoAutomodBehaviorEnum.unknown;
    }
  }
}

enum ChannelConfigWithInfoBlocklistBehaviorEnum {
  block('block'),
  flag('flag'),
  shadowBlock('shadow_block'),
  unknown('_unknown');

  const ChannelConfigWithInfoBlocklistBehaviorEnum(this.value);
  final String value;

  static ChannelConfigWithInfoBlocklistBehaviorEnum? fromValue(String? json) {
    switch (json) {
      case null:
        return null;
      case 'block':
        return ChannelConfigWithInfoBlocklistBehaviorEnum.block;
      case 'flag':
        return ChannelConfigWithInfoBlocklistBehaviorEnum.flag;
      case 'shadow_block':
        return ChannelConfigWithInfoBlocklistBehaviorEnum.shadowBlock;
      default:
        return ChannelConfigWithInfoBlocklistBehaviorEnum.unknown;
    }
  }
}

@immutable
class ChannelConfigWithInfo {
  const ChannelConfigWithInfo({
    this.allowedFlagReasons,
    required this.automod,
    required this.automodBehavior,
    this.automodThresholds,
    this.blocklist,
    this.blocklistBehavior,
    this.blocklists,
    required this.commands,
    required this.connectEvents,
    required this.createdAt,
    required this.customEvents,
    this.grants,
    required this.markMessagesPending,
    required this.maxMessageLength,
    required this.mutes,
    required this.name,
    this.partitionSize,
    this.partitionTtl,
    required this.polls,
    required this.pushNotifications,
    required this.quotes,
    required this.reactions,
    required this.readEvents,
    required this.reminders,
    required this.replies,
    required this.search,
    required this.sharedLocations,
    required this.skipLastMsgUpdateForSystemMsgs,
    required this.typingEvents,
    required this.updatedAt,
    required this.uploads,
    required this.urlEnrichment,
    required this.userMessageReminders,
  });

  final List<String>? allowedFlagReasons;

  final ChannelConfigWithInfoAutomodEnum automod;

  final ChannelConfigWithInfoAutomodBehaviorEnum automodBehavior;

  final Thresholds? automodThresholds;

  final String? blocklist;

  final ChannelConfigWithInfoBlocklistBehaviorEnum? blocklistBehavior;

  final List<BlockListOptions>? blocklists;

  final List<Command> commands;

  final bool connectEvents;

  final DateTime createdAt;

  final bool customEvents;

  final Map<String, List<String>>? grants;

  final bool markMessagesPending;

  final int maxMessageLength;

  final bool mutes;

  final String name;

  final int? partitionSize;

  final String? partitionTtl;

  final bool polls;

  final bool pushNotifications;

  final bool quotes;

  final bool reactions;

  final bool readEvents;

  final bool reminders;

  final bool replies;

  final bool search;

  final bool sharedLocations;

  final bool skipLastMsgUpdateForSystemMsgs;

  final bool typingEvents;

  final DateTime updatedAt;

  final bool uploads;

  final bool urlEnrichment;

  final bool userMessageReminders;

  Map<String, dynamic> toJson() {
    return {
      'allowed_flag_reasons': allowedFlagReasons,
      'automod': automod,
      'automod_behavior': automodBehavior,
      'automod_thresholds': automodThresholds,
      'blocklist': blocklist,
      'blocklist_behavior': blocklistBehavior,
      'blocklists': blocklists,
      'commands': commands,
      'connect_events': connectEvents,
      'created_at': createdAt,
      'custom_events': customEvents,
      'grants': grants,
      'mark_messages_pending': markMessagesPending,
      'max_message_length': maxMessageLength,
      'mutes': mutes,
      'name': name,
      'partition_size': partitionSize,
      'partition_ttl': partitionTtl,
      'polls': polls,
      'push_notifications': pushNotifications,
      'quotes': quotes,
      'reactions': reactions,
      'read_events': readEvents,
      'reminders': reminders,
      'replies': replies,
      'search': search,
      'shared_locations': sharedLocations,
      'skip_last_msg_update_for_system_msgs': skipLastMsgUpdateForSystemMsgs,
      'typing_events': typingEvents,
      'updated_at': updatedAt,
      'uploads': uploads,
      'url_enrichment': urlEnrichment,
      'user_message_reminders': userMessageReminders,
    };
  }

  static ChannelConfigWithInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return ChannelConfigWithInfo(
        allowedFlagReasons: json[r'allowed_flag_reasons'] is Iterable
            ? (json[r'allowed_flag_reasons'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        automod: ChannelConfigWithInfoAutomodEnum.fromValue(json['automod'])!,
        automodBehavior: ChannelConfigWithInfoAutomodBehaviorEnum.fromValue(
            json['automod_behavior'])!,
        automodThresholds:
            Thresholds.fromJson(json[r'automod_thresholds'] ?? null),
        blocklist: mapValueOfType<String>(json, r'blocklist', null),
        blocklistBehavior: ChannelConfigWithInfoBlocklistBehaviorEnum.fromValue(
            json['blocklist_behavior']),
        blocklists: BlockListOptions.listFromJson(json[r'blocklists']),
        commands: Command.listFromJson(json[r'commands']),
        connectEvents: mapValueOfType<bool>(json, r'connect_events')!,
        createdAt: mapValueOfType<DateTime>(json, r'created_at')!,
        customEvents: mapValueOfType<bool>(json, r'custom_events')!,
        grants: mapCastOfType<String, List<String>>(json, r'grants'),
        markMessagesPending:
            mapValueOfType<bool>(json, r'mark_messages_pending')!,
        maxMessageLength: mapValueOfType<int>(json, r'max_message_length')!,
        mutes: mapValueOfType<bool>(json, r'mutes')!,
        name: mapValueOfType<String>(json, r'name')!,
        partitionSize: mapValueOfType<int>(json, r'partition_size', null),
        partitionTtl: mapValueOfType<String>(json, r'partition_ttl', null),
        polls: mapValueOfType<bool>(json, r'polls')!,
        pushNotifications: mapValueOfType<bool>(json, r'push_notifications')!,
        quotes: mapValueOfType<bool>(json, r'quotes')!,
        reactions: mapValueOfType<bool>(json, r'reactions')!,
        readEvents: mapValueOfType<bool>(json, r'read_events')!,
        reminders: mapValueOfType<bool>(json, r'reminders')!,
        replies: mapValueOfType<bool>(json, r'replies')!,
        search: mapValueOfType<bool>(json, r'search')!,
        sharedLocations: mapValueOfType<bool>(json, r'shared_locations')!,
        skipLastMsgUpdateForSystemMsgs: mapValueOfType<bool>(
            json, r'skip_last_msg_update_for_system_msgs')!,
        typingEvents: mapValueOfType<bool>(json, r'typing_events')!,
        updatedAt: mapValueOfType<DateTime>(json, r'updated_at')!,
        uploads: mapValueOfType<bool>(json, r'uploads')!,
        urlEnrichment: mapValueOfType<bool>(json, r'url_enrichment')!,
        userMessageReminders:
            mapValueOfType<bool>(json, r'user_message_reminders')!,
      );
    }
    return null;
  }

  static List<ChannelConfigWithInfo> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ChannelConfigWithInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChannelConfigWithInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  @override
  String toString() {
    return 'ChannelConfigWithInfo('
        'allowedFlagReasons: $allowedFlagReasons, '
        'automod: $automod, '
        'automodBehavior: $automodBehavior, '
        'automodThresholds: $automodThresholds, '
        'blocklist: $blocklist, '
        'blocklistBehavior: $blocklistBehavior, '
        'blocklists: $blocklists, '
        'commands: $commands, '
        'connectEvents: $connectEvents, '
        'createdAt: $createdAt, '
        'customEvents: $customEvents, '
        'grants: $grants, '
        'markMessagesPending: $markMessagesPending, '
        'maxMessageLength: $maxMessageLength, '
        'mutes: $mutes, '
        'name: $name, '
        'partitionSize: $partitionSize, '
        'partitionTtl: $partitionTtl, '
        'polls: $polls, '
        'pushNotifications: $pushNotifications, '
        'quotes: $quotes, '
        'reactions: $reactions, '
        'readEvents: $readEvents, '
        'reminders: $reminders, '
        'replies: $replies, '
        'search: $search, '
        'sharedLocations: $sharedLocations, '
        'skipLastMsgUpdateForSystemMsgs: $skipLastMsgUpdateForSystemMsgs, '
        'typingEvents: $typingEvents, '
        'updatedAt: $updatedAt, '
        'uploads: $uploads, '
        'urlEnrichment: $urlEnrichment, '
        'userMessageReminders: $userMessageReminders, '
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelConfigWithInfo &&
        other.allowedFlagReasons == allowedFlagReasons &&
        other.automod == automod &&
        other.automodBehavior == automodBehavior &&
        other.automodThresholds == automodThresholds &&
        other.blocklist == blocklist &&
        other.blocklistBehavior == blocklistBehavior &&
        other.blocklists == blocklists &&
        other.commands == commands &&
        other.connectEvents == connectEvents &&
        other.createdAt == createdAt &&
        other.customEvents == customEvents &&
        other.grants == grants &&
        other.markMessagesPending == markMessagesPending &&
        other.maxMessageLength == maxMessageLength &&
        other.mutes == mutes &&
        other.name == name &&
        other.partitionSize == partitionSize &&
        other.partitionTtl == partitionTtl &&
        other.polls == polls &&
        other.pushNotifications == pushNotifications &&
        other.quotes == quotes &&
        other.reactions == reactions &&
        other.readEvents == readEvents &&
        other.reminders == reminders &&
        other.replies == replies &&
        other.search == search &&
        other.sharedLocations == sharedLocations &&
        other.skipLastMsgUpdateForSystemMsgs ==
            skipLastMsgUpdateForSystemMsgs &&
        other.typingEvents == typingEvents &&
        other.updatedAt == updatedAt &&
        other.uploads == uploads &&
        other.urlEnrichment == urlEnrichment &&
        other.userMessageReminders == userMessageReminders;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      allowedFlagReasons,
      automod,
      automodBehavior,
      automodThresholds,
      blocklist,
      blocklistBehavior,
      blocklists,
      commands,
      connectEvents,
      createdAt,
      customEvents,
      grants,
      markMessagesPending,
      maxMessageLength,
      mutes,
      name,
      partitionSize,
      partitionTtl,
      polls,
      pushNotifications,
      quotes,
      reactions,
      readEvents,
      reminders,
      replies,
      search,
      sharedLocations,
      skipLastMsgUpdateForSystemMsgs,
      typingEvents,
      updatedAt,
      uploads,
      urlEnrichment,
      userMessageReminders,
    ]);
  }
}

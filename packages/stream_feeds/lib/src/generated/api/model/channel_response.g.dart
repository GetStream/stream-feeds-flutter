// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelResponse _$ChannelResponseFromJson(
  Map<String, dynamic> json,
) => ChannelResponse(
  autoTranslationEnabled: json['auto_translation_enabled'] as bool?,
  autoTranslationLanguage: json['auto_translation_language'] as String?,
  blocked: json['blocked'] as bool?,
  cid: json['cid'] as String,
  config: json['config'] == null ? null : ChannelConfigWithInfo.fromJson(json['config'] as Map<String, dynamic>),
  cooldown: (json['cooldown'] as num?)?.toInt(),
  createdAt: const EpochDateTimeConverter().fromJson(
    (json['created_at'] as num).toInt(),
  ),
  createdBy: json['created_by'] == null ? null : UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
  custom: json['custom'] as Map<String, dynamic>,
  deletedAt: _$JsonConverterFromJson<int, DateTime>(
    json['deleted_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  disabled: json['disabled'] as bool,
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  frozen: json['frozen'] as bool,
  hidden: json['hidden'] as bool?,
  hideMessagesBefore: _$JsonConverterFromJson<int, DateTime>(
    json['hide_messages_before'],
    const EpochDateTimeConverter().fromJson,
  ),
  id: json['id'] as String,
  lastMessageAt: _$JsonConverterFromJson<int, DateTime>(
    json['last_message_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  memberCount: (json['member_count'] as num?)?.toInt(),
  members: (json['members'] as List<dynamic>?)
      ?.map((e) => ChannelMemberResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  messageCount: (json['message_count'] as num?)?.toInt(),
  muteExpiresAt: _$JsonConverterFromJson<int, DateTime>(
    json['mute_expires_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  muted: json['muted'] as bool?,
  ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
      ?.map(
        (e) => $enumDecode(
          _$ChannelResponseOwnCapabilitiesEnumMap,
          e,
          unknownValue: ChannelResponseOwnCapabilities.unknown,
        ),
      )
      .toList(),
  team: json['team'] as String?,
  truncatedAt: _$JsonConverterFromJson<int, DateTime>(
    json['truncated_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  truncatedBy: json['truncated_by'] == null
      ? null
      : UserResponse.fromJson(json['truncated_by'] as Map<String, dynamic>),
  type: json['type'] as String,
  updatedAt: const EpochDateTimeConverter().fromJson(
    (json['updated_at'] as num).toInt(),
  ),
);

Map<String, dynamic> _$ChannelResponseToJson(ChannelResponse instance) => <String, dynamic>{
  'auto_translation_enabled': instance.autoTranslationEnabled,
  'auto_translation_language': instance.autoTranslationLanguage,
  'blocked': instance.blocked,
  'cid': instance.cid,
  'config': instance.config?.toJson(),
  'cooldown': instance.cooldown,
  'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy?.toJson(),
  'custom': instance.custom,
  'deleted_at': _$JsonConverterToJson<int, DateTime>(
    instance.deletedAt,
    const EpochDateTimeConverter().toJson,
  ),
  'disabled': instance.disabled,
  'filter_tags': instance.filterTags,
  'frozen': instance.frozen,
  'hidden': instance.hidden,
  'hide_messages_before': _$JsonConverterToJson<int, DateTime>(
    instance.hideMessagesBefore,
    const EpochDateTimeConverter().toJson,
  ),
  'id': instance.id,
  'last_message_at': _$JsonConverterToJson<int, DateTime>(
    instance.lastMessageAt,
    const EpochDateTimeConverter().toJson,
  ),
  'member_count': instance.memberCount,
  'members': instance.members?.map((e) => e.toJson()).toList(),
  'message_count': instance.messageCount,
  'mute_expires_at': _$JsonConverterToJson<int, DateTime>(
    instance.muteExpiresAt,
    const EpochDateTimeConverter().toJson,
  ),
  'muted': instance.muted,
  'own_capabilities': instance.ownCapabilities?.map((e) => _$ChannelResponseOwnCapabilitiesEnumMap[e]!).toList(),
  'team': instance.team,
  'truncated_at': _$JsonConverterToJson<int, DateTime>(
    instance.truncatedAt,
    const EpochDateTimeConverter().toJson,
  ),
  'truncated_by': instance.truncatedBy?.toJson(),
  'type': instance.type,
  'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$ChannelResponseOwnCapabilitiesEnumMap = {
  ChannelResponseOwnCapabilities.banChannelMembers: 'ban-channel-members',
  ChannelResponseOwnCapabilities.castPollVote: 'cast-poll-vote',
  ChannelResponseOwnCapabilities.connectEvents: 'connect-events',
  ChannelResponseOwnCapabilities.createAttachment: 'create-attachment',
  ChannelResponseOwnCapabilities.deleteAnyMessage: 'delete-any-message',
  ChannelResponseOwnCapabilities.deleteChannel: 'delete-channel',
  ChannelResponseOwnCapabilities.deleteOwnMessage: 'delete-own-message',
  ChannelResponseOwnCapabilities.deliveryEvents: 'delivery-events',
  ChannelResponseOwnCapabilities.flagMessage: 'flag-message',
  ChannelResponseOwnCapabilities.freezeChannel: 'freeze-channel',
  ChannelResponseOwnCapabilities.joinChannel: 'join-channel',
  ChannelResponseOwnCapabilities.leaveChannel: 'leave-channel',
  ChannelResponseOwnCapabilities.muteChannel: 'mute-channel',
  ChannelResponseOwnCapabilities.notifyChannel: 'notify-channel',
  ChannelResponseOwnCapabilities.notifyGroup: 'notify-group',
  ChannelResponseOwnCapabilities.notifyHere: 'notify-here',
  ChannelResponseOwnCapabilities.notifyRole: 'notify-role',
  ChannelResponseOwnCapabilities.pinMessage: 'pin-message',
  ChannelResponseOwnCapabilities.queryPollVotes: 'query-poll-votes',
  ChannelResponseOwnCapabilities.quoteMessage: 'quote-message',
  ChannelResponseOwnCapabilities.readEvents: 'read-events',
  ChannelResponseOwnCapabilities.searchMessages: 'search-messages',
  ChannelResponseOwnCapabilities.sendCustomEvents: 'send-custom-events',
  ChannelResponseOwnCapabilities.sendLinks: 'send-links',
  ChannelResponseOwnCapabilities.sendMessage: 'send-message',
  ChannelResponseOwnCapabilities.sendPoll: 'send-poll',
  ChannelResponseOwnCapabilities.sendReaction: 'send-reaction',
  ChannelResponseOwnCapabilities.sendReply: 'send-reply',
  ChannelResponseOwnCapabilities.sendRestrictedVisibilityMessage: 'send-restricted-visibility-message',
  ChannelResponseOwnCapabilities.sendTypingEvents: 'send-typing-events',
  ChannelResponseOwnCapabilities.setChannelCooldown: 'set-channel-cooldown',
  ChannelResponseOwnCapabilities.shareLocation: 'share-location',
  ChannelResponseOwnCapabilities.skipSlowMode: 'skip-slow-mode',
  ChannelResponseOwnCapabilities.slowMode: 'slow-mode',
  ChannelResponseOwnCapabilities.typingEvents: 'typing-events',
  ChannelResponseOwnCapabilities.updateAnyMessage: 'update-any-message',
  ChannelResponseOwnCapabilities.updateChannel: 'update-channel',
  ChannelResponseOwnCapabilities.updateChannelMembers: 'update-channel-members',
  ChannelResponseOwnCapabilities.updateOwnMessage: 'update-own-message',
  ChannelResponseOwnCapabilities.updateThread: 'update-thread',
  ChannelResponseOwnCapabilities.uploadFile: 'upload-file',
  ChannelResponseOwnCapabilities.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

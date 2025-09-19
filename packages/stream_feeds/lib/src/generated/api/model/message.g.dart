// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      beforeMessageSendFailed: json['before_message_send_failed'] as bool?,
      cid: json['cid'] as String,
      command: json['command'] as String?,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      deletedForMe: json['deleted_for_me'] as bool?,
      deletedReplyCount: (json['deleted_reply_count'] as num).toInt(),
      html: json['html'] as String,
      i18n: (json['i18n'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      id: json['id'] as String,
      imageLabels: (json['image_labels'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      latestReactions: (json['latest_reactions'] as List<dynamic>)
          .map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      member: json['member'] == null
          ? null
          : ChannelMember.fromJson(json['member'] as Map<String, dynamic>),
      mentionedUsers: (json['mentioned_users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageTextUpdatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['message_text_updated_at'],
          const EpochDateTimeConverter().fromJson),
      mml: json['mml'] as String?,
      moderation: json['moderation'] == null
          ? null
          : ModerationV2Response.fromJson(
              json['moderation'] as Map<String, dynamic>),
      ownReactions: (json['own_reactions'] as List<dynamic>)
          .map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: json['parent_id'] as String?,
      pinExpires: _$JsonConverterFromJson<int, DateTime>(
          json['pin_expires'], const EpochDateTimeConverter().fromJson),
      pinned: json['pinned'] as bool,
      pinnedAt: _$JsonConverterFromJson<int, DateTime>(
          json['pinned_at'], const EpochDateTimeConverter().fromJson),
      pinnedBy: json['pinned_by'] == null
          ? null
          : User.fromJson(json['pinned_by'] as Map<String, dynamic>),
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      pollId: json['poll_id'] as String?,
      quotedMessage: json['quoted_message'] == null
          ? null
          : Message.fromJson(json['quoted_message'] as Map<String, dynamic>),
      quotedMessageId: json['quoted_message_id'] as String?,
      reactionCounts: Map<String, int>.from(json['reaction_counts'] as Map),
      reactionGroups: (json['reaction_groups'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, ReactionGroupResponse.fromJson(e as Map<String, dynamic>)),
      ),
      reactionScores: Map<String, int>.from(json['reaction_scores'] as Map),
      reminder: json['reminder'] == null
          ? null
          : MessageReminder.fromJson(json['reminder'] as Map<String, dynamic>),
      replyCount: (json['reply_count'] as num).toInt(),
      restrictedVisibility: (json['restricted_visibility'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      shadowed: json['shadowed'] as bool,
      sharedLocation: json['shared_location'] == null
          ? null
          : SharedLocation.fromJson(
              json['shared_location'] as Map<String, dynamic>),
      showInChannel: json['show_in_channel'] as bool?,
      silent: json['silent'] as bool,
      text: json['text'] as String,
      threadParticipants: (json['thread_participants'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'attachments': instance.attachments.map((e) => e.toJson()).toList(),
      'before_message_send_failed': instance.beforeMessageSendFailed,
      'cid': instance.cid,
      'command': instance.command,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'deleted_for_me': instance.deletedForMe,
      'deleted_reply_count': instance.deletedReplyCount,
      'html': instance.html,
      'i18n': instance.i18n,
      'id': instance.id,
      'image_labels': instance.imageLabels,
      'latest_reactions':
          instance.latestReactions.map((e) => e.toJson()).toList(),
      'member': instance.member?.toJson(),
      'mentioned_users':
          instance.mentionedUsers.map((e) => e.toJson()).toList(),
      'message_text_updated_at': _$JsonConverterToJson<int, DateTime>(
          instance.messageTextUpdatedAt, const EpochDateTimeConverter().toJson),
      'mml': instance.mml,
      'moderation': instance.moderation?.toJson(),
      'own_reactions': instance.ownReactions.map((e) => e.toJson()).toList(),
      'parent_id': instance.parentId,
      'pin_expires': _$JsonConverterToJson<int, DateTime>(
          instance.pinExpires, const EpochDateTimeConverter().toJson),
      'pinned': instance.pinned,
      'pinned_at': _$JsonConverterToJson<int, DateTime>(
          instance.pinnedAt, const EpochDateTimeConverter().toJson),
      'pinned_by': instance.pinnedBy?.toJson(),
      'poll': instance.poll?.toJson(),
      'poll_id': instance.pollId,
      'quoted_message': instance.quotedMessage?.toJson(),
      'quoted_message_id': instance.quotedMessageId,
      'reaction_counts': instance.reactionCounts,
      'reaction_groups':
          instance.reactionGroups.map((k, e) => MapEntry(k, e.toJson())),
      'reaction_scores': instance.reactionScores,
      'reminder': instance.reminder?.toJson(),
      'reply_count': instance.replyCount,
      'restricted_visibility': instance.restrictedVisibility,
      'shadowed': instance.shadowed,
      'shared_location': instance.sharedLocation?.toJson(),
      'show_in_channel': instance.showInChannel,
      'silent': instance.silent,
      'text': instance.text,
      'thread_participants':
          instance.threadParticipants?.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
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

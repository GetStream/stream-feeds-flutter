// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMember _$ChannelMemberFromJson(Map<String, dynamic> json) =>
    ChannelMember(
      archivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['archived_at'], const EpochDateTimeConverter().fromJson),
      banExpires: _$JsonConverterFromJson<int, DateTime>(
          json['ban_expires'], const EpochDateTimeConverter().fromJson),
      banned: json['banned'] as bool,
      channelRole: json['channel_role'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      inviteAcceptedAt: _$JsonConverterFromJson<int, DateTime>(
          json['invite_accepted_at'], const EpochDateTimeConverter().fromJson),
      inviteRejectedAt: _$JsonConverterFromJson<int, DateTime>(
          json['invite_rejected_at'], const EpochDateTimeConverter().fromJson),
      invited: json['invited'] as bool?,
      isModerator: json['is_moderator'] as bool?,
      notificationsMuted: json['notifications_muted'] as bool,
      pinnedAt: _$JsonConverterFromJson<int, DateTime>(
          json['pinned_at'], const EpochDateTimeConverter().fromJson),
      role: $enumDecodeNullable(_$ChannelMemberRoleEnumMap, json['role'],
          unknownValue: ChannelMemberRole.unknown),
      shadowBanned: json['shadow_banned'] as bool,
      status: json['status'] as String?,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$ChannelMemberToJson(ChannelMember instance) =>
    <String, dynamic>{
      'archived_at': _$JsonConverterToJson<int, DateTime>(
          instance.archivedAt, const EpochDateTimeConverter().toJson),
      'ban_expires': _$JsonConverterToJson<int, DateTime>(
          instance.banExpires, const EpochDateTimeConverter().toJson),
      'banned': instance.banned,
      'channel_role': instance.channelRole,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'invite_accepted_at': _$JsonConverterToJson<int, DateTime>(
          instance.inviteAcceptedAt, const EpochDateTimeConverter().toJson),
      'invite_rejected_at': _$JsonConverterToJson<int, DateTime>(
          instance.inviteRejectedAt, const EpochDateTimeConverter().toJson),
      'invited': instance.invited,
      'is_moderator': instance.isModerator,
      'notifications_muted': instance.notificationsMuted,
      'pinned_at': _$JsonConverterToJson<int, DateTime>(
          instance.pinnedAt, const EpochDateTimeConverter().toJson),
      'role': _$ChannelMemberRoleEnumMap[instance.role],
      'shadow_banned': instance.shadowBanned,
      'status': instance.status,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ChannelMemberRoleEnumMap = {
  ChannelMemberRole.admin: 'admin',
  ChannelMemberRole.member: 'member',
  ChannelMemberRole.moderator: 'moderator',
  ChannelMemberRole.owner: 'owner',
  ChannelMemberRole.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

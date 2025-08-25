// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnUserResponse _$OwnUserResponseFromJson(Map<String, dynamic> json) =>
    OwnUserResponse(
      avgResponseTime: (json['avg_response_time'] as num?)?.toInt(),
      banned: json['banned'] as bool,
      blockedUserIds: (json['blocked_user_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      channelMutes: (json['channel_mutes'] as List<dynamic>)
          .map((e) => ChannelMute.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      deactivatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deactivated_at'], const EpochDateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => DeviceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      image: json['image'] as String?,
      invisible: json['invisible'] as bool,
      language: json['language'] as String,
      lastActive: _$JsonConverterFromJson<int, DateTime>(
          json['last_active'], const EpochDateTimeConverter().fromJson),
      latestHiddenChannels: (json['latest_hidden_channels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mutes: (json['mutes'] as List<dynamic>)
          .map((e) => UserMuteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      online: json['online'] as bool,
      privacySettings: json['privacy_settings'] == null
          ? null
          : PrivacySettingsResponse.fromJson(
              json['privacy_settings'] as Map<String, dynamic>),
      pushPreferences: json['push_preferences'] == null
          ? null
          : PushPreferences.fromJson(
              json['push_preferences'] as Map<String, dynamic>),
      revokeTokensIssuedBefore: _$JsonConverterFromJson<int, DateTime>(
          json['revoke_tokens_issued_before'],
          const EpochDateTimeConverter().fromJson),
      role: json['role'] as String,
      teams: (json['teams'] as List<dynamic>).map((e) => e as String).toList(),
      teamsRole: (json['teams_role'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      totalUnreadCount: (json['total_unread_count'] as num).toInt(),
      totalUnreadCountByTeam:
          (json['total_unread_count_by_team'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      unreadChannels: (json['unread_channels'] as num).toInt(),
      unreadCount: (json['unread_count'] as num).toInt(),
      unreadThreads: (json['unread_threads'] as num).toInt(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$OwnUserResponseToJson(OwnUserResponse instance) =>
    <String, dynamic>{
      'avg_response_time': instance.avgResponseTime,
      'banned': instance.banned,
      'blocked_user_ids': instance.blockedUserIds,
      'channel_mutes': instance.channelMutes.map((e) => e.toJson()).toList(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'deactivated_at': _$JsonConverterToJson<int, DateTime>(
          instance.deactivatedAt, const EpochDateTimeConverter().toJson),
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'devices': instance.devices.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'image': instance.image,
      'invisible': instance.invisible,
      'language': instance.language,
      'last_active': _$JsonConverterToJson<int, DateTime>(
          instance.lastActive, const EpochDateTimeConverter().toJson),
      'latest_hidden_channels': instance.latestHiddenChannels,
      'mutes': instance.mutes.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'online': instance.online,
      'privacy_settings': instance.privacySettings?.toJson(),
      'push_preferences': instance.pushPreferences?.toJson(),
      'revoke_tokens_issued_before': _$JsonConverterToJson<int, DateTime>(
          instance.revokeTokensIssuedBefore,
          const EpochDateTimeConverter().toJson),
      'role': instance.role,
      'teams': instance.teams,
      'teams_role': instance.teamsRole,
      'total_unread_count': instance.totalUnreadCount,
      'total_unread_count_by_team': instance.totalUnreadCountByTeam,
      'unread_channels': instance.unreadChannels,
      'unread_count': instance.unreadCount,
      'unread_threads': instance.unreadThreads,
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

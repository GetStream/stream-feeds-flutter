// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      appPK: (json['app_p_k'] as num).toInt(),
      backstage: json['backstage'] as bool,
      blockedUserIDs: (json['blocked_user_i_ds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      blockedUsers: (json['blocked_users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      cID: json['c_i_d'] as String,
      callType: json['call_type'] == null
          ? null
          : CallType.fromJson(json['call_type'] as Map<String, dynamic>),
      channelCID: json['channel_c_i_d'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      createdByUserID: json['created_by_user_i_d'] as String,
      currentSessionID: json['current_session_i_d'] as String,
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      egressUpdatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['egress_updated_at'], const EpochDateTimeConverter().fromJson),
      egresses: (json['egresses'] as List<dynamic>)
          .map((e) => CallEgress.fromJson(e as Map<String, dynamic>))
          .toList(),
      endedAt: _$JsonConverterFromJson<int, DateTime>(
          json['ended_at'], const EpochDateTimeConverter().fromJson),
      iD: json['i_d'] as String,
      joinAheadTimeSeconds: (json['join_ahead_time_seconds'] as num?)?.toInt(),
      lastHeartbeatAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_heartbeat_at'], const EpochDateTimeConverter().fromJson),
      lastSessionID: json['last_session_i_d'] as String,
      memberCount: (json['member_count'] as num?)?.toInt(),
      memberLookup: json['member_lookup'] == null
          ? null
          : MemberLookup.fromJson(
              json['member_lookup'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => CallMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      session: json['session'] == null
          ? null
          : CallSession.fromJson(json['session'] as Map<String, dynamic>),
      settings: json['settings'] == null
          ? null
          : CallSettings.fromJson(json['settings'] as Map<String, dynamic>),
      settingsOverrides: json['settings_overrides'] == null
          ? null
          : CallSettings.fromJson(
              json['settings_overrides'] as Map<String, dynamic>),
      startsAt: _$JsonConverterFromJson<int, DateTime>(
          json['starts_at'], const EpochDateTimeConverter().fromJson),
      team: json['team'] as String,
      thumbnailURL: json['thumbnail_u_r_l'] as String,
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'app_p_k': instance.appPK,
      'backstage': instance.backstage,
      'blocked_user_i_ds': instance.blockedUserIDs,
      'blocked_users': instance.blockedUsers.map((e) => e.toJson()).toList(),
      'c_i_d': instance.cID,
      'call_type': instance.callType?.toJson(),
      'channel_c_i_d': instance.channelCID,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy?.toJson(),
      'created_by_user_i_d': instance.createdByUserID,
      'current_session_i_d': instance.currentSessionID,
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'egress_updated_at': _$JsonConverterToJson<int, DateTime>(
          instance.egressUpdatedAt, const EpochDateTimeConverter().toJson),
      'egresses': instance.egresses.map((e) => e.toJson()).toList(),
      'ended_at': _$JsonConverterToJson<int, DateTime>(
          instance.endedAt, const EpochDateTimeConverter().toJson),
      'i_d': instance.iD,
      'join_ahead_time_seconds': instance.joinAheadTimeSeconds,
      'last_heartbeat_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastHeartbeatAt, const EpochDateTimeConverter().toJson),
      'last_session_i_d': instance.lastSessionID,
      'member_count': instance.memberCount,
      'member_lookup': instance.memberLookup?.toJson(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'session': instance.session?.toJson(),
      'settings': instance.settings?.toJson(),
      'settings_overrides': instance.settingsOverrides?.toJson(),
      'starts_at': _$JsonConverterToJson<int, DateTime>(
          instance.startsAt, const EpochDateTimeConverter().toJson),
      'team': instance.team,
      'thumbnail_u_r_l': instance.thumbnailURL,
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

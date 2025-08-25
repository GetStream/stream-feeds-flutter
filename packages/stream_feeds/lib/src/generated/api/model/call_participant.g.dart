// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallParticipant _$CallParticipantFromJson(Map<String, dynamic> json) =>
    CallParticipant(
      avgResponseTime: (json['avg_response_time'] as num?)?.toInt(),
      banExpires: _$JsonConverterFromJson<int, DateTime>(
          json['ban_expires'], const EpochDateTimeConverter().fromJson),
      banned: json['banned'] as bool,
      createdAt: _$JsonConverterFromJson<int, DateTime>(
          json['created_at'], const EpochDateTimeConverter().fromJson),
      custom: json['custom'] as Map<String, dynamic>,
      deactivatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deactivated_at'], const EpochDateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String,
      invisible: json['invisible'] as bool?,
      joinedAt: const EpochDateTimeConverter()
          .fromJson((json['joined_at'] as num).toInt()),
      language: json['language'] as String?,
      lastActive: _$JsonConverterFromJson<int, DateTime>(
          json['last_active'], const EpochDateTimeConverter().fromJson),
      lastEngagedAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_engaged_at'], const EpochDateTimeConverter().fromJson),
      online: json['online'] as bool,
      privacySettings: json['privacy_settings'] == null
          ? null
          : PrivacySettings.fromJson(
              json['privacy_settings'] as Map<String, dynamic>),
      revokeTokensIssuedBefore: _$JsonConverterFromJson<int, DateTime>(
          json['revoke_tokens_issued_before'],
          const EpochDateTimeConverter().fromJson),
      role: json['role'] as String,
      teams:
          (json['teams'] as List<dynamic>?)?.map((e) => e as String).toList(),
      teamsRole: Map<String, String>.from(json['teams_role'] as Map),
      updatedAt: _$JsonConverterFromJson<int, DateTime>(
          json['updated_at'], const EpochDateTimeConverter().fromJson),
      userSessionID: json['user_session_i_d'] as String,
    );

Map<String, dynamic> _$CallParticipantToJson(CallParticipant instance) =>
    <String, dynamic>{
      'avg_response_time': instance.avgResponseTime,
      'ban_expires': _$JsonConverterToJson<int, DateTime>(
          instance.banExpires, const EpochDateTimeConverter().toJson),
      'banned': instance.banned,
      'created_at': _$JsonConverterToJson<int, DateTime>(
          instance.createdAt, const EpochDateTimeConverter().toJson),
      'custom': instance.custom,
      'deactivated_at': _$JsonConverterToJson<int, DateTime>(
          instance.deactivatedAt, const EpochDateTimeConverter().toJson),
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'id': instance.id,
      'invisible': instance.invisible,
      'joined_at': const EpochDateTimeConverter().toJson(instance.joinedAt),
      'language': instance.language,
      'last_active': _$JsonConverterToJson<int, DateTime>(
          instance.lastActive, const EpochDateTimeConverter().toJson),
      'last_engaged_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastEngagedAt, const EpochDateTimeConverter().toJson),
      'online': instance.online,
      'privacy_settings': instance.privacySettings?.toJson(),
      'revoke_tokens_issued_before': _$JsonConverterToJson<int, DateTime>(
          instance.revokeTokensIssuedBefore,
          const EpochDateTimeConverter().toJson),
      'role': instance.role,
      'teams': instance.teams,
      'teams_role': instance.teamsRole,
      'updated_at': _$JsonConverterToJson<int, DateTime>(
          instance.updatedAt, const EpochDateTimeConverter().toJson),
      'user_session_i_d': instance.userSessionID,
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

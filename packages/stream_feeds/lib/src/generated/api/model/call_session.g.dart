// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallSession _$CallSessionFromJson(Map<String, dynamic> json) => CallSession(
      acceptedBy: (json['accepted_by'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DateTime.parse(e as String)),
      ),
      activeSFUs: (json['active_s_f_us'] as List<dynamic>)
          .map((e) => SFUIDLastSeen.fromJson(e as Map<String, dynamic>))
          .toList(),
      anonymousParticipantCount:
          (json['anonymous_participant_count'] as num).toInt(),
      appPK: (json['app_p_k'] as num).toInt(),
      callID: json['call_i_d'] as String,
      callType: json['call_type'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      endedAt: _$JsonConverterFromJson<int, DateTime>(
          json['ended_at'], const EpochDateTimeConverter().fromJson),
      liveEndedAt: _$JsonConverterFromJson<int, DateTime>(
          json['live_ended_at'], const EpochDateTimeConverter().fromJson),
      liveStartedAt: _$JsonConverterFromJson<int, DateTime>(
          json['live_started_at'], const EpochDateTimeConverter().fromJson),
      missedBy: (json['missed_by'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DateTime.parse(e as String)),
      ),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => CallParticipant.fromJson(e as Map<String, dynamic>))
          .toList(),
      participantsCountByRole:
          Map<String, int>.from(json['participants_count_by_role'] as Map),
      rejectedBy: (json['rejected_by'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DateTime.parse(e as String)),
      ),
      ringAt: _$JsonConverterFromJson<int, DateTime>(
          json['ring_at'], const EpochDateTimeConverter().fromJson),
      sFUIDs: (json['s_f_u_i_ds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sessionID: json['session_i_d'] as String,
      startedAt: _$JsonConverterFromJson<int, DateTime>(
          json['started_at'], const EpochDateTimeConverter().fromJson),
      timerEndsAt: _$JsonConverterFromJson<int, DateTime>(
          json['timer_ends_at'], const EpochDateTimeConverter().fromJson),
      userPermissionOverrides:
          (json['user_permission_overrides'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Map<String, bool>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$CallSessionToJson(CallSession instance) =>
    <String, dynamic>{
      'accepted_by':
          instance.acceptedBy.map((k, e) => MapEntry(k, e.toIso8601String())),
      'active_s_f_us': instance.activeSFUs.map((e) => e.toJson()).toList(),
      'anonymous_participant_count': instance.anonymousParticipantCount,
      'app_p_k': instance.appPK,
      'call_i_d': instance.callID,
      'call_type': instance.callType,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'ended_at': _$JsonConverterToJson<int, DateTime>(
          instance.endedAt, const EpochDateTimeConverter().toJson),
      'live_ended_at': _$JsonConverterToJson<int, DateTime>(
          instance.liveEndedAt, const EpochDateTimeConverter().toJson),
      'live_started_at': _$JsonConverterToJson<int, DateTime>(
          instance.liveStartedAt, const EpochDateTimeConverter().toJson),
      'missed_by':
          instance.missedBy.map((k, e) => MapEntry(k, e.toIso8601String())),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'participants_count_by_role': instance.participantsCountByRole,
      'rejected_by':
          instance.rejectedBy.map((k, e) => MapEntry(k, e.toIso8601String())),
      'ring_at': _$JsonConverterToJson<int, DateTime>(
          instance.ringAt, const EpochDateTimeConverter().toJson),
      's_f_u_i_ds': instance.sFUIDs,
      'session_i_d': instance.sessionID,
      'started_at': _$JsonConverterToJson<int, DateTime>(
          instance.startedAt, const EpochDateTimeConverter().toJson),
      'timer_ends_at': _$JsonConverterToJson<int, DateTime>(
          instance.timerEndsAt, const EpochDateTimeConverter().toJson),
      'user_permission_overrides': instance.userPermissionOverrides,
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

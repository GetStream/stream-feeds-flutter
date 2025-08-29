// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallResponse _$CallResponseFromJson(Map<String, dynamic> json) => CallResponse(
      backstage: json['backstage'] as bool,
      blockedUserIds: (json['blocked_user_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      captioning: json['captioning'] as bool,
      channelCid: json['channel_cid'] as String?,
      cid: json['cid'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy:
          UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
      currentSessionId: json['current_session_id'] as String,
      custom: json['custom'] as Map<String, dynamic>,
      egress: EgressResponse.fromJson(json['egress'] as Map<String, dynamic>),
      endedAt: _$JsonConverterFromJson<int, DateTime>(
          json['ended_at'], const EpochDateTimeConverter().fromJson),
      id: json['id'] as String,
      ingress:
          CallIngressResponse.fromJson(json['ingress'] as Map<String, dynamic>),
      joinAheadTimeSeconds: (json['join_ahead_time_seconds'] as num?)?.toInt(),
      recording: json['recording'] as bool,
      session: json['session'] == null
          ? null
          : CallSessionResponse.fromJson(
              json['session'] as Map<String, dynamic>),
      settings: CallSettingsResponse.fromJson(
          json['settings'] as Map<String, dynamic>),
      startsAt: _$JsonConverterFromJson<int, DateTime>(
          json['starts_at'], const EpochDateTimeConverter().fromJson),
      team: json['team'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : ThumbnailResponse.fromJson(
              json['thumbnails'] as Map<String, dynamic>),
      transcribing: json['transcribing'] as bool,
      type: json['type'] as String,
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
    );

Map<String, dynamic> _$CallResponseToJson(CallResponse instance) =>
    <String, dynamic>{
      'backstage': instance.backstage,
      'blocked_user_ids': instance.blockedUserIds,
      'captioning': instance.captioning,
      'channel_cid': instance.channelCid,
      'cid': instance.cid,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy.toJson(),
      'current_session_id': instance.currentSessionId,
      'custom': instance.custom,
      'egress': instance.egress.toJson(),
      'ended_at': _$JsonConverterToJson<int, DateTime>(
          instance.endedAt, const EpochDateTimeConverter().toJson),
      'id': instance.id,
      'ingress': instance.ingress.toJson(),
      'join_ahead_time_seconds': instance.joinAheadTimeSeconds,
      'recording': instance.recording,
      'session': instance.session?.toJson(),
      'settings': instance.settings.toJson(),
      'starts_at': _$JsonConverterToJson<int, DateTime>(
          instance.startsAt, const EpochDateTimeConverter().toJson),
      'team': instance.team,
      'thumbnails': instance.thumbnails?.toJson(),
      'transcribing': instance.transcribing,
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

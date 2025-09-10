// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_banned_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBannedEvent _$UserBannedEventFromJson(Map<String, dynamic> json) =>
    UserBannedEvent(
      channelId: json['channel_id'] as String,
      channelType: json['channel_type'] as String,
      cid: json['cid'] as String,
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy: User.fromJson(json['created_by'] as Map<String, dynamic>),
      expiration: _$JsonConverterFromJson<int, DateTime>(
          json['expiration'], const EpochDateTimeConverter().fromJson),
      reason: json['reason'] as String?,
      shadow: json['shadow'] as bool,
      team: json['team'] as String?,
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBannedEventToJson(UserBannedEvent instance) =>
    <String, dynamic>{
      'channel_id': instance.channelId,
      'channel_type': instance.channelType,
      'cid': instance.cid,
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy.toJson(),
      'expiration': _$JsonConverterToJson<int, DateTime>(
          instance.expiration, const EpochDateTimeConverter().toJson),
      'reason': instance.reason,
      'shadow': instance.shadow,
      'team': instance.team,
      'type': instance.type,
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

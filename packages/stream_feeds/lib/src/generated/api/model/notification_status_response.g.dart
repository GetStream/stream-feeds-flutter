// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationStatusResponse _$NotificationStatusResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationStatusResponse(
      lastSeenAt: _$JsonConverterFromJson<int, DateTime>(
          json['last_seen_at'], const EpochDateTimeConverter().fromJson),
      readActivities: (json['read_activities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unread: (json['unread'] as num).toInt(),
      unseen: (json['unseen'] as num).toInt(),
    );

Map<String, dynamic> _$NotificationStatusResponseToJson(
        NotificationStatusResponse instance) =>
    <String, dynamic>{
      'last_seen_at': _$JsonConverterToJson<int, DateTime>(
          instance.lastSeenAt, const EpochDateTimeConverter().toJson),
      'read_activities': instance.readActivities,
      'unread': instance.unread,
      'unseen': instance.unseen,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_feed_updated_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationFeedUpdatedEvent _$NotificationFeedUpdatedEventFromJson(
        Map<String, dynamic> json) =>
    NotificationFeedUpdatedEvent(
      aggregatedActivities: (json['aggregated_activities'] as List<dynamic>?)
          ?.map((e) =>
              AggregatedActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      fid: json['fid'] as String,
      notificationStatus: json['notification_status'] == null
          ? null
          : NotificationStatusResponse.fromJson(
              json['notification_status'] as Map<String, dynamic>),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationFeedUpdatedEventToJson(
        NotificationFeedUpdatedEvent instance) =>
    <String, dynamic>{
      'aggregated_activities':
          instance.aggregatedActivities?.map((e) => e.toJson()).toList(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'fid': instance.fid,
      'notification_status': instance.notificationStatus?.toJson(),
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
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

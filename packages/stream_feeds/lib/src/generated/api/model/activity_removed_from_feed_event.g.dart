// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_removed_from_feed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRemovedFromFeedEvent _$ActivityRemovedFromFeedEventFromJson(
        Map<String, dynamic> json) =>
    ActivityRemovedFromFeedEvent(
      activity:
          ActivityResponse.fromJson(json['activity'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      fid: json['fid'] as String,
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityRemovedFromFeedEventToJson(
        ActivityRemovedFromFeedEvent instance) =>
    <String, dynamic>{
      'activity': instance.activity.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'fid': instance.fid,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_created_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowCreatedEvent _$FollowCreatedEventFromJson(Map<String, dynamic> json) =>
    FollowCreatedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      fid: json['fid'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
    );

Map<String, dynamic> _$FollowCreatedEventToJson(FollowCreatedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'fid': instance.fid,
      'follow': instance.follow.toJson(),
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
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

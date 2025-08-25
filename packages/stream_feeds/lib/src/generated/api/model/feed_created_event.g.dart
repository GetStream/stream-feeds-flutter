// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_created_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedCreatedEvent _$FeedCreatedEventFromJson(Map<String, dynamic> json) =>
    FeedCreatedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: json['custom'] as Map<String, dynamic>,
      feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
      feedVisibility: json['feed_visibility'] as String?,
      fid: json['fid'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: UserResponseCommonFields.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedCreatedEventToJson(FeedCreatedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'feed': instance.feed.toJson(),
      'feed_visibility': instance.feedVisibility,
      'fid': instance.fid,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'received_at': _$JsonConverterToJson<int, DateTime>(
          instance.receivedAt, const EpochDateTimeConverter().toJson),
      'type': instance.type,
      'user': instance.user.toJson(),
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

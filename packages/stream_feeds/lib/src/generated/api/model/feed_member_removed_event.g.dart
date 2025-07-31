// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_member_removed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMemberRemovedEvent _$FeedMemberRemovedEventFromJson(
        Map<String, dynamic> json) =>
    FeedMemberRemovedEvent(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      custom: (json['custom'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      fid: json['fid'] as String,
      memberId: json['member_id'] as String,
      receivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['received_at'], const EpochDateTimeConverter().fromJson),
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : UserResponseCommonFields.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedMemberRemovedEventToJson(
        FeedMemberRemovedEvent instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'custom': instance.custom,
      'fid': instance.fid,
      'member_id': instance.memberId,
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

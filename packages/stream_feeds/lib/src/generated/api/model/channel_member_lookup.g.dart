// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_member_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMemberLookup _$ChannelMemberLookupFromJson(Map<String, dynamic> json) =>
    ChannelMemberLookup(
      archived: json['archived'] as bool,
      archivedAt: _$JsonConverterFromJson<int, DateTime>(
          json['archived_at'], const EpochDateTimeConverter().fromJson),
      banExpires: _$JsonConverterFromJson<int, DateTime>(
          json['ban_expires'], const EpochDateTimeConverter().fromJson),
      banned: json['banned'] as bool,
      hidden: json['hidden'] as bool,
      pinned: json['pinned'] as bool,
      pinnedAt: _$JsonConverterFromJson<int, DateTime>(
          json['pinned_at'], const EpochDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$ChannelMemberLookupToJson(
        ChannelMemberLookup instance) =>
    <String, dynamic>{
      'archived': instance.archived,
      'archived_at': _$JsonConverterToJson<int, DateTime>(
          instance.archivedAt, const EpochDateTimeConverter().toJson),
      'ban_expires': _$JsonConverterToJson<int, DateTime>(
          instance.banExpires, const EpochDateTimeConverter().toJson),
      'banned': instance.banned,
      'hidden': instance.hidden,
      'pinned': instance.pinned,
      'pinned_at': _$JsonConverterToJson<int, DateTime>(
          instance.pinnedAt, const EpochDateTimeConverter().toJson),
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

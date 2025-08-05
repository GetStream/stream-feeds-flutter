// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_mute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMute _$ChannelMuteFromJson(Map<String, dynamic> json) => ChannelMute(
      channel: json['channel'] == null
          ? null
          : ChannelResponse.fromJson(json['channel'] as Map<String, dynamic>),
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      expires: _$JsonConverterFromJson<int, DateTime>(
          json['expires'], const EpochDateTimeConverter().fromJson),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelMuteToJson(ChannelMute instance) =>
    <String, dynamic>{
      'channel': instance.channel?.toJson(),
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'expires': _$JsonConverterToJson<int, DateTime>(
          instance.expires, const EpochDateTimeConverter().toJson),
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
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

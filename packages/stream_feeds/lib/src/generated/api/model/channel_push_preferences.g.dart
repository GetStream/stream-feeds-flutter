// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_push_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelPushPreferences _$ChannelPushPreferencesFromJson(
        Map<String, dynamic> json) =>
    ChannelPushPreferences(
      chatLevel: json['chat_level'] as String?,
      disabledUntil: _$JsonConverterFromJson<int, DateTime>(
          json['disabled_until'], const EpochDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$ChannelPushPreferencesToJson(
        ChannelPushPreferences instance) =>
    <String, dynamic>{
      'chat_level': instance.chatLevel,
      'disabled_until': _$JsonConverterToJson<int, DateTime>(
          instance.disabledUntil, const EpochDateTimeConverter().toJson),
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

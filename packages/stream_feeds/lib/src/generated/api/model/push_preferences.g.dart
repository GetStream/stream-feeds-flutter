// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushPreferences _$PushPreferencesFromJson(Map<String, dynamic> json) =>
    PushPreferences(
      callLevel: json['call_level'] as String?,
      chatLevel: json['chat_level'] as String?,
      disabledUntil: _$JsonConverterFromJson<int, DateTime>(
          json['disabled_until'], const EpochDateTimeConverter().fromJson),
      feedsLevel: json['feeds_level'] as String?,
      feedsPreferences: json['feeds_preferences'] == null
          ? null
          : FeedsPreferences.fromJson(
              json['feeds_preferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PushPreferencesToJson(PushPreferences instance) =>
    <String, dynamic>{
      'call_level': instance.callLevel,
      'chat_level': instance.chatLevel,
      'disabled_until': _$JsonConverterToJson<int, DateTime>(
          instance.disabledUntil, const EpochDateTimeConverter().toJson),
      'feeds_level': instance.feedsLevel,
      'feeds_preferences': instance.feedsPreferences?.toJson(),
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

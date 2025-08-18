// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesConfig _$StoriesConfigFromJson(Map<String, dynamic> json) =>
    StoriesConfig(
      expirationBehaviour: $enumDecodeNullable(
          _$StoriesConfigExpirationBehaviourEnumMap,
          json['expiration_behaviour'],
          unknownValue: StoriesConfigExpirationBehaviour.unknown),
      skipWatched: json['skip_watched'] as bool?,
    );

Map<String, dynamic> _$StoriesConfigToJson(StoriesConfig instance) =>
    <String, dynamic>{
      'expiration_behaviour': _$StoriesConfigExpirationBehaviourEnumMap[
          instance.expirationBehaviour],
      'skip_watched': instance.skipWatched,
    };

const _$StoriesConfigExpirationBehaviourEnumMap = {
  StoriesConfigExpirationBehaviour.hideForEveryone: 'hide_for_everyone',
  StoriesConfigExpirationBehaviour.visibleForAuthor: 'visible_for_author',
  StoriesConfigExpirationBehaviour.unknown: '_unknown',
};

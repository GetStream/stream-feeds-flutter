// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesConfig _$StoriesConfigFromJson(Map<String, dynamic> json) =>
    StoriesConfig(
      expirationBehaviour: $enumDecodeNullable(
          _$StoriesConfigExpirationBehaviourEnumEnumMap,
          json['expiration_behaviour']),
      skipWatched: json['skip_watched'] as bool?,
    );

Map<String, dynamic> _$StoriesConfigToJson(StoriesConfig instance) =>
    <String, dynamic>{
      'expiration_behaviour': _$StoriesConfigExpirationBehaviourEnumEnumMap[
          instance.expirationBehaviour],
      'skip_watched': instance.skipWatched,
    };

const _$StoriesConfigExpirationBehaviourEnumEnumMap = {
  StoriesConfigExpirationBehaviourEnum.hideForEveryone: 'hide_for_everyone',
  StoriesConfigExpirationBehaviourEnum.visibleForAuthor: 'visible_for_author',
  StoriesConfigExpirationBehaviourEnum.unknown: 'unknown',
};

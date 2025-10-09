// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesConfig _$StoriesConfigFromJson(Map<String, dynamic> json) =>
    StoriesConfig(
      skipWatched: json['skip_watched'] as bool?,
      trackWatched: json['track_watched'] as bool?,
    );

Map<String, dynamic> _$StoriesConfigToJson(StoriesConfig instance) =>
    <String, dynamic>{
      'skip_watched': instance.skipWatched,
      'track_watched': instance.trackWatched,
    };

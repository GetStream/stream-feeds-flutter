// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds_event_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedsEventPreferences _$FeedsEventPreferencesFromJson(
        Map<String, dynamic> json) =>
    FeedsEventPreferences(
      comments: json['comments'] as String?,
      mentions: json['mentions'] as String?,
      newFollowers: json['new_followers'] as String?,
      reactions: json['reactions'] as String?,
    );

Map<String, dynamic> _$FeedsEventPreferencesToJson(
        FeedsEventPreferences instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'mentions': instance.mentions,
      'new_followers': instance.newFollowers,
      'reactions': instance.reactions,
    };

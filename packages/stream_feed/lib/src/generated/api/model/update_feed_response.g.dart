// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedResponse _$UpdateFeedResponseFromJson(Map<String, dynamic> json) =>
    UpdateFeedResponse(
      duration: json['duration'] as String,
      feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateFeedResponseToJson(UpdateFeedResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'feed': instance.feed.toJson(),
    };

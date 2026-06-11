// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_feed_visibility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeFeedVisibilityResponse _$ChangeFeedVisibilityResponseFromJson(
  Map<String, dynamic> json,
) => ChangeFeedVisibilityResponse(
  duration: json['duration'] as String,
  feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChangeFeedVisibilityResponseToJson(
  ChangeFeedVisibilityResponse instance,
) => <String, dynamic>{
  'duration': instance.duration,
  'feed': instance.feed.toJson(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_feeds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFeedsResponse _$QueryFeedsResponseFromJson(Map<String, dynamic> json) =>
    QueryFeedsResponse(
      duration: json['duration'] as String,
      feeds: (json['feeds'] as List<dynamic>)
          .map((e) => FeedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryFeedsResponseToJson(QueryFeedsResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'prev': instance.prev,
    };

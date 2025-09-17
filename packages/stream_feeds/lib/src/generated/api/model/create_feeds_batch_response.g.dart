// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_feeds_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFeedsBatchResponse _$CreateFeedsBatchResponseFromJson(
        Map<String, dynamic> json) =>
    CreateFeedsBatchResponse(
      duration: json['duration'] as String,
      feeds: (json['feeds'] as List<dynamic>)
          .map((e) => FeedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateFeedsBatchResponseToJson(
        CreateFeedsBatchResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'feeds': instance.feeds.map((e) => e.toJson()).toList(),
    };

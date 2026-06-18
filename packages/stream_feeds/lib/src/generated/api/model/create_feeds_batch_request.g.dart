// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_feeds_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFeedsBatchRequest _$CreateFeedsBatchRequestFromJson(
  Map<String, dynamic> json,
) => CreateFeedsBatchRequest(
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  feeds: (json['feeds'] as List<dynamic>?)?.map((e) => FeedRequest.fromJson(e as Map<String, dynamic>)).toList() ?? [],
);

Map<String, dynamic> _$CreateFeedsBatchRequestToJson(
  CreateFeedsBatchRequest instance,
) => <String, dynamic>{
  'enrich_own_fields': instance.enrichOwnFields,
  'feeds': instance.feeds.map((e) => e.toJson()).toList(),
};

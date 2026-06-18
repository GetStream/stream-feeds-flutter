// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowBatchRequest _$FollowBatchRequestFromJson(Map<String, dynamic> json) => FollowBatchRequest(
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  follows:
      (json['follows'] as List<dynamic>?)?.map((e) => FollowRequest.fromJson(e as Map<String, dynamic>)).toList() ?? [],
);

Map<String, dynamic> _$FollowBatchRequestToJson(FollowBatchRequest instance) => <String, dynamic>{
  'enrich_own_fields': instance.enrichOwnFields,
  'follows': instance.follows.map((e) => e.toJson()).toList(),
};

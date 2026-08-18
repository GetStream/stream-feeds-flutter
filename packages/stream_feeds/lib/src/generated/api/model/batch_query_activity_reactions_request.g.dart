// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_query_activity_reactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchQueryActivityReactionsRequest _$BatchQueryActivityReactionsRequestFromJson(
  Map<String, dynamic> json,
) => BatchQueryActivityReactionsRequest(
  activityIds: (json['activity_ids'] as List<dynamic>).map((e) => e as String).toList(),
  filter: json['filter'] as Map<String, dynamic>?,
  limit: (json['limit'] as num?)?.toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: (json['sort'] as List<dynamic>?)?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$BatchQueryActivityReactionsRequestToJson(
  BatchQueryActivityReactionsRequest instance,
) => <String, dynamic>{
  'activity_ids': instance.activityIds,
  'filter': instance.filter,
  'limit': instance.limit,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort?.map((e) => e.toJson()).toList(),
};

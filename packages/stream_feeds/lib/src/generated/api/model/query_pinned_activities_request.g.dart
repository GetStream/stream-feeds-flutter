// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_pinned_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPinnedActivitiesRequest _$QueryPinnedActivitiesRequestFromJson(
  Map<String, dynamic> json,
) => QueryPinnedActivitiesRequest(
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  filter: json['filter'] as Map<String, dynamic>?,
  limit: (json['limit'] as num?)?.toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: (json['sort'] as List<dynamic>?)?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$QueryPinnedActivitiesRequestToJson(
  QueryPinnedActivitiesRequest instance,
) => <String, dynamic>{
  'enrich_own_fields': instance.enrichOwnFields,
  'filter': instance.filter,
  'limit': instance.limit,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort?.map((e) => e.toJson()).toList(),
};

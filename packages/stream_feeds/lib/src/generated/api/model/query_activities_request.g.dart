// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryActivitiesRequest _$QueryActivitiesRequestFromJson(Map<String, dynamic> json) => QueryActivitiesRequest(
  enrichOwnFields: json['enrich_own_fields'] as bool?,
  filter: json['filter'] as Map<String, dynamic>?,
  includeSoftDeletedActivities: json['include_soft_deleted_activities'] as bool?,
  limit: (json['limit'] as num?)?.toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: (json['sort'] as List<dynamic>?)?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$QueryActivitiesRequestToJson(QueryActivitiesRequest instance) => <String, dynamic>{
  'enrich_own_fields': instance.enrichOwnFields,
  'filter': instance.filter,
  'include_soft_deleted_activities': instance.includeSoftDeletedActivities,
  'limit': instance.limit,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort?.map((e) => e.toJson()).toList(),
};

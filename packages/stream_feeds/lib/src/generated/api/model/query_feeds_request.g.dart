// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_feeds_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFeedsRequest _$QueryFeedsRequestFromJson(Map<String, dynamic> json) =>
    QueryFeedsRequest(
      filter: (json['filter'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      limit: (json['limit'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      sort: (json['sort'] as List<dynamic>?)
          ?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      watch: json['watch'] as bool?,
    );

Map<String, dynamic> _$QueryFeedsRequestToJson(QueryFeedsRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'limit': instance.limit,
      'next': instance.next,
      'prev': instance.prev,
      'sort': instance.sort?.map((e) => e.toJson()).toList(),
      'watch': instance.watch,
    };

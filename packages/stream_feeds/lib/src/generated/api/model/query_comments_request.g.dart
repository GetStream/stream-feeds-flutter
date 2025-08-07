// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_comments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommentsRequest _$QueryCommentsRequestFromJson(
        Map<String, dynamic> json) =>
    QueryCommentsRequest(
      filter: (json['filter'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      limit: (json['limit'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      sort: $enumDecodeNullable(
          _$QueryCommentsRequestSortEnumEnumMap, json['sort']),
    );

Map<String, dynamic> _$QueryCommentsRequestToJson(
        QueryCommentsRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'limit': instance.limit,
      'next': instance.next,
      'prev': instance.prev,
      'sort': _$QueryCommentsRequestSortEnumEnumMap[instance.sort],
    };

const _$QueryCommentsRequestSortEnumEnumMap = {
  QueryCommentsRequestSortEnum.best: 'best',
  QueryCommentsRequestSortEnum.controversial: 'controversial',
  QueryCommentsRequestSortEnum.first: 'first',
  QueryCommentsRequestSortEnum.last: 'last',
  QueryCommentsRequestSortEnum.top: 'top',
  QueryCommentsRequestSortEnum.unknown: 'unknown',
};

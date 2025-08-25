// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_comments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommentsRequest _$QueryCommentsRequestFromJson(
        Map<String, dynamic> json) =>
    QueryCommentsRequest(
      filter: json['filter'] as Map<String, dynamic>,
      limit: (json['limit'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      sort: $enumDecodeNullable(_$QueryCommentsRequestSortEnumMap, json['sort'],
          unknownValue: QueryCommentsRequestSort.unknown),
    );

Map<String, dynamic> _$QueryCommentsRequestToJson(
        QueryCommentsRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'limit': instance.limit,
      'next': instance.next,
      'prev': instance.prev,
      'sort': _$QueryCommentsRequestSortEnumMap[instance.sort],
    };

const _$QueryCommentsRequestSortEnumMap = {
  QueryCommentsRequestSort.best: 'best',
  QueryCommentsRequestSort.controversial: 'controversial',
  QueryCommentsRequestSort.first: 'first',
  QueryCommentsRequestSort.last: 'last',
  QueryCommentsRequestSort.top: 'top',
  QueryCommentsRequestSort.unknown: '_unknown',
};

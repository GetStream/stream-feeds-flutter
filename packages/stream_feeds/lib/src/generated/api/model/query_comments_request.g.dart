// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_comments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommentsRequest _$QueryCommentsRequestFromJson(
  Map<String, dynamic> json,
) => QueryCommentsRequest(
  filter: json['filter'] as Map<String, dynamic>,
  idAround: json['id_around'] as String?,
  limit: (json['limit'] as num?)?.toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: json['sort'] == null ? null : QueryCommentsRequestSort.fromJson(json['sort'] as String),
);

Map<String, dynamic> _$QueryCommentsRequestToJson(
  QueryCommentsRequest instance,
) => <String, dynamic>{
  'filter': instance.filter,
  'id_around': instance.idAround,
  'limit': instance.limit,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort?.toJson(),
};

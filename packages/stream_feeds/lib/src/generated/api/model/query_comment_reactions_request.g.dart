// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_comment_reactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCommentReactionsRequest _$QueryCommentReactionsRequestFromJson(
        Map<String, dynamic> json) =>
    QueryCommentReactionsRequest(
      filter: (json['filter'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      limit: (json['limit'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
      sort: (json['sort'] as List<dynamic>?)
          ?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QueryCommentReactionsRequestToJson(
        QueryCommentReactionsRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'limit': instance.limit,
      'next': instance.next,
      'prev': instance.prev,
      'sort': instance.sort?.map((e) => e.toJson()).toList(),
    };

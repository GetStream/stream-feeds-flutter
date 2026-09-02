// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_query_comment_reactions_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchQueryCommentReactionsRequest _$BatchQueryCommentReactionsRequestFromJson(
  Map<String, dynamic> json,
) => BatchQueryCommentReactionsRequest(
  commentIds: (json['comment_ids'] as List<dynamic>).map((e) => e as String).toList(),
  filter: json['filter'] as Map<String, dynamic>?,
  limit: (json['limit'] as num?)?.toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
  sort: (json['sort'] as List<dynamic>?)?.map((e) => SortParamRequest.fromJson(e as Map<String, dynamic>)).toList(),
);

Map<String, dynamic> _$BatchQueryCommentReactionsRequestToJson(
  BatchQueryCommentReactionsRequest instance,
) => <String, dynamic>{
  'comment_ids': instance.commentIds,
  'filter': instance.filter,
  'limit': instance.limit,
  'next': instance.next,
  'prev': instance.prev,
  'sort': instance.sort?.map((e) => e.toJson()).toList(),
};

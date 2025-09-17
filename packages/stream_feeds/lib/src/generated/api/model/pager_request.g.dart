// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagerRequest _$PagerRequestFromJson(Map<String, dynamic> json) => PagerRequest(
      limit: (json['limit'] as num?)?.toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$PagerRequestToJson(PagerRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'next': instance.next,
      'prev': instance.prev,
    };

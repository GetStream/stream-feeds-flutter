// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagerResponse _$PagerResponseFromJson(Map<String, dynamic> json) =>
    PagerResponse(
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$PagerResponseToJson(PagerResponse instance) =>
    <String, dynamic>{
      'next': instance.next,
      'prev': instance.prev,
    };

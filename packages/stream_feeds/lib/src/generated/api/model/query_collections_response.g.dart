// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_collections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryCollectionsResponse _$QueryCollectionsResponseFromJson(
        Map<String, dynamic> json) =>
    QueryCollectionsResponse(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryCollectionsResponseToJson(
        QueryCollectionsResponse instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'next': instance.next,
      'prev': instance.prev,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_collections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadCollectionsResponse _$ReadCollectionsResponseFromJson(
        Map<String, dynamic> json) =>
    ReadCollectionsResponse(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$ReadCollectionsResponseToJson(
        ReadCollectionsResponse instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
    };

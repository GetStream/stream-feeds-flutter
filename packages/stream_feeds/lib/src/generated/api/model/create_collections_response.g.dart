// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCollectionsResponse _$CreateCollectionsResponseFromJson(
        Map<String, dynamic> json) =>
    CreateCollectionsResponse(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$CreateCollectionsResponseToJson(
        CreateCollectionsResponse instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
    };

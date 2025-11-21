// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collections_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCollectionsRequest _$CreateCollectionsRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCollectionsRequest(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateCollectionsRequestToJson(
        CreateCollectionsRequest instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
    };

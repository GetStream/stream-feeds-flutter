// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collections_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionsRequest _$UpdateCollectionsRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCollectionsRequest(
      collections: (json['collections'] as List<dynamic>)
          .map((e) =>
              UpdateCollectionRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateCollectionsRequestToJson(
        UpdateCollectionsRequest instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collections_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionsResponse _$UpdateCollectionsResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateCollectionsResponse(
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$UpdateCollectionsResponseToJson(
        UpdateCollectionsResponse instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
    };

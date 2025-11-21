// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionRequest _$UpdateCollectionRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateCollectionRequest(
      custom: json['custom'] as Map<String, dynamic>,
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UpdateCollectionRequestToJson(
        UpdateCollectionRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
    };

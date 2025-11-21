// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionRequest _$CollectionRequestFromJson(Map<String, dynamic> json) =>
    CollectionRequest(
      custom: json['custom'] as Map<String, dynamic>,
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CollectionRequestToJson(CollectionRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'id': instance.id,
      'name': instance.name,
    };

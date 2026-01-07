// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnBatchRequest _$OwnBatchRequestFromJson(Map<String, dynamic> json) =>
    OwnBatchRequest(
      feeds: (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
      fields:
          (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OwnBatchRequestToJson(OwnBatchRequest instance) =>
    <String, dynamic>{
      'feeds': instance.feeds,
      'fields': instance.fields,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_capabilities_batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnCapabilitiesBatchRequest _$OwnCapabilitiesBatchRequestFromJson(
        Map<String, dynamic> json) =>
    OwnCapabilitiesBatchRequest(
      feeds: (json['feeds'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$OwnCapabilitiesBatchRequestToJson(
        OwnCapabilitiesBatchRequest instance) =>
    <String, dynamic>{
      'feeds': instance.feeds,
    };

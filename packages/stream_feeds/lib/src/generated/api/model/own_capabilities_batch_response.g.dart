// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_capabilities_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnCapabilitiesBatchResponse _$OwnCapabilitiesBatchResponseFromJson(
        Map<String, dynamic> json) =>
    OwnCapabilitiesBatchResponse(
      capabilities: (json['capabilities'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$OwnCapabilitiesBatchResponseToJson(
        OwnCapabilitiesBatchResponse instance) =>
    <String, dynamic>{
      'capabilities': instance.capabilities,
      'duration': instance.duration,
    };

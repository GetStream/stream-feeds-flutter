// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_ingress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallIngressResponse _$CallIngressResponseFromJson(Map<String, dynamic> json) =>
    CallIngressResponse(
      rtmp: RTMPIngress.fromJson(json['rtmp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallIngressResponseToJson(
        CallIngressResponse instance) =>
    <String, dynamic>{
      'rtmp': instance.rtmp.toJson(),
    };

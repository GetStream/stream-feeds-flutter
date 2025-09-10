// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectFollowRequest _$RejectFollowRequestFromJson(Map<String, dynamic> json) =>
    RejectFollowRequest(
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$RejectFollowRequestToJson(
        RejectFollowRequest instance) =>
    <String, dynamic>{
      'source': instance.source,
      'target': instance.target,
    };

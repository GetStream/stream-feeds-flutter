// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptFollowRequest _$AcceptFollowRequestFromJson(Map<String, dynamic> json) =>
    AcceptFollowRequest(
      followerRole: json['follower_role'] as String?,
      source: json['source'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$AcceptFollowRequestToJson(
        AcceptFollowRequest instance) =>
    <String, dynamic>{
      'follower_role': instance.followerRole,
      'source': instance.source,
      'target': instance.target,
    };

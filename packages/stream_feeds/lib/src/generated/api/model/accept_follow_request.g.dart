// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptFollowRequest _$AcceptFollowRequestFromJson(Map<String, dynamic> json) =>
    AcceptFollowRequest(
      followerRole: json['follower_role'] as String?,
      sourceFid: json['source_fid'] as String,
      targetFid: json['target_fid'] as String,
    );

Map<String, dynamic> _$AcceptFollowRequestToJson(
        AcceptFollowRequest instance) =>
    <String, dynamic>{
      'follower_role': instance.followerRole,
      'source_fid': instance.sourceFid,
      'target_fid': instance.targetFid,
    };

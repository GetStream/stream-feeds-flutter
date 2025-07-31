// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_follow_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectFollowRequest _$RejectFollowRequestFromJson(Map<String, dynamic> json) =>
    RejectFollowRequest(
      sourceFid: json['source_fid'] as String,
      targetFid: json['target_fid'] as String,
    );

Map<String, dynamic> _$RejectFollowRequestToJson(
        RejectFollowRequest instance) =>
    <String, dynamic>{
      'source_fid': instance.sourceFid,
      'target_fid': instance.targetFid,
    };

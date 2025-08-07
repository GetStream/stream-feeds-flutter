// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectFollowResponse _$RejectFollowResponseFromJson(
        Map<String, dynamic> json) =>
    RejectFollowResponse(
      duration: json['duration'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectFollowResponseToJson(
        RejectFollowResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follow': instance.follow.toJson(),
    };

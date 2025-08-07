// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptFollowResponse _$AcceptFollowResponseFromJson(
        Map<String, dynamic> json) =>
    AcceptFollowResponse(
      duration: json['duration'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptFollowResponseToJson(
        AcceptFollowResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follow': instance.follow.toJson(),
    };

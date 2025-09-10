// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfollow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnfollowResponse _$UnfollowResponseFromJson(Map<String, dynamic> json) =>
    UnfollowResponse(
      duration: json['duration'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnfollowResponseToJson(UnfollowResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follow': instance.follow.toJson(),
    };

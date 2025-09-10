// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleFollowResponse _$SingleFollowResponseFromJson(
        Map<String, dynamic> json) =>
    SingleFollowResponse(
      duration: json['duration'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleFollowResponseToJson(
        SingleFollowResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follow': instance.follow.toJson(),
    };

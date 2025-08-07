// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFollowResponse _$UpdateFollowResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateFollowResponse(
      duration: json['duration'] as String,
      follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateFollowResponseToJson(
        UpdateFollowResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'follow': instance.follow.toJson(),
    };

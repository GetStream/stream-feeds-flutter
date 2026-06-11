// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_or_create_unfollow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrCreateUnfollowResponse _$GetOrCreateUnfollowResponseFromJson(
        Map<String, dynamic> json) =>
    GetOrCreateUnfollowResponse(
      deleted: json['deleted'] as bool,
      duration: json['duration'] as String,
      follow: json['follow'] == null
          ? null
          : FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrCreateUnfollowResponseToJson(
        GetOrCreateUnfollowResponse instance) =>
    <String, dynamic>{
      'deleted': instance.deleted,
      'duration': instance.duration,
      'follow': instance.follow?.toJson(),
    };

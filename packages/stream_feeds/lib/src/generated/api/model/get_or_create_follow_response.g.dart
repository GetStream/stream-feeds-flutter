// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_or_create_follow_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrCreateFollowResponse _$GetOrCreateFollowResponseFromJson(Map<String, dynamic> json) => GetOrCreateFollowResponse(
  created: json['created'] as bool,
  duration: json['duration'] as String,
  follow: FollowResponse.fromJson(json['follow'] as Map<String, dynamic>),
  notificationCreated: json['notification_created'] as bool?,
);

Map<String, dynamic> _$GetOrCreateFollowResponseToJson(GetOrCreateFollowResponse instance) => <String, dynamic>{
  'created': instance.created,
  'duration': instance.duration,
  'follow': instance.follow.toJson(),
  'notification_created': instance.notificationCreated,
};

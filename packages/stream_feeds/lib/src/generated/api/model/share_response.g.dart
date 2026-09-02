// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareResponse _$ShareResponseFromJson(Map<String, dynamic> json) => ShareResponse(
  activityId: json['activity_id'] as String,
  createdAt: const StreamDateTimeConverter().fromJson(
    json['created_at'] as Object,
  ),
  user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShareResponseToJson(ShareResponse instance) => <String, dynamic>{
  'activity_id': instance.activityId,
  'created_at': const StreamDateTimeConverter().toJson(instance.createdAt),
  'user': instance.user.toJson(),
};

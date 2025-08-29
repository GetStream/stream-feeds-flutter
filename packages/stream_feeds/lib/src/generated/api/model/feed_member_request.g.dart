// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_member_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMemberRequest _$FeedMemberRequestFromJson(Map<String, dynamic> json) =>
    FeedMemberRequest(
      custom: json['custom'] as Map<String, dynamic>?,
      invite: json['invite'] as bool?,
      membershipLevel: json['membership_level'] as String?,
      role: json['role'] as String?,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$FeedMemberRequestToJson(FeedMemberRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'invite': instance.invite,
      'membership_level': instance.membershipLevel,
      'role': instance.role,
      'user_id': instance.userId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_member_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedMemberRequest _$FeedMemberRequestFromJson(Map<String, dynamic> json) =>
    FeedMemberRequest(
      custom: (json['custom'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      invite: json['invite'] as bool?,
      role: json['role'] as String?,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$FeedMemberRequestToJson(FeedMemberRequest instance) =>
    <String, dynamic>{
      'custom': instance.custom,
      'invite': instance.invite,
      'role': instance.role,
      'user_id': instance.userId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_feed_member_invite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectFeedMemberInviteResponse _$RejectFeedMemberInviteResponseFromJson(
        Map<String, dynamic> json) =>
    RejectFeedMemberInviteResponse(
      duration: json['duration'] as String,
      member:
          FeedMemberResponse.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RejectFeedMemberInviteResponseToJson(
        RejectFeedMemberInviteResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'member': instance.member.toJson(),
    };

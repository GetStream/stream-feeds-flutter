// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_feed_member_invite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptFeedMemberInviteResponse _$AcceptFeedMemberInviteResponseFromJson(
        Map<String, dynamic> json) =>
    AcceptFeedMemberInviteResponse(
      duration: json['duration'] as String,
      member:
          FeedMemberResponse.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptFeedMemberInviteResponseToJson(
        AcceptFeedMemberInviteResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'member': instance.member.toJson(),
    };

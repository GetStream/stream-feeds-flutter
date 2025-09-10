// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_feed_members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryFeedMembersResponse _$QueryFeedMembersResponseFromJson(
        Map<String, dynamic> json) =>
    QueryFeedMembersResponse(
      duration: json['duration'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$QueryFeedMembersResponseToJson(
        QueryFeedMembersResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'members': instance.members.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'prev': instance.prev,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_feed_members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFeedMembersResponse _$UpdateFeedMembersResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateFeedMembersResponse(
      added: (json['added'] as List<dynamic>)
          .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String,
      removedIds: (json['removed_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      updated: (json['updated'] as List<dynamic>)
          .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateFeedMembersResponseToJson(
        UpdateFeedMembersResponse instance) =>
    <String, dynamic>{
      'added': instance.added.map((e) => e.toJson()).toList(),
      'duration': instance.duration,
      'removed_ids': instance.removedIds,
      'updated': instance.updated.map((e) => e.toJson()).toList(),
    };

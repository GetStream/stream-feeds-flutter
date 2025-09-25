// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) => FeedResponse(
      createdAt: const EpochDateTimeConverter()
          .fromJson((json['created_at'] as num).toInt()),
      createdBy:
          UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
      custom: json['custom'] as Map<String, dynamic>?,
      deletedAt: _$JsonConverterFromJson<int, DateTime>(
          json['deleted_at'], const EpochDateTimeConverter().fromJson),
      description: json['description'] as String,
      feed: json['feed'] as String,
      filterTags: (json['filter_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      followerCount: (json['follower_count'] as num).toInt(),
      followingCount: (json['following_count'] as num).toInt(),
      groupId: json['group_id'] as String,
      id: json['id'] as String,
      memberCount: (json['member_count'] as num).toInt(),
      name: json['name'] as String,
      ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FeedOwnCapabilityEnumMap, e,
              unknownValue: FeedOwnCapability.unknown))
          .toList(),
      ownFollows: (json['own_follows'] as List<dynamic>?)
          ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownMembership: json['own_membership'] == null
          ? null
          : FeedMemberResponse.fromJson(
              json['own_membership'] as Map<String, dynamic>),
      pinCount: (json['pin_count'] as num).toInt(),
      updatedAt: const EpochDateTimeConverter()
          .fromJson((json['updated_at'] as num).toInt()),
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$FeedResponseToJson(FeedResponse instance) =>
    <String, dynamic>{
      'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy.toJson(),
      'custom': instance.custom,
      'deleted_at': _$JsonConverterToJson<int, DateTime>(
          instance.deletedAt, const EpochDateTimeConverter().toJson),
      'description': instance.description,
      'feed': instance.feed,
      'filter_tags': instance.filterTags,
      'follower_count': instance.followerCount,
      'following_count': instance.followingCount,
      'group_id': instance.groupId,
      'id': instance.id,
      'member_count': instance.memberCount,
      'name': instance.name,
      'own_capabilities': instance.ownCapabilities
          ?.map((e) => _$FeedOwnCapabilityEnumMap[e]!)
          .toList(),
      'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
      'own_membership': instance.ownMembership?.toJson(),
      'pin_count': instance.pinCount,
      'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
      'visibility': instance.visibility,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$FeedOwnCapabilityEnumMap = {
  FeedOwnCapability.addActivity: 'add-activity',
  FeedOwnCapability.addActivityBookmark: 'add-activity-bookmark',
  FeedOwnCapability.addActivityReaction: 'add-activity-reaction',
  FeedOwnCapability.addComment: 'add-comment',
  FeedOwnCapability.addCommentReaction: 'add-comment-reaction',
  FeedOwnCapability.createFeed: 'create-feed',
  FeedOwnCapability.deleteAnyActivity: 'delete-any-activity',
  FeedOwnCapability.deleteAnyComment: 'delete-any-comment',
  FeedOwnCapability.deleteFeed: 'delete-feed',
  FeedOwnCapability.deleteOwnActivity: 'delete-own-activity',
  FeedOwnCapability.deleteOwnActivityBookmark: 'delete-own-activity-bookmark',
  FeedOwnCapability.deleteOwnActivityReaction: 'delete-own-activity-reaction',
  FeedOwnCapability.deleteOwnComment: 'delete-own-comment',
  FeedOwnCapability.deleteOwnCommentReaction: 'delete-own-comment-reaction',
  FeedOwnCapability.follow: 'follow',
  FeedOwnCapability.pinActivity: 'pin-activity',
  FeedOwnCapability.queryFeedMembers: 'query-feed-members',
  FeedOwnCapability.queryFollows: 'query-follows',
  FeedOwnCapability.readActivities: 'read-activities',
  FeedOwnCapability.readFeed: 'read-feed',
  FeedOwnCapability.unfollow: 'unfollow',
  FeedOwnCapability.updateAnyActivity: 'update-any-activity',
  FeedOwnCapability.updateAnyComment: 'update-any-comment',
  FeedOwnCapability.updateFeed: 'update-feed',
  FeedOwnCapability.updateFeedFollowers: 'update-feed-followers',
  FeedOwnCapability.updateFeedMembers: 'update-feed-members',
  FeedOwnCapability.updateOwnActivity: 'update-own-activity',
  FeedOwnCapability.updateOwnActivityBookmark: 'update-own-activity-bookmark',
  FeedOwnCapability.updateOwnComment: 'update-own-comment',
  FeedOwnCapability.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

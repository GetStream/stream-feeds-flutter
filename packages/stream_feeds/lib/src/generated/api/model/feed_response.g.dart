// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) => FeedResponse(
  activityCount: (json['activity_count'] as num).toInt(),
  createdAt: const EpochDateTimeConverter().fromJson(
    (json['created_at'] as num).toInt(),
  ),
  createdBy: UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
  custom: json['custom'] as Map<String, dynamic>?,
  deletedAt: _$JsonConverterFromJson<int, DateTime>(
    json['deleted_at'],
    const EpochDateTimeConverter().fromJson,
  ),
  description: json['description'] as String,
  feed: json['feed'] as String,
  filterTags: (json['filter_tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  followerCount: (json['follower_count'] as num).toInt(),
  followingCount: (json['following_count'] as num).toInt(),
  groupId: json['group_id'] as String,
  id: json['id'] as String,
  location: json['location'] == null ? null : Location.fromJson(json['location'] as Map<String, dynamic>),
  memberCount: (json['member_count'] as num).toInt(),
  name: json['name'] as String,
  ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
      ?.map(
        (e) => $enumDecode(
          _$FeedResponseOwnCapabilitiesEnumMap,
          e,
          unknownValue: FeedResponseOwnCapabilities.unknown,
        ),
      )
      .toList(),
  ownFollowings: (json['own_followings'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownFollows: (json['own_follows'] as List<dynamic>?)
      ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  ownMembership: json['own_membership'] == null
      ? null
      : FeedMemberResponse.fromJson(
          json['own_membership'] as Map<String, dynamic>,
        ),
  pinCount: (json['pin_count'] as num).toInt(),
  updatedAt: const EpochDateTimeConverter().fromJson(
    (json['updated_at'] as num).toInt(),
  ),
  visibility: $enumDecodeNullable(
    _$FeedResponseVisibilityEnumMap,
    json['visibility'],
    unknownValue: FeedResponseVisibility.unknown,
  ),
);

Map<String, dynamic> _$FeedResponseToJson(FeedResponse instance) => <String, dynamic>{
  'activity_count': instance.activityCount,
  'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy.toJson(),
  'custom': instance.custom,
  'deleted_at': _$JsonConverterToJson<int, DateTime>(
    instance.deletedAt,
    const EpochDateTimeConverter().toJson,
  ),
  'description': instance.description,
  'feed': instance.feed,
  'filter_tags': instance.filterTags,
  'follower_count': instance.followerCount,
  'following_count': instance.followingCount,
  'group_id': instance.groupId,
  'id': instance.id,
  'location': instance.location?.toJson(),
  'member_count': instance.memberCount,
  'name': instance.name,
  'own_capabilities': instance.ownCapabilities?.map((e) => _$FeedResponseOwnCapabilitiesEnumMap[e]!).toList(),
  'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
  'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
  'own_membership': instance.ownMembership?.toJson(),
  'pin_count': instance.pinCount,
  'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
  'visibility': _$FeedResponseVisibilityEnumMap[instance.visibility],
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$FeedResponseOwnCapabilitiesEnumMap = {
  FeedResponseOwnCapabilities.addActivity: 'add-activity',
  FeedResponseOwnCapabilities.addActivityBookmark: 'add-activity-bookmark',
  FeedResponseOwnCapabilities.addActivityReaction: 'add-activity-reaction',
  FeedResponseOwnCapabilities.addComment: 'add-comment',
  FeedResponseOwnCapabilities.addCommentReaction: 'add-comment-reaction',
  FeedResponseOwnCapabilities.createFeed: 'create-feed',
  FeedResponseOwnCapabilities.deleteAnyActivity: 'delete-any-activity',
  FeedResponseOwnCapabilities.deleteAnyComment: 'delete-any-comment',
  FeedResponseOwnCapabilities.deleteFeed: 'delete-feed',
  FeedResponseOwnCapabilities.deleteOwnActivity: 'delete-own-activity',
  FeedResponseOwnCapabilities.deleteOwnActivityBookmark: 'delete-own-activity-bookmark',
  FeedResponseOwnCapabilities.deleteOwnActivityReaction: 'delete-own-activity-reaction',
  FeedResponseOwnCapabilities.deleteOwnComment: 'delete-own-comment',
  FeedResponseOwnCapabilities.deleteOwnCommentReaction: 'delete-own-comment-reaction',
  FeedResponseOwnCapabilities.follow: 'follow',
  FeedResponseOwnCapabilities.pinActivity: 'pin-activity',
  FeedResponseOwnCapabilities.queryFeedMembers: 'query-feed-members',
  FeedResponseOwnCapabilities.queryFollows: 'query-follows',
  FeedResponseOwnCapabilities.readActivities: 'read-activities',
  FeedResponseOwnCapabilities.readFeed: 'read-feed',
  FeedResponseOwnCapabilities.unfollow: 'unfollow',
  FeedResponseOwnCapabilities.updateAnyActivity: 'update-any-activity',
  FeedResponseOwnCapabilities.updateAnyComment: 'update-any-comment',
  FeedResponseOwnCapabilities.updateFeed: 'update-feed',
  FeedResponseOwnCapabilities.updateFeedFollowers: 'update-feed-followers',
  FeedResponseOwnCapabilities.updateFeedMembers: 'update-feed-members',
  FeedResponseOwnCapabilities.updateOwnActivity: 'update-own-activity',
  FeedResponseOwnCapabilities.updateOwnActivityBookmark: 'update-own-activity-bookmark',
  FeedResponseOwnCapabilities.updateOwnComment: 'update-own-comment',
  FeedResponseOwnCapabilities.unknown: '_unknown',
};

const _$FeedResponseVisibilityEnumMap = {
  FeedResponseVisibility.followers: 'followers',
  FeedResponseVisibility.members: 'members',
  FeedResponseVisibility.private: 'private',
  FeedResponseVisibility.public: 'public',
  FeedResponseVisibility.visible: 'visible',
  FeedResponseVisibility.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

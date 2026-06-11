// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_suggestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedSuggestionResponse _$FeedSuggestionResponseFromJson(Map<String, dynamic> json) => FeedSuggestionResponse(
  activityCount: (json['activity_count'] as num).toInt(),
  algorithmScores: (json['algorithm_scores'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  createdAt: const EpochDateTimeConverter().fromJson((json['created_at'] as num).toInt()),
  createdBy: UserResponse.fromJson(json['created_by'] as Map<String, dynamic>),
  custom: json['custom'] as Map<String, dynamic>?,
  deletedAt: _$JsonConverterFromJson<int, DateTime>(json['deleted_at'], const EpochDateTimeConverter().fromJson),
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
          _$FeedSuggestionResponseOwnCapabilitiesEnumMap,
          e,
          unknownValue: FeedSuggestionResponseOwnCapabilities.unknown,
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
      : FeedMemberResponse.fromJson(json['own_membership'] as Map<String, dynamic>),
  pinCount: (json['pin_count'] as num).toInt(),
  reason: json['reason'] as String?,
  recommendationScore: (json['recommendation_score'] as num?)?.toDouble(),
  updatedAt: const EpochDateTimeConverter().fromJson((json['updated_at'] as num).toInt()),
  visibility: $enumDecodeNullable(
    _$FeedSuggestionResponseVisibilityEnumMap,
    json['visibility'],
    unknownValue: FeedSuggestionResponseVisibility.unknown,
  ),
);

Map<String, dynamic> _$FeedSuggestionResponseToJson(FeedSuggestionResponse instance) => <String, dynamic>{
  'activity_count': instance.activityCount,
  'algorithm_scores': instance.algorithmScores,
  'created_at': const EpochDateTimeConverter().toJson(instance.createdAt),
  'created_by': instance.createdBy.toJson(),
  'custom': instance.custom,
  'deleted_at': _$JsonConverterToJson<int, DateTime>(instance.deletedAt, const EpochDateTimeConverter().toJson),
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
  'own_capabilities': instance.ownCapabilities?.map((e) => _$FeedSuggestionResponseOwnCapabilitiesEnumMap[e]!).toList(),
  'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
  'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
  'own_membership': instance.ownMembership?.toJson(),
  'pin_count': instance.pinCount,
  'reason': instance.reason,
  'recommendation_score': instance.recommendationScore,
  'updated_at': const EpochDateTimeConverter().toJson(instance.updatedAt),
  'visibility': _$FeedSuggestionResponseVisibilityEnumMap[instance.visibility],
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$FeedSuggestionResponseOwnCapabilitiesEnumMap = {
  FeedSuggestionResponseOwnCapabilities.addActivity: 'add-activity',
  FeedSuggestionResponseOwnCapabilities.addActivityBookmark: 'add-activity-bookmark',
  FeedSuggestionResponseOwnCapabilities.addActivityReaction: 'add-activity-reaction',
  FeedSuggestionResponseOwnCapabilities.addComment: 'add-comment',
  FeedSuggestionResponseOwnCapabilities.addCommentReaction: 'add-comment-reaction',
  FeedSuggestionResponseOwnCapabilities.createFeed: 'create-feed',
  FeedSuggestionResponseOwnCapabilities.deleteAnyActivity: 'delete-any-activity',
  FeedSuggestionResponseOwnCapabilities.deleteAnyComment: 'delete-any-comment',
  FeedSuggestionResponseOwnCapabilities.deleteFeed: 'delete-feed',
  FeedSuggestionResponseOwnCapabilities.deleteOwnActivity: 'delete-own-activity',
  FeedSuggestionResponseOwnCapabilities.deleteOwnActivityBookmark: 'delete-own-activity-bookmark',
  FeedSuggestionResponseOwnCapabilities.deleteOwnActivityReaction: 'delete-own-activity-reaction',
  FeedSuggestionResponseOwnCapabilities.deleteOwnComment: 'delete-own-comment',
  FeedSuggestionResponseOwnCapabilities.deleteOwnCommentReaction: 'delete-own-comment-reaction',
  FeedSuggestionResponseOwnCapabilities.follow: 'follow',
  FeedSuggestionResponseOwnCapabilities.pinActivity: 'pin-activity',
  FeedSuggestionResponseOwnCapabilities.queryFeedMembers: 'query-feed-members',
  FeedSuggestionResponseOwnCapabilities.queryFollows: 'query-follows',
  FeedSuggestionResponseOwnCapabilities.readActivities: 'read-activities',
  FeedSuggestionResponseOwnCapabilities.readFeed: 'read-feed',
  FeedSuggestionResponseOwnCapabilities.unfollow: 'unfollow',
  FeedSuggestionResponseOwnCapabilities.updateAnyActivity: 'update-any-activity',
  FeedSuggestionResponseOwnCapabilities.updateAnyComment: 'update-any-comment',
  FeedSuggestionResponseOwnCapabilities.updateFeed: 'update-feed',
  FeedSuggestionResponseOwnCapabilities.updateFeedFollowers: 'update-feed-followers',
  FeedSuggestionResponseOwnCapabilities.updateFeedMembers: 'update-feed-members',
  FeedSuggestionResponseOwnCapabilities.updateOwnActivity: 'update-own-activity',
  FeedSuggestionResponseOwnCapabilities.updateOwnActivityBookmark: 'update-own-activity-bookmark',
  FeedSuggestionResponseOwnCapabilities.updateOwnComment: 'update-own-comment',
  FeedSuggestionResponseOwnCapabilities.unknown: '_unknown',
};

const _$FeedSuggestionResponseVisibilityEnumMap = {
  FeedSuggestionResponseVisibility.followers: 'followers',
  FeedSuggestionResponseVisibility.members: 'members',
  FeedSuggestionResponseVisibility.private: 'private',
  FeedSuggestionResponseVisibility.public: 'public',
  FeedSuggestionResponseVisibility.visible: 'visible',
  FeedSuggestionResponseVisibility.unknown: '_unknown',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

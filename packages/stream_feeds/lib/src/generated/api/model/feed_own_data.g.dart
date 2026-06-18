// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_own_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedOwnData _$FeedOwnDataFromJson(Map<String, dynamic> json) => FeedOwnData(
  ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
      ?.map(
        (e) => $enumDecode(
          _$FeedOwnCapabilityEnumMap,
          e,
          unknownValue: FeedOwnCapability.unknown,
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
);

Map<String, dynamic> _$FeedOwnDataToJson(FeedOwnData instance) => <String, dynamic>{
  'own_capabilities': instance.ownCapabilities?.map((e) => _$FeedOwnCapabilityEnumMap[e]!).toList(),
  'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
  'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
  'own_membership': instance.ownMembership?.toJson(),
};

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

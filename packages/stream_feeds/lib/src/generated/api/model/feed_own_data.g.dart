// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_own_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedOwnData _$FeedOwnDataFromJson(Map<String, dynamic> json) => FeedOwnData(
      ownCapabilities: (json['own_capabilities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FeedOwnDataOwnCapabilitiesEnumMap, e,
              unknownValue: FeedOwnDataOwnCapabilities.unknown))
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
              json['own_membership'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedOwnDataToJson(FeedOwnData instance) =>
    <String, dynamic>{
      'own_capabilities': instance.ownCapabilities
          ?.map((e) => _$FeedOwnDataOwnCapabilitiesEnumMap[e]!)
          .toList(),
      'own_followings': instance.ownFollowings?.map((e) => e.toJson()).toList(),
      'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
      'own_membership': instance.ownMembership?.toJson(),
    };

const _$FeedOwnDataOwnCapabilitiesEnumMap = {
  FeedOwnDataOwnCapabilities.addActivity: 'add-activity',
  FeedOwnDataOwnCapabilities.addActivityBookmark: 'add-activity-bookmark',
  FeedOwnDataOwnCapabilities.addActivityReaction: 'add-activity-reaction',
  FeedOwnDataOwnCapabilities.addComment: 'add-comment',
  FeedOwnDataOwnCapabilities.addCommentReaction: 'add-comment-reaction',
  FeedOwnDataOwnCapabilities.createFeed: 'create-feed',
  FeedOwnDataOwnCapabilities.deleteAnyActivity: 'delete-any-activity',
  FeedOwnDataOwnCapabilities.deleteAnyComment: 'delete-any-comment',
  FeedOwnDataOwnCapabilities.deleteFeed: 'delete-feed',
  FeedOwnDataOwnCapabilities.deleteOwnActivity: 'delete-own-activity',
  FeedOwnDataOwnCapabilities.deleteOwnActivityBookmark:
      'delete-own-activity-bookmark',
  FeedOwnDataOwnCapabilities.deleteOwnActivityReaction:
      'delete-own-activity-reaction',
  FeedOwnDataOwnCapabilities.deleteOwnComment: 'delete-own-comment',
  FeedOwnDataOwnCapabilities.deleteOwnCommentReaction:
      'delete-own-comment-reaction',
  FeedOwnDataOwnCapabilities.follow: 'follow',
  FeedOwnDataOwnCapabilities.pinActivity: 'pin-activity',
  FeedOwnDataOwnCapabilities.queryFeedMembers: 'query-feed-members',
  FeedOwnDataOwnCapabilities.queryFollows: 'query-follows',
  FeedOwnDataOwnCapabilities.readActivities: 'read-activities',
  FeedOwnDataOwnCapabilities.readFeed: 'read-feed',
  FeedOwnDataOwnCapabilities.unfollow: 'unfollow',
  FeedOwnDataOwnCapabilities.updateAnyActivity: 'update-any-activity',
  FeedOwnDataOwnCapabilities.updateAnyComment: 'update-any-comment',
  FeedOwnDataOwnCapabilities.updateFeed: 'update-feed',
  FeedOwnDataOwnCapabilities.updateFeedFollowers: 'update-feed-followers',
  FeedOwnDataOwnCapabilities.updateFeedMembers: 'update-feed-members',
  FeedOwnDataOwnCapabilities.updateOwnActivity: 'update-own-activity',
  FeedOwnDataOwnCapabilities.updateOwnActivityBookmark:
      'update-own-activity-bookmark',
  FeedOwnDataOwnCapabilities.updateOwnComment: 'update-own-comment',
  FeedOwnDataOwnCapabilities.unknown: '_unknown',
};

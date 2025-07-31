// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_or_create_feed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrCreateFeedResponse _$GetOrCreateFeedResponseFromJson(
        Map<String, dynamic> json) =>
    GetOrCreateFeedResponse(
      activities: (json['activities'] as List<dynamic>)
          .map((e) => ActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      aggregatedActivities: (json['aggregated_activities'] as List<dynamic>)
          .map((e) =>
              AggregatedActivityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as bool,
      duration: json['duration'] as String,
      feed: FeedResponse.fromJson(json['feed'] as Map<String, dynamic>),
      followers: (json['followers'] as List<dynamic>)
          .map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      followersPagination: json['followers_pagination'] == null
          ? null
          : PagerResponse.fromJson(
              json['followers_pagination'] as Map<String, dynamic>),
      following: (json['following'] as List<dynamic>)
          .map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      followingPagination: json['following_pagination'] == null
          ? null
          : PagerResponse.fromJson(
              json['following_pagination'] as Map<String, dynamic>),
      memberPagination: json['member_pagination'] == null
          ? null
          : PagerResponse.fromJson(
              json['member_pagination'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>)
          .map((e) => FeedMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      notificationStatus: json['notification_status'] == null
          ? null
          : NotificationStatusResponse.fromJson(
              json['notification_status'] as Map<String, dynamic>),
      ownCapabilities: (json['own_capabilities'] as List<dynamic>)
          .map((e) => $enumDecode(_$FeedOwnCapabilityEnumMap, e))
          .toList(),
      ownFollows: (json['own_follows'] as List<dynamic>?)
          ?.map((e) => FollowResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownMembership: json['own_membership'] == null
          ? null
          : FeedMemberResponse.fromJson(
              json['own_membership'] as Map<String, dynamic>),
      pinnedActivities: (json['pinned_activities'] as List<dynamic>)
          .map((e) => ActivityPinResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$GetOrCreateFeedResponseToJson(
        GetOrCreateFeedResponse instance) =>
    <String, dynamic>{
      'activities': instance.activities.map((e) => e.toJson()).toList(),
      'aggregated_activities':
          instance.aggregatedActivities.map((e) => e.toJson()).toList(),
      'created': instance.created,
      'duration': instance.duration,
      'feed': instance.feed.toJson(),
      'followers': instance.followers.map((e) => e.toJson()).toList(),
      'followers_pagination': instance.followersPagination?.toJson(),
      'following': instance.following.map((e) => e.toJson()).toList(),
      'following_pagination': instance.followingPagination?.toJson(),
      'member_pagination': instance.memberPagination?.toJson(),
      'members': instance.members.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'notification_status': instance.notificationStatus?.toJson(),
      'own_capabilities': instance.ownCapabilities
          .map((e) => _$FeedOwnCapabilityEnumMap[e]!)
          .toList(),
      'own_follows': instance.ownFollows?.map((e) => e.toJson()).toList(),
      'own_membership': instance.ownMembership?.toJson(),
      'pinned_activities':
          instance.pinnedActivities.map((e) => e.toJson()).toList(),
      'prev': instance.prev,
    };

const _$FeedOwnCapabilityEnumMap = {
  FeedOwnCapability.addActivity: 'add-activity',
  FeedOwnCapability.addActivityReaction: 'add-activity-reaction',
  FeedOwnCapability.addComment: 'add-comment',
  FeedOwnCapability.addCommentReaction: 'add-comment-reaction',
  FeedOwnCapability.bookmarkActivity: 'bookmark-activity',
  FeedOwnCapability.createFeed: 'create-feed',
  FeedOwnCapability.deleteBookmark: 'delete-bookmark',
  FeedOwnCapability.deleteComment: 'delete-comment',
  FeedOwnCapability.deleteFeed: 'delete-feed',
  FeedOwnCapability.editBookmark: 'edit-bookmark',
  FeedOwnCapability.follow: 'follow',
  FeedOwnCapability.inviteFeed: 'invite-feed',
  FeedOwnCapability.joinFeed: 'join-feed',
  FeedOwnCapability.leaveFeed: 'leave-feed',
  FeedOwnCapability.manageFeedGroup: 'manage-feed-group',
  FeedOwnCapability.markActivity: 'mark-activity',
  FeedOwnCapability.pinActivity: 'pin-activity',
  FeedOwnCapability.queryFeedMembers: 'query-feed-members',
  FeedOwnCapability.queryFollows: 'query-follows',
  FeedOwnCapability.readActivities: 'read-activities',
  FeedOwnCapability.readFeed: 'read-feed',
  FeedOwnCapability.removeActivity: 'remove-activity',
  FeedOwnCapability.removeActivityReaction: 'remove-activity-reaction',
  FeedOwnCapability.removeCommentReaction: 'remove-comment-reaction',
  FeedOwnCapability.unfollow: 'unfollow',
  FeedOwnCapability.updateActivity: 'update-activity',
  FeedOwnCapability.updateComment: 'update-comment',
  FeedOwnCapability.updateFeed: 'update-feed',
  FeedOwnCapability.updateFeedFollowers: 'update-feed-followers',
  FeedOwnCapability.updateFeedMembers: 'update-feed-members',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'own_capabilities_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnCapabilitiesBatchResponse _$OwnCapabilitiesBatchResponseFromJson(
        Map<String, dynamic> json) =>
    OwnCapabilitiesBatchResponse(
      capabilities: (json['capabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => $enumDecode(_$FeedOwnCapabilityEnumMap, e))
                .toList()),
      ),
      duration: json['duration'] as String,
    );

Map<String, dynamic> _$OwnCapabilitiesBatchResponseToJson(
        OwnCapabilitiesBatchResponse instance) =>
    <String, dynamic>{
      'capabilities': instance.capabilities.map((k, e) =>
          MapEntry(k, e.map((e) => _$FeedOwnCapabilityEnumMap[e]!).toList())),
      'duration': instance.duration,
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

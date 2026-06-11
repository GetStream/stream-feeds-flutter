// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrichment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrichmentOptions _$EnrichmentOptionsFromJson(Map<String, dynamic> json) => EnrichmentOptions(
  enrichOwnFollowings: json['enrich_own_followings'] as bool?,
  includeFlatActivities: json['include_flat_activities'] as bool?,
  includeScoreVars: json['include_score_vars'] as bool?,
  skipActivity: json['skip_activity'] as bool?,
  skipActivityCollections: json['skip_activity_collections'] as bool?,
  skipActivityComments: json['skip_activity_comments'] as bool?,
  skipActivityCurrentFeed: json['skip_activity_current_feed'] as bool?,
  skipActivityMentionedUsers: json['skip_activity_mentioned_users'] as bool?,
  skipActivityOwnBookmarks: json['skip_activity_own_bookmarks'] as bool?,
  skipActivityParents: json['skip_activity_parents'] as bool?,
  skipActivityPoll: json['skip_activity_poll'] as bool?,
  skipActivityReactions: json['skip_activity_reactions'] as bool?,
  skipActivityRefreshImageUrls: json['skip_activity_refresh_image_urls'] as bool?,
  skipAll: json['skip_all'] as bool?,
  skipFeedMemberUser: json['skip_feed_member_user'] as bool?,
  skipFollowers: json['skip_followers'] as bool?,
  skipFollowing: json['skip_following'] as bool?,
  skipOwnCapabilities: json['skip_own_capabilities'] as bool?,
  skipOwnFollows: json['skip_own_follows'] as bool?,
  skipPins: json['skip_pins'] as bool?,
);

Map<String, dynamic> _$EnrichmentOptionsToJson(EnrichmentOptions instance) => <String, dynamic>{
  'enrich_own_followings': instance.enrichOwnFollowings,
  'include_flat_activities': instance.includeFlatActivities,
  'include_score_vars': instance.includeScoreVars,
  'skip_activity': instance.skipActivity,
  'skip_activity_collections': instance.skipActivityCollections,
  'skip_activity_comments': instance.skipActivityComments,
  'skip_activity_current_feed': instance.skipActivityCurrentFeed,
  'skip_activity_mentioned_users': instance.skipActivityMentionedUsers,
  'skip_activity_own_bookmarks': instance.skipActivityOwnBookmarks,
  'skip_activity_parents': instance.skipActivityParents,
  'skip_activity_poll': instance.skipActivityPoll,
  'skip_activity_reactions': instance.skipActivityReactions,
  'skip_activity_refresh_image_urls': instance.skipActivityRefreshImageUrls,
  'skip_all': instance.skipAll,
  'skip_feed_member_user': instance.skipFeedMemberUser,
  'skip_followers': instance.skipFollowers,
  'skip_following': instance.skipFollowing,
  'skip_own_capabilities': instance.skipOwnCapabilities,
  'skip_own_follows': instance.skipOwnFollows,
  'skip_pins': instance.skipPins,
};

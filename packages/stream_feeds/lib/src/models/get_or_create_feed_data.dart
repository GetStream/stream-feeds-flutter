import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import '../state/query/activities_query.dart';
import 'activity_data.dart';
import 'activity_pin_data.dart';
import 'aggregated_activity_data.dart';
import 'feed_data.dart';
import 'feed_member_data.dart';
import 'follow_data.dart';
import 'pagination_data.dart';
import 'query_configuration.dart';

part 'get_or_create_feed_data.freezed.dart';

/// Data returned when getting or creating a feed.
///
/// Contains feed activities, relationships, members, and configuration
/// information from the Stream Feeds API.
@freezed
class GetOrCreateFeedData with _$GetOrCreateFeedData {
  /// Creates a new [GetOrCreateFeedData] instance.
  const GetOrCreateFeedData({
    required this.activities,
    required this.activitiesQueryConfig,
    required this.feed,
    this.followers = const [],
    this.following = const [],
    this.followRequests = const [],
    required this.members,
    this.pinnedActivities = const [],
    this.aggregatedActivities = const [],
    this.notificationStatus,
  });

  /// A paginated result of activities associated with the feed.
  @override
  final PaginationResult<ActivityData> activities;

  /// The list of aggregated activities in the feed.
  @override
  final List<AggregatedActivityData> aggregatedActivities;

  /// The configuration used to query activities.
  @override
  final QueryConfiguration<ActivityData> activitiesQueryConfig;

  /// The feed data associated with the feed.
  @override
  final FeedData feed;

  /// A list of followers for the feed.
  @override
  final List<FollowData> followers;

  /// A list of feeds that this feed is following.
  @override
  final List<FollowData> following;

  /// A list of follow requests for the feed.
  @override
  final List<FollowData> followRequests;

  /// A paginated result of members in the feed.
  @override
  final PaginationResult<FeedMemberData> members;

  /// A list of activities that are pinned in the feed.
  @override
  final List<ActivityPinData> pinnedActivities;

  /// The information about the notification status (read / seen activities).
  @override
  final NotificationStatusResponse? notificationStatus;
}

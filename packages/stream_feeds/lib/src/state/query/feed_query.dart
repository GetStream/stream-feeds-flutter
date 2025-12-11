import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart';
import '../../models/activity_data.dart';
import '../../models/feed_id.dart';
import '../../models/feed_input_data.dart';
import '../../utils/filter.dart';
import 'activities_query.dart';

part 'feed_query.freezed.dart';

/// A query for retrieving and managing feed data from Stream Feeds.
///
/// Defines parameters for fetching activities, followers, following, and members
/// for a specific feed. Supports filtering, pagination, and real-time updates.
///
/// ## Example
/// ```dart
/// final query = FeedQuery(
///   fid: FeedId(group: 'user', id: 'john'),
///   activityFilter: Filter.equal(ActivitiesFilterField.activityType, 'post'),
///   activityLimit: 25,
///   watch: true,
/// );
/// ```
@freezed
class FeedQuery with _$FeedQuery {
  const FeedQuery({
    required this.fid,
    this.activityFilter,
    this.activityLimit,
    this.activityNext,
    this.activityPrevious,
    this.data,
    this.externalRanking,
    this.followerLimit,
    this.followingLimit,
    this.interestWeights,
    this.memberLimit,
    this.view,
    this.watch = true,
  });

  /// The unique identifier for the feed.
  @override
  final FeedId fid;

  /// Filter criteria for activities in the feed.
  ///
  /// Use [ActivitiesFilterField] for type-safe field references.
  @override
  final ActivitiesFilter? activityFilter;

  /// The maximum number of activities to retrieve.
  @override
  final int? activityLimit;

  /// The next page cursor for activity pagination.
  @override
  final String? activityNext;

  /// The previous page cursor for activity pagination.
  @override
  final String? activityPrevious;

  /// Additional data to associate with the feed.
  @override
  final FeedInputData? data;

  /// Additional data used for ranking activities in the feed.
  @override
  final Map<String, Object>? externalRanking;

  /// The maximum number of followers to retrieve.
  @override
  final int? followerLimit;

  /// The maximum number of following users to retrieve.
  @override
  final int? followingLimit;

  /// Weights for different interests to influence activity ranking.
  @override
  final Map<String, double>? interestWeights;

  /// The maximum number of feed members to retrieve.
  @override
  final int? memberLimit;

  /// Overwrite the default ranking or aggregation logic for this feed (for example: good for split testing).
  @override
  final String? view;

  /// Whether to subscribe to web-socket events for this feed.
  @override
  final bool watch;
}

/// Extension that converts a [FeedQuery] to a [GetOrCreateFeedRequest].
extension FeedQueryRequest on FeedQuery {
  GetOrCreateFeedRequest toRequest() {
    return GetOrCreateFeedRequest(
      limit: activityLimit,
      next: activityNext,
      prev: activityPrevious,
      view: view,
      watch: watch,
      data: data?.toRequest(),
      externalRanking: externalRanking,
      filter: activityFilter?.toRequest(),
      followersPagination: followerLimit?.let((it) => PagerRequest(limit: it)),
      followingPagination: followingLimit?.let((it) => PagerRequest(limit: it)),
      interestWeights: interestWeights,
      memberPagination: memberLimit?.let((it) => PagerRequest(limit: it)),
    );
  }
}

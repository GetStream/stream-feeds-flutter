import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/activity_data.dart';
import '../models/activity_pin_data.dart';
import '../models/feed_data.dart';
import '../models/feed_id.dart';
import '../models/feed_member_data.dart';
import '../models/follow_data.dart';
import '../models/get_or_create_feed_data.dart';
import '../models/model_updates.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import '../state/query/activities_query.dart';
import '../state/query/feed_query.dart';
import '../state/query/feeds_query.dart';

/// Repository for managing feeds and feed-related operations.
///
/// Provides comprehensive feed management including creation, querying,
/// updating, and deletion. Supports social relationships like follows and
/// members, activity management, real-time updates, and access control.
///
/// All methods return [Result] objects for explicit error handling.
class FeedsRepository {
  /// Creates a new [FeedsRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const FeedsRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  // region Creating or Getting the state of the feed

  /// Retrieves or creates a feed.
  ///
  /// Fetches an existing feed or creates a new one using the specified [query] parameters.
  ///
  /// Returns a [Result] containing [GetOrCreateFeedData] or an error.
  Future<Result<GetOrCreateFeedData>> getOrCreateFeed(FeedQuery query) async {
    final fid = query.fid;
    final request = query.toRequest();

    final result = await _api.getOrCreateFeed(
      feedGroupId: fid.group,
      feedId: fid.id,
      getOrCreateFeedRequest: request,
    );

    return result.map((response) {
      final rawFollowers = response.followers.map((f) => f.toModel());
      final rawFollowing = response.following.map((f) => f.toModel());

      return GetOrCreateFeedData(
        activities: PaginationResult(
          items: response.activities.map((a) => a.toModel()).toList(),
          pagination: PaginationData(
            next: response.next,
            previous: response.prev,
          ),
        ),
        activitiesQueryConfig: QueryConfiguration(
          filter: query.activityFilter,
          sort: ActivitiesSort.defaultSort,
        ),
        feed: response.feed.toModel(),
        followers: rawFollowers.where((f) => f.isFollowerOf(fid)).toList(),
        following: rawFollowing.where((f) => f.isFollowingFeed(fid)).toList(),
        followRequests: rawFollowers.where((f) => f.isFollowRequest).toList(),
        members: PaginationResult(
          items: response.members.map((m) => m.toModel()).toList(),
          pagination: switch (response.memberPagination) {
            final pagination? => pagination.toModel(),
            _ => PaginationData.empty,
          },
        ),
        ownCapabilities: response.ownCapabilities,
        pinnedActivities:
            response.pinnedActivities.map((a) => a.toModel()).toList(),
      );
    });
  }

  /// Stops watching a feed for real-time updates.
  ///
  /// Disables real-time event notifications for the specified [feedId].
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> stopWatching(FeedId feedId) {
    return _api.stopWatchingFeed(
      feedGroupId: feedId.group,
      feedId: feedId.id,
    );
  }

  // endregion

  // region Managing the feed

  /// Deletes a feed from the system.
  ///
  /// Permanently removes the feed with [feedId]. When [hardDelete] is true,
  /// performs a complete deletion; otherwise marks the feed as deleted.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteFeed(
    FeedId feedId, {
    bool hardDelete = false,
  }) {
    return _api.deleteFeed(
      feedGroupId: feedId.group,
      feedId: feedId.id,
      hardDelete: hardDelete,
    );
  }

  /// Updates an existing feed.
  ///
  /// Modifies the feed with [feedId] using the provided [request] data.
  ///
  /// Returns a [Result] containing the updated [FeedData] or an error.
  Future<Result<FeedData>> updateFeed({
    required FeedId feedId,
    required api.UpdateFeedRequest request,
  }) async {
    final result = await _api.updateFeed(
      feedGroupId: feedId.group,
      feedId: feedId.id,
      updateFeedRequest: request,
    );

    return result.map((response) => response.feed.toModel());
  }

  // endregion

  // region Feed lists

  /// Queries feeds.
  ///
  /// Searches for feeds using the specified [query] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedData] or an error.
  Future<Result<PaginationResult<FeedData>>> queryFeeds(
    FeedsQuery query,
  ) async {
    final request = query.toRequest();
    final result = await _api.queryFeeds(queryFeedsRequest: request);

    return result.map((response) {
      final feeds = response.feeds.map((f) => f.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: feeds, pagination: pagination);
    });
  }

  // endregion

  // region Follows

  /// Queries follow suggestions for a specific feed group.
  ///
  /// Retrieves suggested feeds to follow based on the specified [feedGroupId].
  ///
  /// Returns a [Result] containing a list of suggested [FeedData] or an error.
  Future<Result<List<FeedData>>> queryFollowSuggestions({
    required String feedGroupId,
    int? limit,
  }) async {
    final result = await _api.getFollowSuggestions(
      feedGroupId: feedGroupId,
      limit: limit,
    );

    return result.map(
      (response) => response.suggestions.map((f) => f.toModel()).toList(),
    );
  }

  /// Queries follows.
  ///
  /// Retrieves follow relationships for the feed using the specified [request] filters.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FollowData] or an error.
  Future<Result<PaginationResult<FollowData>>> queryFollows(
    api.QueryFollowsRequest request,
  ) async {
    final result = await _api.queryFollows(
      queryFollowsRequest: request,
    );

    return result.map((response) {
      final follows = response.follows.map((f) => f.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: follows, pagination: pagination);
    });
  }

  /// Creates a follow relationship.
  ///
  /// Establishes a follow relationship using the provided [request] data.
  ///
  /// Returns a [Result] containing the created [FollowData] or an error.
  Future<Result<FollowData>> follow(api.FollowRequest request) async {
    final result = await _api.follow(followRequest: request);

    return result.map((response) => response.follow.toModel());
  }

  /// Removes a follow relationship between feeds.
  ///
  /// Unfollows the [target] feed from the [source] feed.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> unfollow({
    required FeedId source,
    required FeedId target,
  }) {
    return _api.unfollow(
      source: source.rawValue,
      target: target.rawValue,
    );
  }

  /// Accepts a follow request.
  ///
  /// Approves a follow request using the provided [request] data.
  ///
  /// Returns a [Result] containing the accepted [FollowData] or an error.
  Future<Result<FollowData>> acceptFollow(
    api.AcceptFollowRequest request,
  ) async {
    final result = await _api.acceptFollow(
      acceptFollowRequest: request,
    );

    return result.map((response) => response.follow.toModel());
  }

  /// Rejects a follow request.
  ///
  /// Declines a follow request using the provided [request] data.
  ///
  /// Returns a [Result] containing the rejected [FollowData] or an error.
  Future<Result<FollowData>> rejectFollow(
    api.RejectFollowRequest request,
  ) async {
    final result = await _api.rejectFollow(
      rejectFollowRequest: request,
    );

    return result.map((response) => response.follow.toModel());
  }

  // endregion

  // region Members

  /// Updates the members of a feed.
  ///
  /// Modifies the members of the feed [fid] using the provided [request] data.
  ///
  /// Returns a [Result] containing [ModelUpdates] with member changes or an error.
  Future<Result<ModelUpdates<FeedMemberData>>> updateFeedMembers(
    FeedId fid,
    api.UpdateFeedMembersRequest request,
  ) async {
    final result = await _api.updateFeedMembers(
      feedGroupId: fid.group,
      feedId: fid.id,
      updateFeedMembersRequest: request,
    );

    return result.map(
      (response) => ModelUpdates(
        added: response.added.map((m) => m.toModel()).toList(),
        removedIds: response.removedIds,
        updated: response.updated.map((m) => m.toModel()).toList(),
      ),
    );
  }

  /// Accepts a feed member invitation.
  ///
  /// Approves membership for the current user in the feed [feedId].
  ///
  /// Returns a [Result] containing the accepted [FeedMemberData] or an error.
  Future<Result<FeedMemberData>> acceptFeedMember(FeedId feedId) async {
    final result = await _api.acceptFeedMemberInvite(
      feedGroupId: feedId.group,
      feedId: feedId.id,
    );

    return result.map((response) => response.member.toModel());
  }

  /// Rejects a feed member invitation.
  ///
  /// Declines membership for the current user in the feed [feedId].
  ///
  /// Returns a [Result] containing the rejected [FeedMemberData] or an error.
  Future<Result<FeedMemberData>> rejectFeedMember(FeedId feedId) async {
    final result = await _api.rejectFeedMemberInvite(
      feedGroupId: feedId.group,
      feedId: feedId.id,
    );

    return result.map((response) => response.member.toModel());
  }

  /// Queries members of a feed.
  ///
  /// Retrieves members for the feed [feedId] using the specified [request] filters and pagination.
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedMemberData] or an error.
  Future<Result<PaginationResult<FeedMemberData>>> queryFeedMembers(
    FeedId feedId,
    api.QueryFeedMembersRequest request,
  ) async {
    final result = await _api.queryFeedMembers(
      feedGroupId: feedId.group,
      feedId: feedId.id,
      queryFeedMembersRequest: request,
    );

    return result.map((response) {
      final members = response.members.map((m) => m.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: members, pagination: pagination);
    });
  }

  // endregion
}

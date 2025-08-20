import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
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
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const FeedsRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  // region Creating or Getting the state of the feed

  /// Retrieves or creates a feed based on the provided [FeedQuery].
  ///
  /// Returns a [Result] containing [GetOrCreateFeedData] or an error.
  Future<Result<GetOrCreateFeedData>> getOrCreateFeed(FeedQuery query) {
    return runSafely(() async {
      final fid = query.fid;
      final request = query.toRequest();

      final response = await _apiClient.getOrCreateFeed(
        feedGroupId: fid.group,
        feedId: fid.id,
        getOrCreateFeedRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from getOrCreateFeed');
      }

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
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> stopWatching(FeedId feedId) {
    return runSafely(() async {
      await _apiClient.stopWatchingFeed(
        feedGroupId: feedId.group,
        feedId: feedId.id,
      );
    });
  }

  // endregion

  // region Managing the feed

  /// Deletes a feed from the system.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> deleteFeed(
    FeedId feedId, {
    bool hardDelete = false,
  }) {
    return runSafely(() async {
      await _apiClient.deleteFeed(
        feedGroupId: feedId.group,
        feedId: feedId.id,
        hardDelete: hardDelete,
      );
    });
  }

  /// Updates an existing feed based on the provided [UpdateFeedRequest].
  ///
  /// Returns a [Result] containing the updated [FeedData] or an error.
  Future<Result<FeedData>> updateFeed({
    required FeedId feedId,
    required api.UpdateFeedRequest request,
  }) {
    return runSafely(() async {
      final response = await _apiClient.updateFeed(
        feedGroupId: feedId.group,
        feedId: feedId.id,
        updateFeedRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updateFeed');
      }

      return response.feed.toModel();
    });
  }

  // endregion

  // region Feed lists

  /// Queries feeds based on the provided [FeedsQuery].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedData] or an error.
  Future<Result<PaginationResult<FeedData>>> queryFeeds(FeedsQuery query) {
    return runSafely(() async {
      final request = query.toRequest();
      final response = await _apiClient.feedsQueryFeeds(
        queryFeedsRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryFeeds');
      }

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
  /// Returns a [Result] containing a list of suggested [FeedData] or an error.
  Future<Result<List<FeedData>>> queryFollowSuggestions({
    required String feedGroupId,
    int? limit,
  }) {
    return runSafely(() async {
      final response = await _apiClient.getFollowSuggestions(
        feedGroupId: feedGroupId,
        limit: limit,
      );

      if (response == null) {
        throw ClientException(
          message: 'No result data from queryFollowSuggestions',
        );
      }

      return response.suggestions.map((f) => f.toModel()).toList();
    });
  }

  /// Queries follows based on the provided [QueryFollowsRequest].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FollowData] or an error.
  Future<Result<PaginationResult<FollowData>>> queryFollows(
    api.QueryFollowsRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.queryFollows(
        queryFollowsRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryFollows');
      }

      final follows = response.follows.map((f) => f.toModel()).toList();
      final pagination = PaginationData(
        next: response.next,
        previous: response.prev,
      );

      return PaginationResult(items: follows, pagination: pagination);
    });
  }

  /// Creates a follow relationship based on the provided [SingleFollowRequest].
  ///
  /// Returns a [Result] containing the created [FollowData] or an error.
  Future<Result<FollowData>> follow(api.SingleFollowRequest request) {
    return runSafely(() async {
      final response = await _apiClient.follow(singleFollowRequest: request);

      if (response == null) {
        throw ClientException(message: 'No result data from follow');
      }

      return response.follow.toModel();
    });
  }

  /// Removes a follow relationship between feeds.
  ///
  /// Returns a [Result] containing void or an error.
  Future<Result<void>> unfollow({
    required FeedId source,
    required FeedId target,
  }) {
    return runSafely(() async {
      await _apiClient.unfollow(
        source: source.rawValue,
        target: target.rawValue,
      );
    });
  }

  /// Accepts a follow request based on the provided [AcceptFollowRequest].
  ///
  /// Returns a [Result] containing the accepted [FollowData] or an error.
  Future<Result<FollowData>> acceptFollow(
    api.AcceptFollowRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.acceptFollow(
        acceptFollowRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from acceptFollow');
      }

      return response.follow.toModel();
    });
  }

  /// Rejects a follow request based on the provided [RejectFollowRequest].
  ///
  /// Returns a [Result] containing the rejected [FollowData] or an error.
  Future<Result<FollowData>> rejectFollow(
    api.RejectFollowRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.rejectFollow(
        rejectFollowRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from rejectFollow');
      }

      return response.follow.toModel();
    });
  }

  // endregion

  // region Members

  /// Updates the members of a feed based on the provided [UpdateFeedMembersRequest].
  ///
  /// Returns a [Result] containing [ModelUpdates] with member changes or an error.
  Future<Result<ModelUpdates<FeedMemberData>>> updateFeedMembers(
    FeedId fid,
    api.UpdateFeedMembersRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.updateFeedMembers(
        feedGroupId: fid.group,
        feedId: fid.id,
        updateFeedMembersRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from updateFeedMembers');
      }

      return ModelUpdates(
        added: response.added.map((m) => m.toModel()).toList(),
        removedIds: response.removedIds,
        updated: response.updated.map((m) => m.toModel()).toList(),
      );
    });
  }

  /// Accepts a feed member invitation.
  ///
  /// Returns a [Result] containing the accepted [FeedMemberData] or an error.
  Future<Result<FeedMemberData>> acceptFeedMember(FeedId feedId) {
    return runSafely(() async {
      final response = await _apiClient.acceptFeedMemberInvite(
        feedGroupId: feedId.group,
        feedId: feedId.id,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from acceptFeedMember');
      }

      return response.member.toModel();
    });
  }

  /// Rejects a feed member invitation.
  ///
  /// Returns a [Result] containing the rejected [FeedMemberData] or an error.
  Future<Result<FeedMemberData>> rejectFeedMember(FeedId feedId) {
    return runSafely(() async {
      final response = await _apiClient.rejectFeedMemberInvite(
        feedGroupId: feedId.group,
        feedId: feedId.id,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from rejectFeedMember');
      }

      return response.member.toModel();
    });
  }

  /// Queries members of a feed based on the provided [QueryFeedMembersRequest].
  ///
  /// Returns a [Result] containing a [PaginationResult] of [FeedMemberData] or an error.
  Future<Result<PaginationResult<FeedMemberData>>> queryFeedMembers(
    FeedId feedId,
    api.QueryFeedMembersRequest request,
  ) {
    return runSafely(() async {
      final response = await _apiClient.queryFeedMembers(
        feedGroupId: feedId.group,
        feedId: feedId.id,
        queryFeedMembersRequest: request,
      );

      if (response == null) {
        throw ClientException(message: 'No result data from queryFeedMembers');
      }

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

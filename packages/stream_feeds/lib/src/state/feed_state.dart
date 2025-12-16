import 'dart:math';

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import '../models/activity_data.dart';
import '../models/activity_pin_data.dart';
import '../models/aggregated_activity_data.dart';
import '../models/bookmark_data.dart';
import '../models/comment_data.dart';
import '../models/feed_data.dart';
import '../models/feed_id.dart';
import '../models/feed_member_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/follow_data.dart';
import '../models/get_or_create_feed_data.dart';
import '../models/mark_activity_data.dart';
import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import 'insertion_action.dart';
import 'member_list_state.dart';
import 'query/activities_query.dart';
import 'query/feed_query.dart';

part 'feed_state.freezed.dart';

/// Manages the state of a feed and handles state updates.
///
/// Provides methods to update the feed state in response to data changes,
/// user interactions, and real-time events from the Stream Feeds API.
class FeedStateNotifier extends StateNotifier<FeedState> {
  FeedStateNotifier({
    required FeedState initialState,
    required this.currentUserId,
    required this.memberList,
  }) : super(initialState) {
    // Set up synchronization for member list updates
    _setupMemberListSynchronization();
  }

  final String currentUserId;
  final MemberListStateNotifier memberList;

  RemoveListener? _removeMemberListListener;
  void _setupMemberListSynchronization() {
    _removeMemberListListener = memberList.addListener((memberListState) {
      // Synchronize state with the member list state
      state = state.copyWith(members: memberListState.members);
    });
  }

  QueryConfiguration<ActivityData>? _activitiesQueryConfig;
  List<Sort<ActivityData>> get activitiesSort {
    return _activitiesQueryConfig?.sort ?? ActivitiesSort.defaultSort;
  }

  /// Handles the result of a query for the feed.
  void onQueryFeed(GetOrCreateFeedData result) {
    _activitiesQueryConfig = result.activitiesQueryConfig;

    state = state.copyWith(
      activities: result.activities.items,
      activitiesPagination: result.activities.pagination,
      feed: result.feed,
      followers: result.followers,
      following: result.following,
      // Note: The members are not directly set here to avoid overwriting the
      // existing member list. Instead, we will synchronize the members
      // through the `memberList` state notifier.
      //
      // members: result.members.items,
      followRequests: result.followRequests,
      pinnedActivities: result.pinnedActivities,
      aggregatedActivities: result.aggregatedActivities,
      notificationStatus: result.notificationStatus,
    );

    // Synchronize member list with the feed members
    memberList.onQueryMoreMembers(result.members, const QueryConfiguration());
  }

  /// Handles the result of a query for more activities.
  void onQueryMoreActivities(
    PaginationResult<ActivityData> activities,
    List<AggregatedActivityData> aggregatedActivities,
    QueryConfiguration<ActivityData> queryConfig,
  ) {
    _activitiesQueryConfig = queryConfig;

    // Merge the new activities with the existing ones
    final updatedActivities = state.activities.merge(
      activities.items,
      key: (it) => it.id,
      compare: activitiesSort.compare,
    );
    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities,
      key: (it) => it.group,
    );

    state = state.copyWith(
      activities: updatedActivities,
      aggregatedActivities: updatedAggregatedActivities,
      activitiesPagination: activities.pagination,
    );
  }

  /// Handles updates to the feed state when a new activity is added.
  void onActivityAdded(
    ActivityData activity, {
    InsertionAction insertionAction = InsertionAction.addToStart,
  }) {
    final insertAt = switch (insertionAction) {
      InsertionAction.addToStart => 0,
      InsertionAction.addToEnd => state.activities.length,
      InsertionAction.ignore => null,
    };

    // Return early if the activity should be ignored
    if (insertAt == null) return;

    // Upsert the new activity into the existing activities list
    final updatedActivities = state.activities.upsert(
      activity,
      key: (it) => it.id,
      insertAt: (_) => insertAt,
    );

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when an activity is updated.
  void onActivityUpdated(ActivityData activity) {
    state = state.updateActivitiesWhere(
      (it) => it.id == activity.id,
      update: (it) => it.updateWith(activity),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when activity is removed.
  void onActivityRemoved(ActivityData activity) {
    return onActivityDeleted(activity.id);
  }

  /// Handles updates to the feed state when an activity is deleted.
  void onActivityDeleted(String activityId) {
    state = state.removeActivitiesWhere((it) => it.id == activityId);
  }

  /// Handles updates to the feed state when an activity is hidden.
  void onActivityHidden({
    required String activityId,
    required bool hidden,
  }) {
    state = state.updateActivitiesWhere(
      (it) => it.id == activityId,
      update: (it) => it.copyWith(hidden: hidden),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when an activity is pinned.
  void onActivityPinned(ActivityPinData activityPin) {
    // Upsert the pinned activity into the existing pinned activities list
    final updatedPinnedActivities = state.pinnedActivities.upsert(
      activityPin,
      key: (it) => it.id,
    );

    state = state.copyWith(pinnedActivities: updatedPinnedActivities);
  }

  /// Handles updates to the feed state when an activity is unpinned.
  void onActivityUnpinned(String activityId) {
    // Remove the pinned activity with the given activityId
    final updatedPinnedActivities = state.pinnedActivities.where((pin) {
      return pin.activity.id != activityId;
    }).toList();

    state = state.copyWith(pinnedActivities: updatedPinnedActivities);
  }

  /// Handles updates to the feed state when an activity is marked read or seen.
  void onActivityMarked(MarkActivityData markData) {
    // Update the state based on the type of mark operation
    state = markData.handle(
      // If markAllRead is true, mark all activities as read
      markAllRead: () => state.markAllRead(),
      // If markAllSeen is true, mark all activities as seen
      markAllSeen: () => state.markAllSeen(),
      // If markRead contains specific IDs, mark those as read
      markRead: (read) => state.markRead(read),
      // If markSeen contains specific IDs, mark those as seen
      markSeen: (seen) => state.markSeen(seen),
      // If markWatched contains specific IDs, mark those as watched
      markWatched: (watched) => state.markWatched(watched),
      // For other cases, return the current state without changes
      orElse: (MarkActivityData data) => state,
    );
  }

  /// Handles updates to the feed state when the notification feed is updated.
  void onNotificationFeedUpdated(
    NotificationStatusResponse? notificationStatus,
    List<AggregatedActivityData>? aggregatedActivities,
  ) {
    // Update the aggregated activities and notification status in the state
    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities ?? [],
      key: (it) => it.group,
    );

    state = state.copyWith(
      notificationStatus: notificationStatus,
      aggregatedActivities: updatedAggregatedActivities,
    );
  }

  /// Handles updates to the feed state when the stories feed is updated.
  void onStoriesFeedUpdated(
    List<AggregatedActivityData>? aggregatedActivities,
  ) {
    // Update the aggregated activities in the state
    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities ?? [],
      key: (it) => it.group,
    );

    state = state.copyWith(
      aggregatedActivities: updatedAggregatedActivities,
    );
  }

  /// Handles updates to the feed state when a bookmark is added.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by adding or updating
  /// the bookmark in its own bookmarks list. Only adds bookmarks that belong to
  /// the current user.
  void onBookmarkAdded(BookmarkData bookmark) => onBookmarkUpdated(bookmark);

  /// Handles updates to the feed state when a bookmark is updated.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by adding or updating
  /// the bookmark in its own bookmarks list. Only adds bookmarks that belong to
  /// the current user.
  void onBookmarkUpdated(BookmarkData bookmark) {
    state = state.updateActivitiesWhere(
      (it) => it.id == bookmark.activity.id,
      update: (it) => it.upsertBookmark(bookmark, currentUserId),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when a bookmark is removed.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by removing
  /// the bookmark from its own bookmarks list. Only removes bookmarks that
  /// belong to the current user.
  void onBookmarkRemoved(BookmarkData bookmark) {
    state = state.updateActivitiesWhere(
      (it) => it.id == bookmark.activity.id,
      update: (it) => it.removeBookmark(bookmark, currentUserId),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when a comment is added or removed.
  void onCommentAdded(CommentData comment) => onCommentUpdated(comment);

  /// Handles updates to the feed state when a comment is updated.
  void onCommentUpdated(CommentData comment) {
    // Add or update the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.upsertComment(comment),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when a comment is removed.
  void onCommentRemoved(CommentData comment) {
    // Remove the comment from the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.removeComment(comment),
      compare: activitiesSort.compare,
    );
  }

  /// Handles updates to the feed state when a comment reaction is added.
  void onCommentReactionAdded(
    CommentData comment,
    FeedsReactionData reaction,
  ) {
    // Add the reaction to the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) {
        return it.upsertCommentReaction(comment, reaction, currentUserId);
      },
    );
  }

  /// Handles updates to the feed state when a comment reaction is updated.
  void onCommentReactionUpdated(
    CommentData comment,
    FeedsReactionData reaction,
  ) {
    // Update the reaction on the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) {
        return it.upsertUniqueCommentReaction(comment, reaction, currentUserId);
      },
    );
  }

  /// Handles updates to the feed state when a comment reaction is removed.
  void onCommentReactionRemoved(
    CommentData comment,
    FeedsReactionData reaction,
  ) {
    // Remove the reaction from the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) {
        return it.removeCommentReaction(comment, reaction, currentUserId);
      },
    );
  }

  /// Handles updates to the feed state when the feed is deleted.
  void onFeedDeleted() {
    // Clear the feed state when the feed is deleted
    state = state.copyWith(
      activities: [],
      aggregatedActivities: [],
      feed: null,
      followers: [],
      following: [],
      followRequests: [],
      pinnedActivities: [],
      notificationStatus: null,
      activitiesPagination: null,
    );

    // Optionally, clear the member list as well
    memberList.clear();
  }

  /// Handles updates to the feed state when the feed is updated.
  void onFeedUpdated(FeedData feed) {
    final currentFeed = state.feed;
    final updatedFeed = currentFeed?.updateWith(feed) ?? feed;

    // Update the feed data in the state
    state = state.copyWith(feed: updatedFeed);
  }

  /// Handles updates to the feed state when a follow is added.
  void onFollowAdded(FollowData follow) {
    // Add the follow to the feed state
    state = state.addFollow(follow);
  }

  /// Handles updates to the feed state when a follow is removed.
  void onFollowRemoved(FollowData follow) {
    // Remove the follow from the feed state
    state = state.removeFollow(follow);
  }

  /// Handles updates to the feed state when a follow is updated.
  void onFollowUpdated(FollowData follow) {
    // Update the follow in the feed state
    state = state.updateFollow(follow);
  }

  /// Handles updates to the feed state when an unfollow action occurs.
  void onUnfollow({required FeedId sourceFid, required FeedId targetFid}) {
    // Remove the follow relationship between sourceFid and targetFid
    final updatedFollowing = state.following.whereNot((it) {
      var filter = it.sourceFeed.id == sourceFid.id;
      return filter &= it.targetFeed.id == targetFid.id;
    }).toList();

    state = state.copyWith(following: updatedFollowing);
  }

  /// Handles updates to the feed state when a follow request is removed.
  void onFollowRequestRemoved(String id) {
    // Remove the follow request with the given ID
    final updatedFollowRequests = state.followRequests.where((it) {
      return it.id != id;
    }).toList();

    state = state.copyWith(followRequests: updatedFollowRequests);
  }

  /// Handles updates to the feed state when a reaction is added.
  void onReactionAdded(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    // Add or update the reaction in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == reaction.activityId,
      update: (it) => it.upsertReaction(activity, reaction, currentUserId),
    );
  }

  /// Handles updates to the feed state when a reaction is updated.
  void onReactionUpdated(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    // Update the reaction in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == reaction.activityId,
      update: (it) {
        return it.upsertUniqueReaction(activity, reaction, currentUserId);
      },
    );
  }

  /// Handles updates to the feed state when a reaction is removed.
  void onReactionRemoved(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    // Remove the reaction from the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == reaction.activityId,
      update: (it) => it.removeReaction(activity, reaction, currentUserId),
    );
  }

  /// Handles when a poll is closed.
  void onPollClosed(String pollId) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == pollId,
      update: (it) => it.copyWith(poll: it.poll?.copyWith(isClosed: true)),
    );
  }

  /// Handles when a poll is deleted.
  void onPollDeleted(String pollId) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == pollId,
      update: (it) => it.copyWith(poll: null),
    );
  }

  /// Handles when a poll is updated.
  void onPollUpdated(PollData poll) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(poll: it.poll?.updateWith(poll)),
    );
  }

  /// Handles when a poll answer is casted.
  void onPollAnswerCasted(PollData poll, PollVoteData answer) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertAnswer(poll, answer, currentUserId),
      ),
    );
  }

  /// Handles when a poll vote is casted (with poll data).
  void onPollVoteCasted(PollData poll, PollVoteData vote) {
    return onPollVoteChanged(poll, vote);
  }

  /// Handles when a poll vote is changed.
  void onPollVoteChanged(PollData poll, PollVoteData vote) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertVote(poll, vote, currentUserId),
      ),
    );
  }

  /// Handles when a poll answer is removed (with poll data).
  void onPollAnswerRemoved(PollData poll, PollVoteData answer) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.removeAnswer(poll, answer, currentUserId),
      ),
    );
  }

  /// Handles when a poll vote is removed (with poll data).
  void onPollVoteRemoved(PollData poll, PollVoteData vote) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.removeVote(poll, vote, currentUserId),
      ),
    );
  }

  @override
  void dispose() {
    _removeMemberListListener?.call();
    super.dispose();
  }
}

/// Represents the current state of a feed.
///
/// Contains activities, feed metadata, followers, members, and pagination information.
/// Automatically updates when WebSocket events are received.
@freezed
class FeedState with _$FeedState {
  const FeedState({
    required this.fid,
    required this.feedQuery,
    this.activities = const [],
    this.aggregatedActivities = const [],
    this.feed,
    this.followers = const [],
    this.following = const [],
    this.followRequests = const [],
    this.members = const [],
    this.pinnedActivities = const [],
    this.notificationStatus,
    this.activitiesPagination,
  });

  /// The unique identifier for the feed.
  @override
  final FeedId fid;

  /// The query used to create the feed.
  @override
  final FeedQuery feedQuery;

  /// The list of activities in the feed, sorted by default sorting criteria.
  @override
  final List<ActivityData> activities;

  /// The list of aggregated activities in the feed.
  @override
  final List<AggregatedActivityData> aggregatedActivities;

  /// The feed data containing feed metadata and configuration.
  @override
  final FeedData? feed;

  /// The list of followers for this feed.
  @override
  final List<FollowData> followers;

  /// The list of feeds that this feed is following.
  @override
  final List<FollowData> following;

  /// The list of pending follow requests for this feed.
  @override
  final List<FollowData> followRequests;

  /// The list of members in this feed.
  @override
  final List<FeedMemberData> members;

  /// The list of pinned activities and its pinning state.
  @override
  final List<ActivityPinData> pinnedActivities;

  /// Returns information about the notification status (read / seen activities).
  @override
  final NotificationStatusResponse? notificationStatus;

  /// Pagination information for [activities] and [aggregatedActivities] queries.
  @override
  final PaginationData? activitiesPagination;

  /// Indicates whether there are more activities available to load.
  ///
  /// Returns true if there is a next page available for pagination.
  bool get canLoadMoreActivities => activitiesPagination?.next != null;
}

/// Extension providing helper methods for updating feed state.
///
/// This extension adds convenience methods for common feed state mutations including
/// follow management, activity marking (read, seen, watched), and activity filtering.
extension on FeedState {
  /// Adds a follow to this feed state.
  ///
  /// Updates the appropriate follow list (follow requests, following, or followers) based on
  /// the type of [follow]. Also updates the feed's follower or following count when applicable.
  ///
  /// Returns a new [FeedState] instance with the updated follow data.
  FeedState addFollow(FollowData follow) {
    if (follow.isFollowRequest) {
      final updatedFollowRequests = followRequests.upsert(
        follow,
        key: (it) => it.id,
      );

      return copyWith(followRequests: updatedFollowRequests);
    }

    if (follow.isFollowingFeed(fid)) {
      final updatedCount = follow.sourceFeed.followingCount;
      final updatedFollowing = following.upsert(
        follow,
        key: (it) => it.id,
      );

      return copyWith(
        following: updatedFollowing,
        feed: feed?.copyWith(followingCount: updatedCount),
      );
    }

    if (follow.isFollowerOf(fid)) {
      final updatedCount = follow.targetFeed.followerCount;
      final updatedFollowers = followers.upsert(
        follow,
        key: (it) => it.id,
      );

      return copyWith(
        followers: updatedFollowers,
        feed: feed?.copyWith(followerCount: updatedCount),
      );
    }

    // If the follow doesn't match any known categories,
    // we can simply return the current state without changes.
    return this;
  }

  /// Removes a follow from this feed state.
  ///
  /// Removes [follow] from all follow lists (following, followers, and follow requests) and
  /// updates the feed's follower or following count when applicable.
  ///
  /// Returns a new [FeedState] instance with the updated follow data.
  FeedState removeFollow(FollowData follow) {
    var feed = this.feed;

    if (follow.isFollowerOf(fid)) {
      final followerCount = follow.targetFeed.followerCount;
      feed = feed?.copyWith(followerCount: followerCount);
    }
    if (follow.isFollowingFeed(fid)) {
      final followingCount = follow.sourceFeed.followingCount;
      feed = feed?.copyWith(followingCount: followingCount);
    }

    final updatedFollowing = following.where((it) {
      return it.id != follow.id;
    }).toList();

    final updatedFollowers = followers.where((it) {
      return it.id != follow.id;
    }).toList();

    final updatedFollowRequests = followRequests.where((it) {
      return it.id != follow.id;
    }).toList();

    return copyWith(
      feed: feed,
      following: updatedFollowing,
      followers: updatedFollowers,
      followRequests: updatedFollowRequests,
    );
  }

  /// Updates a follow in this feed state.
  ///
  /// Removes the existing [follow] and then adds it again, effectively updating the follow
  /// data with the latest information.
  ///
  /// Returns a new [FeedState] instance with the updated follow data.
  FeedState updateFollow(FollowData follow) {
    final removedFollowState = removeFollow(follow);
    return removedFollowState.addFollow(follow);
  }

  /// Marks all activities in this feed state as read.
  ///
  /// Sets the unread count to 0 and marks all aggregated activity groups as read.
  /// Updates the last read timestamp to the current time.
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markAllRead() {
    final aggregatedActivities = [...this.aggregatedActivities];
    final readActivities = aggregatedActivities.map((it) => it.group).toList();

    // Set unread count to 0 and update read activities
    final updatedNotificationStatus = notificationStatus?.copyWith(
      unread: 0,
      readActivities: readActivities,
      lastReadAt: DateTime.timestamp(),
    );

    return copyWith(notificationStatus: updatedNotificationStatus);
  }

  /// Marks all activities in this feed state as seen.
  ///
  /// Sets the unseen count to 0 and marks all aggregated activity groups as seen.
  /// Updates the last seen timestamp to the current time.
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markAllSeen() {
    final aggregatedActivities = [...this.aggregatedActivities];
    final seenActivities = aggregatedActivities.map((it) => it.group).toList();

    // Set unseen count to 0 and update seen activities
    final updatedNotificationStatus = notificationStatus?.copyWith(
      unseen: 0,
      seenActivities: seenActivities,
      lastSeenAt: DateTime.timestamp(),
    );

    return copyWith(notificationStatus: updatedNotificationStatus);
  }

  /// Marks specific activities as read in this feed state.
  ///
  /// Adds the activity IDs in [readIds] to the read activities set and decreases the unread
  /// count by the number of newly read activities. Updates the last read timestamp to the
  /// current time.
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markRead(Set<String> readIds) {
    final readActivities = notificationStatus?.readActivities?.toSet();
    final updatedReadActivities = readActivities?.union(readIds).toList();

    // Decrease unread count by the number of newly read activities
    final unreadCount = notificationStatus?.unread ?? 0;
    final updatedUnreadCount = max(unreadCount - readIds.length, 0);

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unread: updatedUnreadCount,
      readActivities: updatedReadActivities,
      lastReadAt: DateTime.timestamp(),
    );

    return copyWith(notificationStatus: updatedNotificationStatus);
  }

  /// Marks specific activities as seen in this feed state.
  ///
  /// Adds the activity IDs in [seenIds] to the seen activities set and decreases the unseen
  /// count by the number of newly seen activities. Updates the last seen timestamp to the
  /// current time.
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markSeen(Set<String> seenIds) {
    final seenActivities = notificationStatus?.seenActivities?.toSet();
    final updatedSeenActivities = seenActivities?.union(seenIds).toList();

    // Decrease unseen count by the number of newly seen activities
    final unseenCount = notificationStatus?.unseen ?? 0;
    final updatedUnseenCount = max(unseenCount - seenIds.length, 0);

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unseen: updatedUnseenCount,
      seenActivities: updatedSeenActivities,
      lastSeenAt: DateTime.timestamp(),
    );

    return copyWith(notificationStatus: updatedNotificationStatus);
  }

  /// Marks specific activities as watched in this feed state.
  ///
  /// Updates activities with IDs in [watchedIds] to set their watched status to true.
  /// Updates both the main activities list and aggregated activities.
  ///
  /// Returns a new [FeedState] instance with the updated activities.
  FeedState markWatched(Set<String> watchedIds) {
    return updateActivitiesWhere(
      (it) => watchedIds.contains(it.id),
      update: (it) => it.copyWith(isWatched: true),
      updateAggregatedActivities: true,
    );
  }

  /// Updates activities in this feed state that match the provided filter.
  ///
  /// Applies [update] to all activities where [filter] returns true. Updates both the main
  /// activities list and pinned activities. When [compare] is provided, maintains the
  /// sort order after updates.
  ///
  /// Returns a new [FeedState] instance with the updated activities.
  FeedState updateActivitiesWhere(
    bool Function(ActivityData) filter, {
    required ActivityData Function(ActivityData) update,
    bool updateAggregatedActivities = false,
    Comparator<ActivityData>? compare,
  }) {
    final updatedActivities = activities.updateWhere(
      filter,
      update: update,
      compare: compare,
    );

    final updatedPinnedActivities = pinnedActivities.updateWhere(
      (it) => filter(it.activity),
      update: (it) => it.copyWith(activity: update(it.activity)),
    );

    var updatedAggregatedActivities = aggregatedActivities;
    if (updateAggregatedActivities) {
      updatedAggregatedActivities = updatedAggregatedActivities.map((it) {
        final updated = it.activities.updateWhere(filter, update: update);
        return it.copyWith(activities: updated);
      }).toList();
    }

    return copyWith(
      activities: updatedActivities,
      pinnedActivities: updatedPinnedActivities,
      aggregatedActivities: updatedAggregatedActivities,
    );
  }

  /// Removes activities from this feed state that match the provided filter.
  ///
  /// Removes all activities where [filter] returns true from both the main activities list
  /// and pinned activities.
  ///
  /// Returns a new [FeedState] instance with the filtered activities.
  FeedState removeActivitiesWhere(
    bool Function(ActivityData) filter, {
    bool removeFromAggregatedActivities = false,
  }) {
    final updatedActivities = activities.whereNot(filter).toList();
    final updatedPinnedActivities = pinnedActivities.whereNot((it) {
      return filter(it.activity);
    }).toList();

    var updatedAggregatedActivities = aggregatedActivities;
    if (removeFromAggregatedActivities) {
      updatedAggregatedActivities = updatedAggregatedActivities.map((it) {
        final updated = it.activities.whereNot(filter).toList();
        return it.copyWith(activities: updated);
      }).toList();
    }

    return copyWith(
      activities: updatedActivities,
      pinnedActivities: updatedPinnedActivities,
      aggregatedActivities: updatedAggregatedActivities,
    );
  }
}

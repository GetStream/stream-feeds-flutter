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
import '../models/model_updates.dart';
import '../models/pagination_data.dart';
import '../models/poll_data.dart';
import '../models/poll_vote_data.dart';
import '../models/query_configuration.dart';
import 'insertion_action.dart';
import 'member_list_state.dart';
import 'query/feed_query.dart';

part 'feed_state.freezed.dart';

/// Manages the state of a feed and handles state updates.
///
/// Provides methods to update the feed state in response to data changes,
/// user interactions, and real-time events from the Stream Feeds API.
class FeedStateNotifier extends StateNotifier<FeedState> {
  FeedStateNotifier({
    required this.currentUserId,
    required this.memberList,
    required FeedState initialState,
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
      state = state.copyWith(
        members: memberListState.members,
        membersPagination: memberListState.pagination,
      );
    });
  }

  /// Handles the result of a query for the feed.
  void onQueryFeed(GetOrCreateFeedData result) {
    state = state.copyWith(
      activities: result.activities,
      aggregatedActivities: result.aggregatedActivities,
      activitiesPagination: result.pagination,
      feed: result.feed,
      followers: result.followers,
      following: result.following,
      // Note: The members are not directly set here to avoid overwriting the
      // existing member list. Instead, we will synchronize the members
      // through the `memberList` state notifier.
      //
      // members: result.members.items,
      // membersPagination: result.members.pagination,
      followRequests: result.followRequests,
      pinnedActivities: result.pinnedActivities,
      notificationStatus: result.notificationStatus,
    );

    // Synchronize member list with the feed members
    memberList.onQueryMoreMembers(result.members, const QueryConfiguration());
  }

  /// Handles the result of a query for more activities.
  void onQueryMoreActivities(
    List<ActivityData> activities,
    List<AggregatedActivityData> aggregatedActivities,
    PaginationData pagination,
  ) {
    // Merge the new activities with the existing ones
    final updatedActivities = state.activities.merge(
      activities,
      key: (it) => it.id,
    );

    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities,
      key: (it) => it.group,
    );

    state = state
        .copyWith(
          activities: updatedActivities,
          aggregatedActivities: updatedAggregatedActivities,
          activitiesPagination: pagination,
        )
        // Re-derive isRead/isSeen for the newly-merged page against the current
        // notification status, in case a local mark happened before this page loaded.
        .reconcileReadSeen();
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
  ///
  /// [hasOwnFields] should be `true` when [activity] was fetched with `enrichOwnFields: true`,
  /// so its `own_*` fields are trusted over what's already in state. See
  /// [ActivityDataMutations.updateWith].
  void onActivityUpdated(ActivityData activity, {bool hasOwnFields = false}) {
    state = state.updateActivitiesWhere(
      (it) => it.id == activity.id,
      update: (it) => it.updateWith(activity, hasOwnFields: hasOwnFields),
    );
  }

  /// Handles updates to the feed state when activity is removed.
  void onActivityRemoved(String activityId) {
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

    state = state
        .copyWith(
          // The event may omit notification_status entirely; don't let that wipe
          // out what we already know.
          notificationStatus: notificationStatus ?? state.notificationStatus,
          aggregatedActivities: updatedAggregatedActivities,
        )
        // Re-derive isRead/isSeen from the (possibly refreshed) notification
        // status, so flags stay correct even when this update didn't originate
        // from this session's own markActivity() call (e.g. another device).
        .reconcileReadSeen();
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

  /// Handles updates to the feed state when a bookmark is added or updated.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by adding or updating
  /// the bookmark in its own bookmarks list. Only adds bookmarks that belong to
  /// the current user.
  void onBookmarkUpserted(BookmarkData bookmark) {
    state = state.updateActivitiesWhere(
      (it) => it.id == bookmark.activity.id,
      update: (it) => it.upsertBookmark(bookmark, currentUserId),
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
    );
  }

  /// Handles updates to the feed state when a comment is added or updated.
  void onCommentUpserted(CommentData comment) {
    // Add or update the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.upsertComment(comment),
    );
  }

  /// Handles updates to the feed state when a comment is removed.
  void onCommentRemoved(CommentData comment) {
    // Remove the comment from the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.removeComment(comment),
    );
  }

  /// Handles updates to the feed state when a comment reaction is added or updated.
  void onCommentReactionUpserted(
    CommentData comment,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    // Upsert the reaction on the comment in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == comment.objectId,
      update: (it) => it.upsertCommentReaction(
        comment,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
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
  ///
  /// [hasOwnFields] should be `true` when [feed] was fetched with `enrichOwnFields: true`, so
  /// its `own_*` fields are trusted over what's already in state. See
  /// [FeedDataMutations.updateWith].
  void onFeedUpdated(FeedData feed, {bool hasOwnFields = false}) {
    final currentFeed = state.feed;
    final updatedFeed = currentFeed?.updateWith(feed, hasOwnFields: hasOwnFields) ?? feed;

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

  void onFollowsUpdated(ModelUpdates<FollowData> updates) {
    final newFollowing = <FollowData>[];
    final newFollowers = <FollowData>[];
    final newFollowRequests = <FollowData>[];

    for (final it in updates.added) {
      if (it.isFollowerOf(state.fid)) {
        newFollowers.add(it);
      } else if (it.isFollowingFeed(state.fid)) {
        newFollowing.add(it);
      } else if (it.isFollowRequestFor(state.fid)) {
        newFollowRequests.add(it);
      }
    }

    final removedFollowRequests = {...updates.removedIds};
    // New accepted followings shouldn't count as follow requests anymore
    removedFollowRequests.addAll(newFollowers.map((it) => it.id));

    final updatedFollowing = updates.copyWith(added: newFollowing).applyTo(state.following, key: (it) => it.id);

    final updatedFollowers = updates.copyWith(added: newFollowers).applyTo(state.followers, key: (it) => it.id);

    final updatedFollowRequests = updates
        .copyWith(added: newFollowRequests, removedIds: removedFollowRequests)
        .applyTo(state.followRequests, key: (it) => it.id);

    state = state.copyWith(
      following: updatedFollowing,
      followers: updatedFollowers,
      followRequests: updatedFollowRequests,
    );
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

  /// Handles updates to the feed state when a reaction is added or updated.
  void onReactionUpserted(
    ActivityData activity,
    FeedsReactionData reaction, {
    bool enforceUnique = false,
  }) {
    // Upsert the reaction in the activity
    state = state.updateActivitiesWhere(
      (it) => it.id == reaction.activityId,
      update: (it) => it.upsertReaction(
        activity,
        reaction,
        currentUserId,
        enforceUnique: enforceUnique,
      ),
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

  /// Handles when a poll answer is added or updated.
  void onPollVoteUpserted(PollData poll, PollVoteData vote) {
    state = state.updateActivitiesWhere(
      (it) => it.poll?.id == poll.id,
      update: (it) => it.copyWith(
        poll: it.poll?.upsertVote(poll, vote, currentUserId),
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
    this.membersPagination,
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

  /// Pagination information for [members] queries.
  @override
  final PaginationData? membersPagination;

  /// The list of pinned activities and its pinning state.
  @override
  final List<ActivityPinData> pinnedActivities;

  /// Returns information about the notification status (read / seen activities).
  @override
  final NotificationStatusResponse? notificationStatus;

  /// Pagination information for [activities] and [aggregatedActivities] queries.
  @override
  final PaginationData? activitiesPagination;

  /// Indicates whether there are more members available to load.
  ///
  /// Returns true if there is a next page available for pagination.
  bool get canLoadMoreMembers => membersPagination?.next != null;

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
  /// Sets the unread count to 0, records every aggregated group as read, and updates the last
  /// read timestamp to the current time. Per-activity and per-group `isRead` flags are then
  /// re-derived by [reconcileReadSeen].
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markAllRead() {
    final readActivities = aggregatedActivities.map((it) => it.group).toList();

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unread: 0,
      readActivities: readActivities,
      lastReadAt: DateTime.timestamp(),
    );

    return copyWith(
      notificationStatus: updatedNotificationStatus,
    ).reconcileReadSeen();
  }

  /// Marks all activities in this feed state as seen.
  ///
  /// Sets the unseen count to 0, records every aggregated group as seen, and updates the last
  /// seen timestamp to the current time. Per-activity and per-group `isSeen` flags are then
  /// re-derived by [reconcileReadSeen].
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markAllSeen() {
    final seenActivities = aggregatedActivities.map((it) => it.group).toList();

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unseen: 0,
      seenActivities: seenActivities,
      lastSeenAt: DateTime.timestamp(),
    );

    return copyWith(
      notificationStatus: updatedNotificationStatus,
    ).reconcileReadSeen();
  }

  /// Marks specific activities as read in this feed state.
  ///
  /// Adds the activity/group IDs in [readIds] to the read activities set and decreases the
  /// unread count by the number of newly read activities. Note: unlike [markAllRead], the
  /// server only advances `lastReadAt` for "mark all" operations, so this leaves it untouched.
  /// Per-activity and per-group `isRead` flags are then re-derived by [reconcileReadSeen].
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markRead(Set<String> readIds) {
    final readActivities = notificationStatus?.readActivities?.toSet();
    final updatedReadActivities = readActivities?.union(readIds).toList();

    final unreadCount = notificationStatus?.unread ?? 0;
    final updatedUnreadCount = max(unreadCount - readIds.length, 0);

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unread: updatedUnreadCount,
      readActivities: updatedReadActivities,
    );

    return copyWith(
      notificationStatus: updatedNotificationStatus,
    ).reconcileReadSeen();
  }

  /// Marks specific activities as seen in this feed state.
  ///
  /// Adds the activity/group IDs in [seenIds] to the seen activities set and decreases the
  /// unseen count by the number of newly seen activities. Note: unlike [markAllSeen], the
  /// server only advances `lastSeenAt` for "mark all" operations, so this leaves it untouched.
  /// Per-activity and per-group `isSeen` flags are then re-derived by [reconcileReadSeen].
  ///
  /// Returns a new [FeedState] instance with the updated notification status.
  FeedState markSeen(Set<String> seenIds) {
    final seenActivities = notificationStatus?.seenActivities?.toSet();
    final updatedSeenActivities = seenActivities?.union(seenIds).toList();

    final unseenCount = notificationStatus?.unseen ?? 0;
    final updatedUnseenCount = max(unseenCount - seenIds.length, 0);

    final updatedNotificationStatus = notificationStatus?.copyWith(
      unseen: updatedUnseenCount,
      seenActivities: updatedSeenActivities,
    );

    return copyWith(
      notificationStatus: updatedNotificationStatus,
    ).reconcileReadSeen();
  }

  /// Re-derives per-activity and per-group `isRead`/`isSeen` flags from [notificationStatus].
  ///
  /// Mirrors how the server itself derives these flags: an item is read/seen if it was last
  /// updated before `lastReadAt`/`lastSeenAt`, or if its ID (flat feeds) or group name
  /// (aggregated feeds) is listed in `readActivities`/`seenActivities`. Nested activities within
  /// an aggregated group inherit their group's flags, since read/seen is only tracked at the
  /// group level for aggregation.
  ///
  /// Returns a new [FeedState] instance with up-to-date flags, or this instance unchanged if
  /// there's no notification status to derive them from.
  FeedState reconcileReadSeen() {
    final status = notificationStatus;
    if (status == null) return this;

    final lastReadAt = status.lastReadAt;
    final lastSeenAt = status.lastSeenAt;
    final readActivities = {...?status.readActivities};
    final seenActivities = {...?status.seenActivities};

    bool isRead(String key, DateTime updatedAt) {
      if (readActivities.contains(key)) return true;
      return lastReadAt != null && updatedAt.isBefore(lastReadAt);
    }

    bool isSeen(String key, DateTime updatedAt) {
      if (seenActivities.contains(key)) return true;
      return lastSeenAt != null && updatedAt.isBefore(lastSeenAt);
    }

    final updatedActivities = activities.map((a) {
      final read = isRead(a.id, a.updatedAt);
      final seen = isSeen(a.id, a.updatedAt);
      if (a.isRead == read && a.isSeen == seen) return a;
      return a.copyWith(isRead: read, isSeen: seen);
    }).toList();

    final updatedAggregated = aggregatedActivities.map((group) {
      final read = isRead(group.group, group.updatedAt);
      final seen = isSeen(group.group, group.updatedAt);

      var groupActivitiesChanged = false;
      final updatedGroupActivities = group.activities.map((a) {
        if (a.isRead == read && a.isSeen == seen) return a;
        groupActivitiesChanged = true;
        return a.copyWith(isRead: read, isSeen: seen);
      }).toList();

      if (group.isRead == read && group.isSeen == seen && !groupActivitiesChanged) {
        return group;
      }
      return group.copyWith(isRead: read, isSeen: seen, activities: updatedGroupActivities);
    }).toList();

    return copyWith(activities: updatedActivities, aggregatedActivities: updatedAggregated);
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

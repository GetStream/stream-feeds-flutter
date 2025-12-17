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

    state = state.copyWith(
      activities: updatedActivities,
      aggregatedActivities: updatedAggregatedActivities,
      activitiesPagination: pagination,
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
    final updatedActivities = state.activities.upsert(
      activity,
      key: (it) => it.id,
      update: (existing, updated) => existing.updateWith(updated),
    );

    final updatedPinnedActivities = state.pinnedActivities.map((pin) {
      if (pin.activity.id != activity.id) return pin;
      return pin.copyWith(activity: pin.activity.updateWith(activity));
    }).toList();

    state = state.copyWith(
      activities: updatedActivities,
      pinnedActivities: updatedPinnedActivities,
    );
  }

  /// Handles updates to the feed state when activity is removed.
  void onActivityRemoved(ActivityData activity) {
    return onActivityDeleted(activity.id);
  }

  /// Handles updates to the feed state when an activity is deleted.
  void onActivityDeleted(String activityId) {
    // Remove the activity from the activities list
    final updatedActivities = state.activities.where((it) {
      return it.id != activityId;
    }).toList();

    // Remove the activity from pinned activities if it exists
    final updatedPinnedActivities = state.pinnedActivities.where((pin) {
      return pin.activity.id != activityId;
    }).toList();

    state = state.copyWith(
      activities: updatedActivities,
      pinnedActivities: updatedPinnedActivities,
    );
  }

  /// Handles updates to the feed state when an activity is hidden.
  void onActivityHidden({
    required String activityId,
    required bool hidden,
  }) {
    // Update the activity to mark it as hidden
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != activityId) return activity;
      return activity.copyWith(hidden: hidden);
    }).toList();

    // Update pinned activities as well
    final updatedPinnedActivities = state.pinnedActivities.map((pin) {
      if (pin.activity.id != activityId) return pin;
      return pin.copyWith(activity: pin.activity.copyWith(hidden: hidden));
    }).toList();

    state = state.copyWith(
      activities: updatedActivities,
      pinnedActivities: updatedPinnedActivities,
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
      markAllRead: () => _markAllRead(state),
      // If markAllSeen is true, mark all activities as seen
      markAllSeen: () => _markAllSeen(state),
      // If markRead contains specific IDs, mark those as read
      markRead: (read) => _markRead(read, state),
      // If markSeen contains specific IDs, mark those as seen
      markSeen: (seen) => _markSeen(seen, state),
      // If markWatched contains specific IDs, mark those as watched
      markWatched: (watched) => _markWatched(watched, state),
      // For other cases, return the current state without changes
      orElse: (MarkActivityData data) => state,
    );
  }

  /// Handles updates to the feed state when the notification feed is updated.
  void onNotificationFeedUpdated(
    List<AggregatedActivityData>? aggregatedActivities,
    NotificationStatusResponse? notificationStatus,
  ) {
    // Update the aggregated activities and notification status in the state
    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities ?? [],
      key: (it) => it.group,
    );

    state = state.copyWith(
      aggregatedActivities: updatedAggregatedActivities,
      notificationStatus: notificationStatus,
    );
  }

  void onAggregatedActivitiesUpdated(
    List<AggregatedActivityData>? aggregatedActivities,
  ) {
    final updatedAggregatedActivities = state.aggregatedActivities.merge(
      aggregatedActivities ?? [],
      key: (it) => it.group,
    );
    state = state.copyWith(aggregatedActivities: updatedAggregatedActivities);
  }

  /// Handles updates to the feed state when a bookmark is added.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by adding or updating
  /// the bookmark in its own bookmarks list. Only adds bookmarks that belong to
  /// the current user.
  void onBookmarkAdded(BookmarkData bookmark) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != bookmark.activity.id) return activity;
      return activity.upsertBookmark(bookmark, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when a bookmark is removed.
  ///
  /// Updates the activity matching [bookmark]'s activity ID by removing
  /// the bookmark from its own bookmarks list. Only removes bookmarks that
  /// belong to the current user.
  void onBookmarkRemoved(BookmarkData bookmark) {
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != bookmark.activity.id) return activity;
      return activity.removeBookmark(bookmark, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when a comment is added or removed.
  void onCommentAdded(CommentData comment) {
    return onCommentUpdated(comment);
  }

  /// Handles updates to the feed state when a comment is updated.
  void onCommentUpdated(CommentData comment) {
    // Add or update the comment in the activity
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != comment.objectId) return activity;
      return activity.upsertComment(comment);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when a comment is removed.
  void onCommentRemoved(CommentData comment) {
    // Remove the comment from the activity
    final updatedActivities = state.activities.map((activity) {
      if (activity.id != comment.objectId) return activity;
      return activity.removeComment(comment);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
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
    state = _addFollow(follow, state);
  }

  /// Handles updates to the feed state when a follow is removed.
  void onFollowRemoved(FollowData follow) {
    // Remove the follow from the feed state
    state = _removeFollow(follow, state);
  }

  /// Handles updates to the feed state when a follow is updated.
  void onFollowUpdated(FollowData follow) {
    // Update the follow in the feed state
    state = _updateFollow(follow, state);
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
    final updatedActivities = state.activities.map((it) {
      if (it.id != reaction.activityId) return it;
      return it.upsertReaction(activity, reaction, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when a reaction is updated.
  void onReactionUpdated(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    // Update the reaction in the activity
    final updatedActivities = state.activities.map((it) {
      if (it.id != reaction.activityId) return it;
      return it.upsertUniqueReaction(activity, reaction, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  /// Handles updates to the feed state when a reaction is removed.
  void onReactionRemoved(
    ActivityData activity,
    FeedsReactionData reaction,
  ) {
    // Remove the reaction from the activity
    final updatedActivities = state.activities.map((it) {
      if (it.id != reaction.activityId) return it;
      return it.removeReaction(activity, reaction, currentUserId);
    }).toList();

    state = state.copyWith(activities: updatedActivities);
  }

  FeedState _addFollow(FollowData follow, FeedState state) {
    if (follow.isFollowRequest) {
      final updatedFollowRequests = state.followRequests.upsert(
        follow,
        key: (it) => it.id,
      );

      return state.copyWith(followRequests: updatedFollowRequests);
    }

    if (follow.isFollowingFeed(state.fid)) {
      final updatedCount = follow.sourceFeed.followingCount;
      final updatedFollowing = state.following.upsert(
        follow,
        key: (it) => it.id,
      );

      return state.copyWith(
        following: updatedFollowing,
        feed: state.feed?.copyWith(followingCount: updatedCount),
      );
    }

    if (follow.isFollowerOf(state.fid)) {
      final updatedCount = follow.targetFeed.followerCount;
      final updatedFollowers = state.followers.upsert(
        follow,
        key: (it) => it.id,
      );

      return state.copyWith(
        followers: updatedFollowers,
        feed: state.feed?.copyWith(followerCount: updatedCount),
      );
    }

    // If the follow doesn't match any known categories,
    // we can simply return the current state without changes.
    return state;
  }

  FeedState _removeFollow(FollowData follow, FeedState state) {
    var feed = state.feed;

    if (follow.isFollowerOf(state.fid)) {
      final followerCount = follow.targetFeed.followerCount;
      feed = feed?.copyWith(followerCount: followerCount);
    }
    if (follow.isFollowingFeed(state.fid)) {
      final followingCount = follow.sourceFeed.followingCount;
      feed = feed?.copyWith(followingCount: followingCount);
    }

    final updatedFollowing = state.following.where((it) {
      return it.id != follow.id;
    }).toList();

    final updatedFollowers = state.followers.where((it) {
      return it.id != follow.id;
    }).toList();

    final updatedFollowRequests = state.followRequests.where((it) {
      return it.id != follow.id;
    }).toList();

    return state.copyWith(
      feed: feed,
      following: updatedFollowing,
      followers: updatedFollowers,
      followRequests: updatedFollowRequests,
    );
  }

  FeedState _updateFollow(FollowData follow, FeedState state) {
    final removedFollowState = _removeFollow(follow, state);
    return _addFollow(follow, removedFollowState);
  }

  FeedState _markAllRead(FeedState state) {
    final aggregatedActivities = state.aggregatedActivities;
    final readActivities = aggregatedActivities.map((it) => it.group).toList();

    // Set unread count to 0 and update read activities
    final updatedNotificationStatus = state.notificationStatus?.copyWith(
      unread: 0,
      readActivities: readActivities,
      lastReadAt: DateTime.timestamp(),
    );

    return state.copyWith(notificationStatus: updatedNotificationStatus);
  }

  FeedState _markAllSeen(FeedState state) {
    final aggregatedActivities = state.aggregatedActivities;
    final seenActivities = aggregatedActivities.map((it) => it.group).toList();

    // Set unseen count to 0 and update seen activities
    final updatedNotificationStatus = state.notificationStatus?.copyWith(
      unseen: 0,
      seenActivities: seenActivities,
      lastSeenAt: DateTime.timestamp(),
    );

    return state.copyWith(notificationStatus: updatedNotificationStatus);
  }

  FeedState _markRead(Set<String> readIds, FeedState state) {
    final readActivities = state.notificationStatus?.readActivities?.toSet();
    final updatedReadActivities = readActivities?.union(readIds).toList();

    // Decrease unread count by the number of newly read activities
    final unreadCount = state.notificationStatus?.unread ?? 0;
    final updatedUnreadCount = max(unreadCount - readIds.length, 0);

    final updatedNotificationStatus = state.notificationStatus?.copyWith(
      unread: updatedUnreadCount,
      readActivities: updatedReadActivities,
      lastReadAt: DateTime.timestamp(),
    );

    return state.copyWith(notificationStatus: updatedNotificationStatus);
  }

  FeedState _markSeen(Set<String> seenIds, FeedState state) {
    final seenActivities = state.notificationStatus?.seenActivities?.toSet();
    final updatedSeenActivities = seenActivities?.union(seenIds).toList();

    // Decrease unseen count by the number of newly seen activities
    final unseenCount = state.notificationStatus?.unseen ?? 0;
    final updatedUnseenCount = max(unseenCount - seenIds.length, 0);

    final updatedNotificationStatus = state.notificationStatus?.copyWith(
      unseen: updatedUnseenCount,
      seenActivities: updatedSeenActivities,
      lastSeenAt: DateTime.timestamp(),
    );

    return state.copyWith(notificationStatus: updatedNotificationStatus);
  }

  FeedState _markWatched(Set<String> watchedIds, FeedState state) {
    final activities = _markWatchedActivities(watchedIds, state.activities);

    final aggregatedActivities =
        state.aggregatedActivities.map((aggregatedActivity) {
      return aggregatedActivity.copyWith(
        activities: _markWatchedActivities(
          watchedIds,
          aggregatedActivity.activities,
        ),
      );
    }).toList();

    return state.copyWith(
      activities: activities,
      aggregatedActivities: aggregatedActivities,
    );
  }

  List<ActivityData> _markWatchedActivities(
    Set<String> watchedIds,
    List<ActivityData> activities,
  ) {
    return activities.map((activity) {
      if (watchedIds.contains(activity.id)) {
        return activity.copyWith(isWatched: true);
      }
      return activity;
    }).toList();
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

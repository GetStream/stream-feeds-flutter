import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/activity_data.dart';
import '../models/bookmark_data.dart';
import '../models/comment_data.dart';
import '../models/feed_data.dart';
import '../models/feed_id.dart';
import '../models/feed_member_data.dart';
import '../models/feed_suggestion_data.dart';
import '../models/feeds_reaction_data.dart';
import '../models/follow_data.dart';
import '../models/model_updates.dart';
import '../models/request/activity_add_comment_request.dart';
import '../models/request/feed_add_activity_request.dart';
import '../repository/activities_repository.dart';
import '../repository/bookmarks_repository.dart';
import '../repository/capabilities_repository.dart';
import '../repository/comments_repository.dart';
import '../repository/feeds_repository.dart';
import '../repository/polls_repository.dart';
import 'event/fid_scope.dart';
import 'event/handler/feed_event_handler.dart';
import 'event/on_activity_added.dart';
import 'event/state_update_event.dart';
import 'feed_state.dart';
import 'member_list.dart';
import 'query/feed_query.dart';
import 'query/members_query.dart';
import 'state_notifier_extension.dart';

/// A feed represents a collection of activities and provides methods to interact with them.
///
/// The primary interface for working with feeds in the Stream Feeds SDK that provides
/// functionality for creating and managing feed data, handling activities, comments,
/// reactions, bookmarks, follows, memberships, and polls with pagination support.
///
/// Each feed instance is associated with a specific feed ID and maintains its own state
/// that can be observed for real-time updates. The feed state includes activities,
/// followers, members, and other feed-related data.
class Feed with Disposable {
  @internal
  Feed({
    required this.query,
    required this.currentUserId,
    required this.onNewActivity,
    required this.activitiesRepository,
    required this.bookmarksRepository,
    required this.commentsRepository,
    required this.feedsRepository,
    required this.pollsRepository,
    required this.capabilitiesRepository,
    required MutableSharedEmitter<StateUpdateEvent> eventsEmitter,
    required Stream<void> onReconnectEmitter,
  }) : _eventsEmitter = eventsEmitter {
    final fid = query.fid;

    _memberList = MemberList(
      query: MembersQuery(fid: fid),
      feedsRepository: feedsRepository,
      eventsEmitter: _eventsEmitter,
    );

    _stateNotifier = FeedStateNotifier(
      currentUserId: currentUserId,
      memberList: _memberList.stateNotifier,
      initialState: FeedState(fid: fid, feedQuery: query),
    );

    // Attach event handlers for the feed events
    final handler = FeedEventHandler(
      query: query,
      state: _stateNotifier,
      currentUserId: currentUserId,
      onNewActivity: onNewActivity,
      capabilitiesRepository: capabilitiesRepository,
    );

    _feedSubscriptions.add(_eventsEmitter.listen(handler.handleEvent));

    // Automatically refetch data on reconnection
    if (query.watch) {
      _subscribeToReconnectionUpdates(onReconnectEmitter: onReconnectEmitter);
    }
  }

  FeedId get fid => query.fid;
  final FeedQuery query;
  final String currentUserId;

  final OnNewActivity onNewActivity;
  final ActivitiesRepository activitiesRepository;
  final BookmarksRepository bookmarksRepository;
  final CommentsRepository commentsRepository;
  final FeedsRepository feedsRepository;
  final PollsRepository pollsRepository;
  final CapabilitiesRepository capabilitiesRepository;

  late final MemberList _memberList;

  FeedState get state => _stateNotifier.value;
  StateNotifier<FeedState> get notifier => _stateNotifier;
  Stream<FeedState> get stream => _stateNotifier.stream;
  late final FeedStateNotifier _stateNotifier;

  final MutableSharedEmitter<StateUpdateEvent> _eventsEmitter;
  final CompositeSubscription _feedSubscriptions = CompositeSubscription();

  @override
  void dispose() {
    _feedSubscriptions.cancel();
    _stateNotifier.dispose();
    _memberList.dispose();
    super.dispose();
  }

  /// Fetches or creates the feed based on the current feed query.
  ///
  /// Returns a [Result] containing the [FeedData] or an error.
  Future<Result<FeedData>> getOrCreate() async {
    final result = await feedsRepository.getOrCreateFeed(query);
    result.onSuccess((feedData) {
      _stateNotifier.onQueryFeed(feedData);

      capabilitiesRepository.cacheCapabilitiesForFeeds([
        feedData.feed,
        ...feedData.activities.map((activity) => activity.currentFeed).nonNulls,
      ]);
    });

    return result.map((feedData) => feedData.feed);
  }

  /// Stops watching the feed.
  ///
  /// Returns a [Result] indicating success or failure of the stop operation.
  Future<Result<void>> stopWatching() {
    return feedsRepository.stopWatching(query.fid);
  }

  /// Updates the feed with the provided request data.
  ///
  /// Returns a [Result] containing the updated [FeedData] or an error.
  Future<Result<FeedData>> updateFeed({
    required api.UpdateFeedRequest request,
  }) async {
    final result = await feedsRepository.updateFeed(
      feedId: query.fid,
      request: request,
    );

    result.onSuccess(
      (feedData) => _eventsEmitter.tryEmit(FeedUpdated(feed: feedData)),
    );

    return result;
  }

  /// Deletes the feed.
  ///
  /// [hardDelete] If `true`, the feed will be permanently deleted. If `false`, it will be
  /// soft deleted. (default is `false`).
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteFeed({bool hardDelete = false}) async {
    final fid = query.fid;
    final result = await feedsRepository.deleteFeed(
      fid,
      hardDelete: hardDelete,
    );

    result.onSuccess(
      (feedData) => _eventsEmitter.tryEmit(FeedDeleted(fid: fid.rawValue)),
    );

    return result;
  }

  // region Activity Methods

  /// Adds a new activity to the feed.
  ///
  /// The [request] contains the activity data to add.
  ///
  /// Returns a [Result] containing the added [ActivityData] if successful, or an error if the
  /// operation fails.
  Future<Result<ActivityData>> addActivity({
    required FeedAddActivityRequest request,
  }) async {
    final result = await activitiesRepository.addActivity(request);

    result.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityAdded(scope: FidScope.unknown, activity: activity),
      ),
    );

    return result;
  }

  /// Updates an existing activity in the feed.
  ///
  /// The [id] is the unique identifier of the activity to update.
  /// The [request] contains the updated activity data.
  /// Returns a [Result] containing the updated [ActivityData] if successful, or an error if the
  /// operation fails.
  Future<Result<ActivityData>> updateActivity({
    required String id,
    required api.UpdateActivityRequest request,
  }) async {
    final result = await activitiesRepository.updateActivity(
      id,
      request,
    );

    result.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityUpdated(scope: FidScope.unknown, activity: activity),
      ),
    );

    return result;
  }

  /// Deletes an activity from the feed.
  ///
  /// The [id] is the unique identifier of the activity to delete.
  /// If [hardDelete] is `true`, the activity will be permanently deleted. If `false`, it will be
  /// soft deleted. (default is `false`)
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteActivity({
    required String id,
    bool hardDelete = false,
  }) async {
    final result = await activitiesRepository.deleteActivity(
      id,
      hardDelete: hardDelete,
    );

    result.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityDeleted(scope: FidScope.unknown, activityId: id),
      ),
    );

    return result;
  }

  /// Submits feedback for an activity.
  ///
  /// Submits feedback for the activity with the specified [activityId] using
  /// the provided [activityFeedbackRequest].
  ///
  /// Returns a [Result] indicating success or failure of the operation.
  Future<Result<void>> activityFeedback({
    required String activityId,
    required api.ActivityFeedbackRequest activityFeedbackRequest,
  }) async {
    final result = await activitiesRepository.activityFeedback(
      activityId,
      activityFeedbackRequest,
    );

    result.onSuccess(
      (_) => activityFeedbackRequest.hide?.let(
        (hidden) => _eventsEmitter.tryEmit(
          ActivityHidden(
            activityId: activityId,
            userId: currentUserId,
            hidden: hidden,
          ),
        ),
      ),
    );

    return result;
  }

  /// Marks an activity as read or unread.
  ///
  /// [request] The request containing the mark activity data.
  /// Returns a [Result] indicating success or failure of the operation.
  Future<Result<void>> markActivity({
    required api.MarkActivityRequest request,
  }) {
    return activitiesRepository.markActivity(query.fid, request);
  }

  // endregion

  // region Bookmark Methods

  /// Adds an activity to the user's bookmarks.
  ///
  /// Creates a bookmark for the activity with [activityId]. When [request] is provided,
  /// can specify a folder ID or create a new folder for the bookmark.
  ///
  /// Returns a [Result] containing the created [BookmarkData] or an error.
  Future<Result<BookmarkData>> addBookmark({
    required String activityId,
    api.AddBookmarkRequest request = const api.AddBookmarkRequest(),
  }) async {
    final result = await bookmarksRepository.addBookmark(activityId, request);

    result.onSuccess(
      (bookmark) => _eventsEmitter.tryEmit(BookmarkAdded(bookmark: bookmark)),
    );

    return result;
  }

  /// Updates an existing bookmark for an activity.
  ///
  /// Modifies the bookmark for the activity with [activityId] using the provided [request].
  /// Can change the folder, update custom data, or move the bookmark to a new folder.
  ///
  /// Example:
  /// ```dart
  /// // Move a bookmark to a different folder
  /// final updateRequest = UpdateBookmarkRequest(folderId: 'new-folder-id');
  /// final updatedBookmark = feed.updateBookmark('activity-123', updateRequest);
  ///
  /// // Update bookmark with custom data
  /// final customUpdateRequest = UpdateBookmarkRequest(
  ///   folderId: 'favorites',
  ///   custom: {'note': 'Important article'},
  /// );
  /// final bookmark = feed.updateBookmark('activity-456', customUpdateRequest);
  /// ```
  ///
  /// Returns a [Result] containing the updated [BookmarkData] or an error.
  Future<Result<BookmarkData>> updateBookmark({
    required String activityId,
    required api.UpdateBookmarkRequest request,
  }) async {
    final result = await bookmarksRepository.updateBookmark(
      activityId,
      request,
    );

    result.onSuccess(
      (bookmark) => _eventsEmitter.tryEmit(BookmarkUpdated(bookmark: bookmark)),
    );

    return result;
  }

  /// Removes an activity from the user's bookmarks.
  ///
  /// Deletes the bookmark for the activity with [activityId]. When [folderId] is provided,
  /// removes the bookmark from that specific folder only.
  ///
  /// Returns a [Result] containing the deleted [BookmarkData] or an error.
  Future<Result<BookmarkData>> deleteBookmark({
    required String activityId,
    String? folderId,
  }) async {
    final result = await bookmarksRepository.deleteBookmark(
      activityId: activityId,
      folderId: folderId,
    );

    result.onSuccess(
      (bookmark) => _eventsEmitter.tryEmit(BookmarkDeleted(bookmark: bookmark)),
    );

    return result;
  }

  // endregion

  // region Comment Methods

  /// Gets a specific comment by its identifier.
  ///
  /// The [commentId] is the unique identifier of the comment to retrieve.
  /// Returns a [Result] containing the [CommentData] if successful, or an error if the operation
  /// fails.
  Future<Result<CommentData>> getComment({required String commentId}) async {
    final result = await commentsRepository.getComment(commentId);

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentUpdated(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Adds a new comment to activity with id.
  ///
  /// The [request] contains the comment data to add.
  /// Returns a [Result] containing the added [CommentData] if successful, or an error if the
  /// operation fails.
  Future<Result<CommentData>> addComment({
    required ActivityAddCommentRequest request,
  }) async {
    final result = await commentsRepository.addComment(request);

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentAdded(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Updates an existing comment with the provided request data.
  ///
  /// This method allows you to modify the content and properties of an existing comment.
  /// You can update the comment text, attachments, or other comment-specific data.
  ///
  /// The [commentId] is the unique identifier of the comment to update.
  /// The [request] contains the updated comment data.
  /// Returns a [Result] containing the updated [CommentData] if successful, or an error if the
  /// operation fails.
  Future<Result<CommentData>> updateComment({
    required String commentId,
    required api.UpdateCommentRequest request,
  }) async {
    final result = await commentsRepository.updateComment(commentId, request);

    result.onSuccess(
      (comment) => _eventsEmitter.tryEmit(
        CommentUpdated(scope: FidScope.unknown, comment: comment),
      ),
    );

    return result;
  }

  /// Removes a comment for id.
  ///
  /// The [commentId] is the unique identifier of the comment to remove.
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteComment({required String commentId}) async {
    final result = await commentsRepository.deleteComment(commentId);

    result.onSuccess(
      (pair) {
        _eventsEmitter.tryEmit(
          CommentDeleted(scope: FidScope.unknown, comment: pair.comment),
        );

        _eventsEmitter.tryEmit(
          ActivityUpdated(scope: FidScope.unknown, activity: pair.activity),
        );
      },
    );

    return result;
  }

  // endregion

  // region Member Methods

  /// Fetches the initial list of members based on the current query configuration.
  ///
  /// This method loads the first page of members according to the query's filters, sorting, and
  /// limit parameters. The results are stored in the state and can be accessed through the
  /// [notifier] property.
  ///
  /// Returns a [Result] containing a list of [FeedMemberData] if successful, or an error if the
  /// operation fails.
  Future<Result<List<FeedMemberData>>> queryFeedMembers() => _memberList.get();

  /// Loads the next page of members if more are available.
  ///
  /// This method fetches additional members using the pagination information from the previous
  /// request. If no more members are available, an empty list is returned.
  ///
  /// [limit] Optional limit for the number of members to fetch. If not specified, uses the
  /// limit from the original query.
  /// Returns a [Result] containing a list of additional [FeedMemberData] if successful, or an
  /// error if the operation fails. Returns an empty array if no more members are available.
  Future<Result<List<FeedMemberData>>> queryMoreFeedMembers({int? limit}) {
    return _memberList.queryMoreMembers(limit: limit);
  }

  /// Updates feed members based on the provided request.
  ///
  /// The [request] contains the member changes to apply.
  /// Returns a [Result] containing the updated [ModelUpdates<FeedMemberData>] if successful, or an
  /// error if the operation fails.
  Future<Result<ModelUpdates<FeedMemberData>>> updateFeedMembers({
    required api.UpdateFeedMembersRequest request,
  }) async {
    final result = await feedsRepository.updateFeedMembers(query.fid, request);

    result.onSuccess(
      (updates) => _eventsEmitter.tryEmit(
        FeedMemberBatchUpdate(fid: query.fid.rawValue, updates: updates),
      ),
    );

    return result;
  }

  /// Accepts a feed member invitation.
  ///
  /// Returns a [Result] containing the accepted [FeedMemberData] if successful, or an error if the
  /// operation fails.
  Future<Result<FeedMemberData>> acceptFeedMember() async {
    final result = await feedsRepository.acceptFeedMember(query.fid);

    result.onSuccess(
      (member) => _eventsEmitter.tryEmit(
        FeedMemberUpdated(fid: query.fid.rawValue, member: member),
      ),
    );

    return result;
  }

  /// Rejects a feed member invitation.
  ///
  /// Returns a [Result] containing the rejected [FeedMemberData] if successful, or an error if the
  /// operation fails.
  Future<Result<FeedMemberData>> rejectFeedMember() async {
    final result = await feedsRepository.rejectFeedMember(query.fid);

    result.onSuccess(
      (member) => _eventsEmitter.tryEmit(
        FeedMemberUpdated(fid: query.fid.rawValue, member: member),
      ),
    );

    return result;
  }

  // endregion

  // region Additional Methods

  /// Creates a repost of an existing activity.
  ///
  /// [activityId] The unique identifier of the activity to repost.
  /// [text] Optional text to add to the repost.
  /// Returns a [Result] containing the reposted [ActivityData] if successful, or an error if the
  /// operation fails.
  Future<Result<ActivityData>> repost({
    required String activityId,
    String? text,
  }) {
    final request = FeedAddActivityRequest(
      type: 'post',
      text: text,
      feeds: [query.fid.rawValue],
      parentId: activityId,
    );

    return addActivity(request: request);
  }

  /// Loads more activities using the next page token from the previous query.
  ///
  /// [limit] Optional limit for the number of activities to load. If `null`,
  /// uses the default limit.
  /// Returns a [Result] containing a list of additional [ActivityData] if successful, or an error
  /// if the operation fails.
  Future<Result<List<ActivityData>>> queryMoreActivities({int? limit}) async {
    // Build the query with the current pagination state (with next page token)
    final next = _stateNotifier.value.activitiesPagination?.next;

    // Early return if no more activities available
    if (next == null) return const Result.success([]);

    // Create a new query with the next page token
    final nextQuery = query.copyWith(
      fid: query.fid,
      activityNext: next,
      activityLimit: limit ?? query.activityLimit,
    );

    final result = await feedsRepository.getOrCreateFeed(nextQuery);

    result.onSuccess(
      (feedData) {
        _stateNotifier.onQueryMoreActivities(
          feedData.activities,
          feedData.aggregatedActivities,
          feedData.pagination,
        );

        capabilitiesRepository.cacheCapabilitiesForFeeds([
          feedData.feed,
          ...feedData.activities
              .map((activity) => activity.currentFeed)
              .nonNulls,
        ]);
      },
    );

    return result.map((feedData) => feedData.activities);
  }

  /// Queries for feed suggestions that the current user might want to follow.
  ///
  /// [limit] Optional limit for the number of suggestions to return. If `null`, uses the
  /// default limit.
  /// Returns a [Result] containing a list of [FeedSuggestionData] representing
  /// the suggested feeds if successful, or an error if the operation fails.
  Future<Result<List<FeedSuggestionData>>> queryFollowSuggestions({
    int? limit,
  }) {
    return feedsRepository.queryFollowSuggestions(
      feedGroupId: query.fid.group,
      limit: limit,
    );
  }

  /// Follows another feed.
  ///
  /// [targetFid] The target feed identifier.
  /// [createNotificationActivity] Whether the action is added to the notification feed.
  /// [custom] Additional data for the request.
  /// [pushPreference] Push notification preferences for the follow request.
  Future<Result<FollowData>> follow({
    required FeedId targetFid,
    bool? createNotificationActivity,
    Map<String, Object>? custom,
    api.FollowRequestPushPreference? pushPreference,
  }) async {
    final request = api.FollowRequest(
      createNotificationActivity: createNotificationActivity,
      custom: custom,
      pushPreference: pushPreference,
      source: query.fid.rawValue,
      target: targetFid.rawValue,
    );

    final result = await feedsRepository.follow(request);

    result.onSuccess(
      (followData) => _eventsEmitter.tryEmit(FollowAdded(follow: followData)),
    );

    return result;
  }

  /// Unfollows another feed.
  ///
  /// [targetFid] The target feed identifier to unfollow.
  /// Returns a [Result] indicating success or failure of the unfollow operation.
  Future<Result<void>> unfollow({required FeedId targetFid}) async {
    final result = await feedsRepository.unfollow(
      source: query.fid,
      target: targetFid,
    );

    result.onSuccess(
      (followData) => _eventsEmitter.tryEmit(FollowDeleted(follow: followData)),
    );

    return result;
  }

  /// Accepts a follow request from another feed.
  ///
  /// [sourceFid] The feed identifier of the requested feed.
  /// [role] The role for the requesting feed.
  /// Returns a [Result] containing the accepted [FollowData] if successful, or an error if the
  /// operation fails.
  Future<Result<FollowData>> acceptFollow({
    required FeedId sourceFid,
    String? role,
  }) async {
    final request = api.AcceptFollowRequest(
      followerRole: role,
      source: sourceFid.rawValue,
      target: query.fid.rawValue,
    );

    final result = await feedsRepository.acceptFollow(request);

    result.onSuccess(
      (followData) => _eventsEmitter.tryEmit(FollowAdded(follow: followData)),
    );

    return result;
  }

  /// Rejects a follow request from another feed.
  ///
  /// [sourceFid] The feed identifier of the requested feed.
  /// Returns a [Result] containing the rejected [FollowData] if successful, or an error if the
  /// operation fails.
  Future<Result<FollowData>> rejectFollow({required FeedId sourceFid}) async {
    final request = api.RejectFollowRequest(
      source: sourceFid.rawValue,
      target: query.fid.rawValue,
    );

    final result = await feedsRepository.rejectFollow(request);

    result.onSuccess(
      (followData) => _eventsEmitter.tryEmit(FollowDeleted(follow: followData)),
    );

    return result;
  }

  // region Reaction Methods

  @Deprecated('Use addActivityReaction instead')
  Future<Result<FeedsReactionData>> addReaction({
    required String activityId,
    required api.AddReactionRequest request,
  }) {
    return addActivityReaction(activityId: activityId, request: request);
  }

  /// Adds a reaction to an activity.
  ///
  /// [activityId] The unique identifier of the activity to react to.
  /// [request] The request containing the reaction data.
  /// Returns a [Result] containing the added [FeedsReactionData] if successful, or an error if the
  /// operation fails.
  Future<Result<FeedsReactionData>> addActivityReaction({
    required String activityId,
    required api.AddReactionRequest request,
  }) async {
    final result = await activitiesRepository.addActivityReaction(
      activityId,
      request,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        ActivityReactionUpserted(
          scope: FidScope.unknown,
          activity: pair.activity,
          reaction: pair.reaction,
          enforceUnique: request.enforceUnique ?? false,
        ),
      ),
    );

    return result.map((response) => response.reaction);
  }

  @Deprecated('Use deleteActivityReaction instead')
  Future<Result<FeedsReactionData>> deleteReaction({
    required String activityId,
    required String type,
  }) {
    return deleteActivityReaction(activityId: activityId, type: type);
  }

  /// Deletes a reaction from an activity.
  ///
  /// [activityId] The unique identifier of the activity from which to delete the reaction.
  /// [type] The type of reaction to delete.
  /// Returns a [Result] containing the deleted [FeedsReactionData] if successful, or an error if
  /// the operation fails.
  Future<Result<FeedsReactionData>> deleteActivityReaction({
    required String activityId,
    required String type,
  }) async {
    final result = await activitiesRepository.deleteActivityReaction(
      activityId,
      type,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        ActivityReactionDeleted(
          scope: FidScope.unknown,
          activity: pair.activity,
          reaction: pair.reaction,
        ),
      ),
    );

    return result.map((response) => response.reaction);
  }

  /// Adds a reaction to a comment.
  ///
  /// [commentId] The unique identifier of the comment to react to.
  /// [request] The request containing the reaction data.
  /// Returns a [Result] containing the added [FeedsReactionData] if successful, or an error if the
  /// operation fails.
  Future<Result<FeedsReactionData>> addCommentReaction({
    required String commentId,
    required api.AddCommentReactionRequest request,
  }) async {
    final result = await commentsRepository.addCommentReaction(
      commentId,
      request,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        CommentReactionUpserted(
          scope: FidScope.unknown,
          comment: pair.comment,
          reaction: pair.reaction,
          enforceUnique: request.enforceUnique ?? false,
        ),
      ),
    );

    return result.map((response) => response.reaction);
  }

  /// Deletes a reaction from a comment.
  ///
  /// [commentId] The unique identifier of the comment from which to delete the reaction.
  /// [type] The type of reaction to delete.
  /// Returns a [Result] containing the deleted [FeedsReactionData] if successful, or an error if
  /// the operation fails.
  Future<Result<FeedsReactionData>> deleteCommentReaction({
    required String commentId,
    required String type,
  }) async {
    final result = await commentsRepository.deleteCommentReaction(
      commentId,
      type,
    );

    result.onSuccess(
      (pair) => _eventsEmitter.tryEmit(
        CommentReactionDeleted(
          scope: FidScope.unknown,
          comment: pair.comment,
          reaction: pair.reaction,
        ),
      ),
    );

    return result.map((response) => response.reaction);
  }

  // endregion

  // region Poll Methods

  /// Creates a new poll and adds it as an activity to the feed.
  ///
  /// [request] The request containing the poll data to create.
  /// [activityType] The type of activity to create for the poll.
  /// Returns a [Result] containing the created [ActivityData] with poll if successful, or an error
  /// if the operation fails.
  Future<Result<ActivityData>> createPoll({
    required api.CreatePollRequest request,
    required String activityType,
  }) async {
    final createPollResult = await pollsRepository.createPoll(request);

    final createActivityResult = await createPollResult.flatMapAsync((poll) {
      final request = FeedAddActivityRequest(
        feeds: [query.fid.rawValue],
        pollId: poll.id,
        type: activityType,
      );

      return activitiesRepository.addActivity(request);
    });

    createActivityResult.onSuccess(
      (activity) => _eventsEmitter.tryEmit(
        ActivityAdded(scope: FidScope.unknown, activity: activity),
      ),
    );

    return createActivityResult;
  }

  // endregion

  void _subscribeToReconnectionUpdates({
    required Stream<void> onReconnectEmitter,
  }) {
    _feedSubscriptions.add(
      onReconnectEmitter.listen((_) {
        getOrCreate();
      }),
    );
  }
}

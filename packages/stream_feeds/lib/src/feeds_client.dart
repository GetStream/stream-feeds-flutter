import 'package:meta/meta.dart';
import 'package:stream_core/stream_core.dart';

import 'client/feeds_client_impl.dart';
import 'client/moderation_client.dart';
import 'generated/api/api.dart' as api;
import 'models/activity_data.dart';
import 'models/app_data.dart';
import 'models/batch_follow_data.dart';
import 'models/feed_id.dart';
import 'models/feeds_config.dart';
import 'models/follow_data.dart';
import 'models/push_notifications_config.dart';
import 'state/activity.dart';
import 'state/activity_comment_list.dart';
import 'state/activity_list.dart';
import 'state/activity_reaction_list.dart';
import 'state/bookmark_folder_list.dart';
import 'state/bookmark_list.dart';
import 'state/comment_list.dart';
import 'state/comment_reaction_list.dart';
import 'state/comment_reply_list.dart';
import 'state/event/on_activity_added.dart';
import 'state/event/state_update_event.dart';
import 'state/feed.dart';
import 'state/feed_list.dart';
import 'state/follow_list.dart';
import 'state/member_list.dart';
import 'state/moderation_config_list.dart';
import 'state/poll_list.dart';
import 'state/poll_vote_list.dart';
import 'state/query/activities_query.dart';
import 'state/query/activity_comments_query.dart';
import 'state/query/activity_reactions_query.dart';
import 'state/query/bookmark_folders_query.dart';
import 'state/query/bookmarks_query.dart';
import 'state/query/comment_reactions_query.dart';
import 'state/query/comment_replies_query.dart';
import 'state/query/comments_query.dart';
import 'state/query/feed_query.dart';
import 'state/query/feeds_query.dart';
import 'state/query/follows_query.dart';
import 'state/query/members_query.dart';
import 'state/query/moderation_configs_query.dart';
import 'state/query/poll_votes_query.dart';
import 'state/query/polls_query.dart';

export 'client/moderation_client.dart';

/// {@template stream_feeds_client}
/// Stream Feeds client for building scalable newsfeeds and activity streams.
///
/// The main entry point for integrating Stream's Feeds API into your Dart/Flutter
/// application that provides comprehensive tools for building activity feeds, social
/// interactions, real-time updates, rich queries, state management, moderation,
/// and multi-platform support.
///
/// ## Getting Started
///
/// Initialize the client with your API key and user information:
///
/// ```dart
/// final client = StreamFeedsClient(
///   apiKey: 'your-api-key',
///   user: User(
///     id: 'user-123',
///     name: 'John Doe',
///     image: 'https://example.com/avatar.jpg',
///     custom: {'email': 'john@example.com'},
///   ),
///   tokenProvider: TokenProvider.static(UserToken('user-jwt-token-here')),
///   config: FeedsConfig(
///     // Optional configuration
///   ),
/// );
///
/// // Connect to start receiving real-time updates
/// await client.connect();
/// ```
///
/// ## Logging
///
/// Pass `logPriority` to see what the client is doing, and `logHandler` to say where those
/// records go. Left alone, the client writes nothing:
///
/// ```dart
/// final client = StreamFeedsClient(
///   apiKey: 'your-api-key',
///   user: user,
///   logPriority: StreamLogPriority.debug,
/// );
/// ```
///
/// Both settings are shared with every other Stream SDK in the process, so passing them decides
/// for those too. Every record this client writes is tagged `SF:`, which is what tells them apart
/// from another SDK's in the same log.
///
/// Some of those records carry the `Authorization` header, so weigh what reads them.
///
/// ### Different User Types
///
/// The [User] class supports different authentication types:
///
/// ```dart
/// // Regular user with full details
/// final regularUser = User(
///   id: 'user-123',
///   name: 'John Doe',
///   image: 'https://example.com/avatar.jpg',
///   custom: {'department': 'Engineering'},
/// );
///
/// // Guest user (temporary access)
/// final guestUser = User.guest('guest-456');
///
/// // Anonymous user (no authentication required)
/// final anonymousUser = User.anonymous();
/// ```
///
/// ## Token Management
///
/// The client uses a [TokenProvider] for flexible token management:
///
/// ```dart
/// // Static token (for development or long-lived tokens)
/// final staticProvider = TokenProvider.static(UserToken('your-jwt-token'));
///
/// // Dynamic token (for refreshable tokens or secure storage)
/// final dynamicProvider = TokenProvider.dynamic((userId) async {
///   // Fetch from secure storage, an endpoint of your own, etc.
///   final token = await secureStorage.read(key: 'token_for_\$userId');
///   if (token == null) {
///     throw Exception('No token available');
///   }
///   return UserToken(token);
/// });
/// ```
///
/// ## Features
///
/// - **Activity Feeds**: Create and manage activity streams with real-time updates
/// - **Social Interactions**: Comments, reactions, follows, and bookmarks
/// - **Type-safe Queries**: Advanced filtering, sorting, and pagination
/// - **Real-time Updates**: WebSocket-based live feed synchronization
/// - **Content Moderation**: Built-in moderation tools and configurations
/// - **Multi-platform**: Pure Dart implementation for all platforms
///
/// For more detailed documentation and examples, visit:
/// https://getstream.io/docs/feeds/
/// {@endtemplate}
abstract interface class StreamFeedsClient {
  /// Creates a new Stream Feeds client instance.
  ///
  /// The [apiKey] comes from your Stream dashboard. A [tokenProvider] is required for a
  /// regular user, and must be omitted for a guest or anonymous one, whose token the client
  /// obtains itself. See [FeedsConfig] for what [config] carries.
  ///
  /// Example:
  /// ```dart
  /// final user = User(
  ///   id: 'user-123',
  ///   name: 'John Doe',
  ///   image: 'https://example.com/avatar.jpg',
  ///   custom: {'email': 'john@example.com'},
  /// );
  ///
  /// final token = UserToken('jwt-token-here');
  ///
  /// final client = StreamFeedsClient(
  ///   apiKey: 'your-api-key-here',
  ///   user: user,
  ///   tokenProvider: TokenProvider.static(token),
  /// );
  /// ```
  factory StreamFeedsClient({
    required String apiKey,
    required User user,
    FeedsConfig config,
    TokenProvider? tokenProvider,
    RetryStrategy? retryStrategy,
    NetworkStateProvider? networkStateProvider,
    LifecycleStateProvider? lifecycleStateProvider,
    List<AutomaticReconnectionPolicy>? reconnectionPolicies,
    @visibleForTesting WebSocketProvider? wsProvider,
    @visibleForTesting api.DefaultApi? feedsRestApi,
  }) = StreamFeedsClientImpl;

  /// The user this client is authenticated as.
  ///
  /// A guest user is given its id by the server, so once connected this is the user the server
  /// returned rather than the one the client was created with.
  User get user;

  /// The event emitter for listening to client events.
  ///
  /// Listeners can subscribe to receive various feed-related events, wait for
  /// specific event types, and register handlers for certain event types.
  ///
  /// The emitter supports type filtering, allowing listeners to only receive
  /// events of a specific subtype of [WsEvent].
  EventEmitter get events;

  /// The connection state emitter for monitoring WebSocket connection status.
  ///
  /// Emits connection state changes including [Connected], [Connecting],
  /// [Disconnected], and [Disconnecting] states.
  ///
  /// Example:
  /// ```dart
  /// client.connectionState.listen((state) {
  ///   if (state is Connected) {
  ///     print('Connected to Stream');
  ///   } else if (state is Disconnected) {
  ///     print('Disconnected: ${state.source.closeReason}');
  ///   }
  /// });
  /// ```
  ConnectionStateEmitter get connectionState;

  /// The state update events emitter for testing purposes only.
  ///
  /// This emitter is exposed only for internal testing and should not be
  /// accessed in production code. Use the [events] emitter for WebSocket
  /// events instead.
  @visibleForTesting
  SharedEmitter<StateUpdateEvent> get stateUpdateEvents;

  /// Updates the system environment information used by the client.
  ///
  /// It allows you to set environment-specific information that will be
  /// included in API requests, such as the application name, platform details,
  /// and version information.
  ///
  /// Example:
  /// ```dart
  /// client.updateSystemEnvironment(
  ///   SystemEnvironment(
  ///     name: 'my_app',
  ///     version: '1.0.0',
  ///   ),
  /// );
  /// ```
  ///
  /// See [SystemEnvironment] for more information on the available fields.
  void updateSystemEnvironment(SystemEnvironment environment);

  /// Establishes a connection to the Stream service.
  ///
  /// Call this before anything else on the client.
  ///
  /// Throws a [ClientException] if the connection fails, or if one is already established or in
  /// progress, and a [StateError] once [dispose] has been called.
  ///
  /// Pass [connectWebSocket] as `false` for a client that only makes requests: no events arrive
  /// and watching is rejected. An anonymous user always connects this way, having no token for a
  /// socket.
  Future<void> connect({
    bool connectWebSocket = true,
  });

  /// Disconnects the current client.
  ///
  /// Closes the WebSocket connection and leaves the client ready to be used again.
  /// Subscriptions to [events], [stateUpdateEvents] and [connectionState] keep
  /// working, so they do not have to be set up again after reconnecting.
  ///
  /// Example:
  /// ```dart
  /// await client.disconnect();
  ///
  /// // The same client, and the same subscriptions, can be reconnected later.
  /// await client.connect();
  /// ```
  ///
  /// See [dispose] for when the client is no longer needed at all.
  Future<void> disconnect();

  /// Releases every resource held by the client.
  ///
  /// Unlike [disconnect], this cannot be undone: [connect] throws afterwards and
  /// [stateUpdateEvents] stops emitting. Call it once the client is no longer
  /// needed, such as when the user signs out. Calling it again does nothing.
  ///
  /// Example:
  /// ```dart
  /// await client.dispose();
  /// ```
  Future<void> dispose();

  /// Creates a feed instance from the provided [query].
  ///
  /// Creates a [Feed] object using a [FeedQuery] that can include additional
  /// configuration such as activity filters, limits, and feed data for creation.
  ///
  /// When [onNewActivity] is provided, it customizes how new activities received
  /// via real-time events are inserted into the feed. When null, uses the default
  /// behavior which adds activities created by the current user to the start of
  /// the feed if they match the feed's filter.
  ///
  /// Example:
  /// ```dart
  /// final feed = client.feedFromQuery(FeedQuery(
  ///   fid: FeedId(group: 'user', id: 'john'),
  ///   activityLimit: 25,
  ///   watch: true,
  ///   data: FeedInputData(name: "John's Feed"),
  /// ));
  ///
  /// final result = await feed.getOrCreate();
  /// ```
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feedFromQuery(
    FeedQuery query, {
    OnNewActivity onNewActivity,
  });

  /// Creates a feed list instance based on the provided [query].
  ///
  /// Creates a [FeedList] object that represents a collection of feeds matching the
  /// specified query. The feed list can be used to fetch multiple feeds, manage feed groups, and
  /// receive real-time updates for all feeds in the list.
  ///
  /// Example:
  /// ```dart
  /// final feedList = client.feedList(FeedsQuery(
  ///   filter: Filter.equal(FeedsFilterField.visibility, 'public'),
  ///   sort: [FeedsSort.desc(FeedsSortField.followerCount)],
  ///   limit: 25,
  /// ));
  ///
  /// final result = await feedList.get();
  /// ```
  ///
  /// Returns a [FeedList] instance that can be used to interact with the collection of feeds.
  FeedList feedList(FeedsQuery query);

  /// Creates a follow list instance based on the provided [query].
  ///
  /// Creates a [FollowList] object that represents a collection of follow
  /// relationships matching the specified query. The follow list can be used to fetch followers,
  /// following relationships, and manage follow data with pagination support.
  ///
  /// Example:
  /// ```dart
  /// final followList = client.followList(FollowsQuery(
  ///   fid: FeedId(group: 'user', id: 'john'),
  ///   limit: 100,
  /// ));
  ///
  /// final result = await followList.get();
  /// ```
  ///
  /// Returns a [FollowList] instance that can be used to interact with the collection of follow
  /// relationships.
  FollowList followList(FollowsQuery query);

  /// Creates an activity instance for the specified [activityId] and [fid].
  ///
  /// Creates an [Activity] object that represents a specific activity within a feed.
  /// The activity can be used to manage comments, reactions, and other activity-specific
  /// operations.
  ///
  /// Example:
  /// ```dart
  /// final feedId = FeedId(group: 'user', id: 'john');
  /// final activity = client.activity('activity-123', feedId);
  ///
  /// // Add a comment to the activity
  /// final commentResult = await activity.addComment(AddCommentRequest(
  ///   text: 'Great post!',
  ///   userId: 'user-456',
  /// ));
  ///
  /// // Add a reaction
  /// final reactionResult = await activity.addReaction(AddReactionRequest(
  ///   kind: 'like',
  ///   userId: 'user-456',
  /// ));
  /// ```
  ///
  /// Returns an [Activity] instance that can be used to interact with the specified activity.
  Activity activity({
    required String activityId,
    required FeedId fid,
    ActivityData? initialData,
  });

  /// Creates an activity list instance based on the provided [query].
  ///
  /// Creates an [ActivityList] object that represents a collection of activities
  /// matching the specified query. The activity list can be used to fetch activities,
  /// manage activity pagination, and receive real-time updates for activity-related events.
  ///
  /// Example:
  /// ```dart
  /// final activityList = client.activityList(ActivitiesQuery(
  ///   filter: Filter.and([
  ///     Filter.equal(ActivitiesFilterField.activityType, 'post'),
  ///     Filter.greaterThan(ActivitiesFilterField.createdAt,
  ///       DateTime.now().subtract(Duration(days: 7))),
  ///   ]),
  ///   sort: ActivitiesSort.defaultSort,
  ///   limit: 50,
  /// ));
  ///
  /// final result = await activityList.get();
  /// final more = await activityList.queryMore(limit: 25);
  /// ```
  ///
  /// Returns an [ActivityList] instance that can be used to interact with the collection of
  /// activities.
  ActivityList activityList(ActivitiesQuery query);

  /// Upserts (inserts or updates) multiple activities.
  ///
  /// Creates or updates the provided [activities] in a single batch operation.
  ///
  /// Example:
  /// ```dart
  /// final upsertedActivities = await client.upsertActivities(
  ///   activities: [
  ///     const ActivityRequest(
  ///       feeds: ['user:123'],
  ///       id: '1',
  ///       text: 'hi',
  ///       type: 'post',
  ///     ),
  ///     const ActivityRequest(
  ///       feeds: ['user:456'],
  ///       id: '2',
  ///       text: 'hi',
  ///       type: 'post',
  ///     ),
  ///   ],
  /// );
  ///```
  ///
  /// Returns a [Result] containing the list of upserted [ActivityData] or an error.
  Future<Result<List<ActivityData>>> upsertActivities({
    required List<api.ActivityRequest> activities,
  });

  /// Deletes multiple activities.
  ///
  /// Deletes the provided [ids] in a single batch operation.
  ///
  ///```dart
  ///await client.deleteActivities(
  ///  ids: ['123', '456'],
  ///  hardDelete: false,
  ///);
  ///
  /// Returns a [Result] containing the list of deleted activity ids or an error.
  Future<Result<api.DeleteActivitiesResponse>> deleteActivities({
    required List<String> ids,
    bool? hardDelete,
  });

  /// Creates an activity reaction list instance based on the provided [query].
  ///
  /// Creates an [ActivityReactionList] object that represents a collection of reactions
  /// for a specific activity. The activity reaction list can be used to fetch reactions for an activity,
  /// manage reaction pagination, and receive real-time updates for reaction-related events.
  ///
  /// Example:
  /// ```dart
  /// final reactionList = client.activityReactionList(ActivityReactionsQuery(
  ///   activityId: 'activity-123',
  ///   limit: 100,
  /// ));
  ///
  /// final result = await reactionList.get();
  /// ```
  ///
  /// Returns an [ActivityReactionList] instance that can be used to interact with the collection
  /// of activity reactions.
  ActivityReactionList activityReactionList(ActivityReactionsQuery query);

  /// Creates a bookmark list instance based on the provided [query].
  ///
  /// Creates a [BookmarkList] object that represents a collection of bookmarks
  /// matching the specified query. The bookmark list can be used to fetch user bookmarks,
  /// manage bookmark folders, and receive real-time updates for bookmark-related events.
  ///
  /// Example:
  /// ```dart
  /// final bookmarkList = client.bookmarkList(BookmarksQuery(
  ///   userId: 'user-123',
  ///   limit: 50,
  /// ));
  ///
  /// final result = await bookmarkList.get();
  /// ```
  ///
  /// Returns a [BookmarkList] instance that can be used to interact with the collection of bookmarks.
  BookmarkList bookmarkList(BookmarksQuery query);

  /// Creates a bookmark folder list instance based on the provided [query].
  ///
  /// Creates a [BookmarkFolderList] object that represents a collection of bookmark
  /// folders matching the specified query. The bookmark folder list can be used to fetch user
  /// bookmark folders, manage folder organization, and receive real-time updates for
  /// folder-related events.
  ///
  /// Example:
  /// ```dart
  /// final folderList = client.bookmarkFolderList(BookmarkFoldersQuery(
  ///   userId: 'user-123',
  ///   limit: 25,
  /// ));
  ///
  /// final result = await folderList.get();
  /// ```
  ///
  /// Returns a [BookmarkFolderList] instance that can be used to interact with the collection of
  /// bookmark folders.
  BookmarkFolderList bookmarkFolderList(BookmarkFoldersQuery query);

  /// Creates a comment list instance based on the provided [query].
  ///
  /// Creates a [CommentList] object that represents a collection of comments
  /// matching the specified query. The comment list can be used to fetch comments,
  /// manage comment pagination, and receive real-time updates for comment-related events.
  ///
  /// Example:
  /// ```dart
  /// final commentList = client.commentList(CommentsQuery(
  ///   filter: Filter.equal(CommentsFilterField.userId, 'user-123'),
  ///   sort: [CommentsSort.desc(CommentsSortField.createdAt)],
  ///   limit: 50,
  /// ));
  ///
  /// final result = await commentList.get();
  /// ```
  ///
  /// Returns a [CommentList] instance that can be used to interact with a collection of comments.
  CommentList commentList(CommentsQuery query);

  /// Creates an activity comment list instance based on the provided [query].
  ///
  /// Creates an [ActivityCommentList] object that represents a collection of comments
  /// for a specific activity. The activity comment list can be used to fetch comments for an
  /// activity, manage comment pagination, and receive real-time updates for comment-related
  /// events.
  ///
  /// Example:
  /// ```dart
  /// final commentList = client.activityCommentList(ActivityCommentsQuery(
  ///   activityId: 'activity-123',
  ///   limit: 20,
  /// ));
  ///
  /// final result = await commentList.get();
  ///
  /// // Listen for new comments
  /// commentList.addListener(() {
  ///   print('Comments: ${commentList.state.comments.length}');
  /// });
  /// ```
  ///
  /// Returns an [ActivityCommentList] instance that can be used to interact with the collection of
  /// activity comments.
  ActivityCommentList activityCommentList(ActivityCommentsQuery query);

  /// Creates a comment reply list instance based on the provided [query].
  ///
  /// Creates a [CommentReplyList] object that represents a collection of replies
  /// for a specific comment. The comment reply list can be used to fetch replies to a comment,
  /// manage reply pagination, and receive real-time updates for reply-related events.
  ///
  /// Example:
  /// ```dart
  /// final replyList = client.commentReplyList(CommentRepliesQuery(
  ///   commentId: 'comment-123',
  ///   limit: 30,
  /// ));
  ///
  /// final result = await replyList.get();
  /// ```
  ///
  /// Returns a [CommentReplyList] instance that can be used to interact with the collection of
  /// comment replies.
  CommentReplyList commentReplyList(CommentRepliesQuery query);

  /// Creates a comment reaction list instance based on the provided [query].
  ///
  /// Creates a [CommentReactionList] object that represents a collection of reactions
  /// for a specific comment. The comment reaction list can be used to fetch reactions for a comment,
  /// manage reaction pagination, and receive real-time updates for reaction-related events.
  ///
  /// Example:
  /// ```dart
  /// final reactionList = client.commentReactionList(CommentReactionsQuery(
  ///   commentId: 'comment-123',
  ///   limit: 100,
  /// ));
  ///
  /// final result = await reactionList.get();
  /// ```
  ///
  /// Returns a [CommentReactionList] instance that can be used to interact with the collection of
  /// comment reactions.
  CommentReactionList commentReactionList(CommentReactionsQuery query);

  /// Creates a member list instance based on the provided [query].
  ///
  /// Creates a [MemberList] object that represents a collection of feed members
  /// matching the specified query. The member list can be used to fetch feed members, manage
  /// member pagination, and receive real-time updates for member-related events.
  ///
  /// Example:
  /// ```dart
  /// final memberList = client.memberList(MembersQuery(
  ///   fid: FeedId(group: 'team', id: 'developers'),
  ///   filter: Filter.equal(MembersFilterField.status, 'active'),
  /// ));
  ///
  /// final result = await memberList.get();
  /// ```
  ///
  /// Returns a [MemberList] instance that can be used to interact with the collection of feed
  /// members.
  MemberList memberList(MembersQuery query);

  /// Creates a poll vote list instance based on the provided [query].
  ///
  /// Creates a [PollVoteList] object that represents a collection of poll votes
  /// matching the specified query. The poll vote list can be used to fetch poll votes,
  /// manage vote pagination, and receive real-time updates for vote-related events.
  ///
  /// Example:
  /// ```dart
  /// final voteList = client.pollVoteList(PollVotesQuery(
  ///   pollId: 'poll-123',
  ///   limit: 100,
  /// ));
  ///
  /// final result = await voteList.get();
  /// ```
  ///
  /// Returns a [PollVoteList] instance that can be used to interact with the collection of poll
  /// votes.
  PollVoteList pollVoteList(PollVotesQuery query);

  /// Creates a poll list instance based on the provided [query].
  ///
  /// Creates a [PollList] object that represents a collection of polls
  /// matching the specified query. The poll list can be used to fetch polls,
  /// manage poll pagination, and receive real-time updates for poll-related events.
  ///
  /// Example:
  /// ```dart
  /// final pollList = client.pollList(PollsQuery(
  ///   filter: Filter.equal(PollsFilterField.status, 'active'),
  ///   sort: [PollsSort.desc(PollsSortField.createdAt)],
  ///   limit: 25,
  /// ));
  ///
  /// final result = await pollList.get();
  /// ```
  ///
  /// Returns a [PollList] instance that can be used to interact with the collection of polls.
  PollList pollList(PollsQuery query);

  /// Creates a moderation configuration list instance based on the provided [query].
  ///
  /// Creates a [ModerationConfigList] object that represents a collection of
  /// moderation configurations matching the specified query. The moderation configuration list can
  /// be used to fetch configurations, manage configuration pagination, and receive real-time
  /// updates for configuration-related events.
  ///
  /// Example:
  /// ```dart
  /// final moderationList = client.moderationConfigList(ModerationConfigsQuery(
  ///   limit: 25,
  /// ));
  ///
  /// final result = await moderationList.get();
  ///
  /// // Access moderation client
  /// final moderationClient = client.moderation;
  /// ```
  ///
  /// Returns a [ModerationConfigList] instance that can be used to interact with the collection of
  /// moderation configurations.
  ModerationConfigList moderationConfigList(ModerationConfigsQuery query);

  /// Retrieves the application configuration and settings.
  ///
  /// Fetches current application data including configuration settings, file upload
  /// configurations, and feature flags. The result is cached after the first successful
  /// request to avoid unnecessary API calls.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.getApp();
  /// switch (result) {
  ///   case Success(data: final appData):
  ///     print('App name: ${appData.name}');
  ///     print('File upload size limit: ${appData.fileUploadConfig.sizeLimit}');
  ///   case Failure(error: final error):
  ///     print('Failed to get app data: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing the [AppData] if successful, or an error if the request fails.
  Future<Result<AppData>> getApp();

  /// Queries all devices associated with the current user.
  ///
  /// Retrieves a list of all registered push notification devices for the authenticated user.
  /// This includes devices for different platforms like iOS, Android, and other supported
  /// push notification providers.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.queryDevices();
  ///
  /// switch (result) {
  ///   case Success(data: final devicesResponse):
  ///     print('Found ${devicesResponse.devices.length} devices');
  ///   case Failure(error: final error):
  ///     print('Failed to query devices: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing a [api.ListDevicesResponse] with the list of devices or an error.
  Future<Result<api.ListDevicesResponse>> queryDevices();

  /// Creates a new device for push notifications.
  ///
  /// Registers a new device with the Stream Feeds API for receiving push notifications.
  /// The device is associated with the current authenticated user and configured with
  /// the specified push notification provider.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.createDevice(
  ///   id: 'firebase-token-123',
  ///   pushProvider: PushNotificationsProvider.firebase,
  ///   pushProviderName: 'MyApp Firebase Config',
  /// );
  ///
  /// switch (result) {
  ///   case Success():
  ///     print('Device created successfully');
  ///   case Failure(error: final error):
  ///     print('Failed to create device: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] indicating success or failure of the device creation operation.
  Future<Result<void>> createDevice({
    required String id,
    required PushNotificationsProvider pushProvider,
    required String pushProviderName,
  });

  /// Deletes a device by its unique identifier.
  ///
  /// Removes the specified device from the user's registered push notification devices.
  /// After deletion, the device will no longer receive push notifications.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.deleteDevice(id: 'firebase-token-123');
  ///
  /// switch (result) {
  ///   case Success():
  ///     print('Device deleted successfully');
  ///   case Failure(error: final error):
  ///     print('Failed to delete device: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteDevice({required String id});

  /// Deletes a previously uploaded file from the CDN.
  ///
  /// Removes files such as videos or other non-image attachments by making an asynchronous
  /// request to the global file deletion endpoint.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.deleteFile(
  ///   url: 'https://cdn.stream.io/uploads/video.mp4',
  /// );
  ///
  /// switch (result) {
  ///   case Success():
  ///     print('File deleted successfully');
  ///   case Failure(error: final error):
  ///     print('Failed to delete file: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteFile({required String url});

  /// Deletes a previously uploaded image from the CDN.
  ///
  /// Removes images such as user-uploaded photos or thumbnails by making an asynchronous
  /// request to the global image deletion endpoint.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.deleteImage(
  ///   url: 'https://cdn.stream.io/uploads/photo.jpg',
  /// );
  ///
  /// switch (result) {
  ///   case Success():
  ///     print('Image deleted successfully');
  ///   case Failure(error: final error):
  ///     print('Failed to delete image: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteImage({required String url});

  /// Creates or updates multiple follow relationships in a batch operation.
  ///
  /// Creates or updates follow relationships for multiple feeds using the provided [request] data.
  /// Returns both newly created follows and existing follows that were already present.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.getOrCreateFollows(
  ///   api.FollowBatchRequest(
  ///     follows: [
  ///       api.FollowRequest(
  ///         source: FeedId.user('john').rawValue,
  ///         target: FeedId.user('jane').rawValue,
  ///       ),
  ///       api.FollowRequest(
  ///         source: FeedId.user('john').rawValue,
  ///         target: FeedId.user('bob').rawValue,
  ///       ),
  ///     ],
  ///   ),
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final batchFollowData):
  ///     print('Created ${batchFollowData.created.length} new follows');
  ///     print('Total follows: ${batchFollowData.follows.length}');
  ///   case Failure(error: final error):
  ///     print('Failed to get or create follows: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing a [BatchFollowData] with the follows or an error.
  Future<Result<BatchFollowData>> getOrCreateFollows(
    api.FollowBatchRequest request,
  );

  /// Removes multiple follow relationships in a batch operation.
  ///
  /// Unfollows multiple feeds using the provided [request] data. Returns the list of
  /// follow relationships that were removed.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.getOrCreateUnfollows(
  ///   api.UnfollowBatchRequest(
  ///     follows: [
  ///       api.UnfollowPair(
  ///         source: FeedId.user('john').rawValue,
  ///         target: FeedId.user('jane').rawValue,
  ///       ),
  ///       api.UnfollowPair(
  ///         source: FeedId.user('john').rawValue,
  ///         target: FeedId.user('bob').rawValue,
  ///       ),
  ///     ],
  ///   ),
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final unfollowedFollows):
  ///     print('Unfollowed ${unfollowedFollows.length} feeds');
  ///   case Failure(error: final error):
  ///     print('Failed to unfollow feeds: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing a list of [FollowData] with the unfollowed feeds or an error.
  Future<Result<List<FollowData>>> getOrCreateUnfollows(
    api.UnfollowBatchRequest request,
  );

  /// Reads collections by their references.
  ///
  /// By default, users can only read their own collections.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.readCollections(
  ///   refs: ['collection:123', 'collection:456'],
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final response):
  ///     print('Found ${response.collections.length} collections');
  ///   case Failure(error: final error):
  ///     print('Failed to read collections: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing [api.ReadCollectionsResponse] or an error.
  Future<Result<api.ReadCollectionsResponse>> readCollections({
    required List<String> refs,
  });

  /// Creates new collections in a batch operation.
  ///
  /// Collections are data objects that can be attached to activities for managing
  /// shared data across multiple activities.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.createCollections(
  ///   request: api.CreateCollectionsRequest(
  ///     collections: [
  ///       api.CollectionRequest(
  ///         id: '123',
  ///         name: 'my_collection',
  ///         custom: const {'key': 'value'},
  ///       ),
  ///     ],
  ///   ),
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final response):
  ///     print('Created ${response.collections.length} collections');
  ///   case Failure(error: final error):
  ///     print('Failed to create collections: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing [api.CreateCollectionsResponse] or an error.
  Future<Result<api.CreateCollectionsResponse>> createCollections({
    required api.CreateCollectionsRequest request,
  });

  /// Updates existing collections in a batch operation.
  ///
  /// Only the custom data field is updatable. Users can only update their own collections.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.updateCollections(
  ///   request: api.UpdateCollectionsRequest(
  ///     collections: [
  ///       api.UpdateCollectionRequest(
  ///         id: '123',
  ///         name: 'my_collection',
  ///         custom: const {'updated_key': 'updated_value'},
  ///       ),
  ///     ],
  ///   ),
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final response):
  ///     print('Updated ${response.collections.length} collections');
  ///   case Failure(error: final error):
  ///     print('Failed to update collections: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing [api.UpdateCollectionsResponse] or an error.
  Future<Result<api.UpdateCollectionsResponse>> updateCollections({
    required api.UpdateCollectionsRequest request,
  });

  /// Deletes collections in a batch operation.
  ///
  /// Users can only delete their own collections.
  ///
  /// Example:
  /// ```dart
  /// final result = await client.deleteCollections(
  ///   refs: ['collection:123', 'collection:456'],
  /// );
  ///
  /// switch (result) {
  ///   case Success(data: final response):
  ///     print('Deleted collections successfully');
  ///   case Failure(error: final error):
  ///     print('Failed to delete collections: $error');
  /// }
  /// ```
  ///
  /// Returns a [Result] containing [api.DeleteCollectionsResponse] or an error.
  Future<Result<api.DeleteCollectionsResponse>> deleteCollections({
    required List<String> refs,
  });

  /// The moderation client for managing moderation-related operations.
  ///
  /// Provides access to moderation configurations, content moderation, and moderation-related
  /// queries.
  ModerationClient get moderation;

  /// The attachment uploader for managing file and image uploads.
  ///
  /// Provides functionality for uploading files and images to the Stream CDN with
  /// support for various file types, progress tracking, and upload configurations.
  StreamAttachmentUploader get attachmentUploader;
}

/// Extension methods for the [StreamFeedsClient] to simplify feed creation.
extension StreamFeedsClientHelpers on StreamFeedsClient {
  /// Creates a feed instance for the specified [group] and [id].
  ///
  /// Creates a [Feed] object that represents a specific feed.
  /// The feed can be used to fetch activities, manage follows, and receive real-time updates.
  ///
  /// When [onNewActivity] is provided, it customizes how new activities received
  /// via real-time events are inserted into the feed. Defaults to [defaultOnNewActivity],
  /// which adds activities created by the current user to the start of the feed
  /// if they match the feed's filter.
  ///
  /// Example:
  /// ```dart
  /// final userFeed = client.feed('user', 'john');
  /// final timelineFeed = client.feed('timeline', 'flat');
  ///
  /// // Add an activity with collection references
  /// final result = await userFeed.addActivity(FeedAddActivityRequest(
  ///   type: 'post',
  ///   text: 'Check out this picture!',
  ///   custom: {'object': 'picture:1'},
  ///   collectionRefs: ['my_collection:123'],
  /// ));
  ///
  /// // Listen to state changes
  /// userFeed.addListener(() {
  ///   print('Activities: ${userFeed.state.activities.length}');
  /// });
  /// ```
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feed({
    required String group,
    required String id,
    OnNewActivity onNewActivity = defaultOnNewActivity,
  }) {
    final fid = FeedId(group: group, id: id);
    return feedFromId(fid, onNewActivity: onNewActivity);
  }

  /// Creates a feed instance for the specified [fid].
  ///
  /// Creates a [Feed] object that represents a specific feed.
  /// The feed can be used to fetch activities, manage follows, and receive real-time updates.
  ///
  /// When [onNewActivity] is provided, it customizes how new activities received
  /// via real-time events are inserted into the feed. Defaults to [defaultOnNewActivity],
  /// which adds activities created by the current user to the start of the feed
  /// if they match the feed's filter.
  ///
  /// Example:
  /// ```dart
  /// final feedId = FeedId(group: 'user', id: 'john');
  /// final userFeed = client.feedFromId(feedId);
  ///
  /// final result = await userFeed.getOrCreate();
  /// ```
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feedFromId(
    FeedId fid, {
    OnNewActivity onNewActivity = defaultOnNewActivity,
  }) {
    final query = FeedQuery(fid: fid);
    return feedFromQuery(query, onNewActivity: onNewActivity);
  }
}

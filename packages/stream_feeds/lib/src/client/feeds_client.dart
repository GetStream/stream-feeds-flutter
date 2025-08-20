import 'package:stream_core/stream_core.dart';

import '../core/models/app_data.dart';
import '../core/models/feed_id.dart';
import '../core/models/feeds_config.dart';
import '../core/state/activity.dart';
import '../core/state/activity_comment_list.dart';
import '../core/state/activity_list.dart';
import '../core/state/activity_reaction_list.dart';
import '../core/state/bookmark_folder_list.dart';
import '../core/state/bookmark_list.dart';
import '../core/state/comment_list.dart';
import '../core/state/comment_reaction_list.dart';
import '../core/state/comment_reply_list.dart';
import '../core/state/feed.dart';
import '../core/state/feed_list.dart';
import '../core/state/follow_list.dart';
import '../core/state/member_list.dart';
import '../core/state/moderation_config_list.dart';
import '../core/state/poll_list.dart';
import '../core/state/poll_vote_list.dart';
import '../core/state/query/activities_query.dart';
import '../core/state/query/activity_comments_query.dart';
import '../core/state/query/activity_reactions_query.dart';
import '../core/state/query/bookmark_folders_query.dart';
import '../core/state/query/bookmarks_query.dart';
import '../core/state/query/comment_reactions_query.dart';
import '../core/state/query/comment_replies_query.dart';
import '../core/state/query/comments_query.dart';
import '../core/state/query/feed_query.dart';
import '../core/state/query/feeds_query.dart';
import '../core/state/query/follows_query.dart';
import '../core/state/query/members_query.dart';
import '../core/state/query/moderation_configs_query.dart';
import '../core/state/query/poll_votes_query.dart';
import '../core/state/query/polls_query.dart';
import 'feeds_client_impl.dart';
import 'moderation_client.dart';

/// {@template stream_feeds_client}
/// Stream Feeds client for building scalable newsfeeds and activity streams.
///
/// The main entry point for integrating Stream's Feeds API into your Dart/Flutter
/// application. Provides comprehensive tools for building activity feeds, social
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
///     imageUrl: 'https://example.com/avatar.jpg',
///     customData: {'email': 'john@example.com'},
///   ),
///   tokenProvider: UserTokenProvider.static('user-jwt-token-here'),
///   config: FeedsConfig(
///     // Optional configuration
///   ),
/// );
///
/// // Connect to start receiving real-time updates
/// await client.connect();
/// ```
///
/// ### Different User Types
///
/// The User class supports different authentication types:
///
/// ```dart
/// // Regular user with full details
/// final regularUser = User(
///   id: 'user-123',
///   name: 'John Doe',
///   imageUrl: 'https://example.com/avatar.jpg',
///   role: 'admin',
///   customData: {'department': 'Engineering'},
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
/// The client uses a [UserTokenProvider] for flexible token management:
///
/// ```dart
/// // Static token (for development or long-lived tokens)
/// final staticProvider = UserTokenProvider.static('your-jwt-token');
///
/// // Dynamic token (for refreshable tokens or secure storage)
/// final dynamicProvider = UserTokenProvider.dynamic(() async {
///   // Fetch from secure storage, API, etc.
///   final token = await secureStorage.read(key: 'user_token');
///   if (token == null) {
///     throw Exception('No token available');
///   }
///   return token;
/// });
/// ```
///
/// ## Working with Feeds
///
/// Create and interact with activity feeds:
///
/// ```dart
/// // Create a user feed
/// final userFeed = client.feed('user', 'john');
///
/// // Add an activity
/// await userFeed.addActivity(AddActivityRequest(
///   verb: 'post',
///   object: 'picture:1',
///   extraData: {'message': 'Check out this picture!'},
/// ));
///
/// // Listen to feed state changes
/// userFeed.addListener(() {
///   print('Feed has ${userFeed.state.activities.length} activities');
/// });
/// ```
///
/// ## Advanced Queries
///
/// Use type-safe queries for complex data retrieval:
///
/// ```dart
/// // Query feeds with filtering
/// final feedList = client.feedList(FeedsQuery(
///   filter: Filter.equal('visibility', 'public'),
///   sort: [FeedsSort.desc(FeedsSortField.followerCount)],
///   limit: 25,
/// ));
///
/// // Query activities with pagination
/// final activityList = client.activityList(ActivitiesQuery(
///   filter: Filter.greaterThan('popularity', 100),
///   sort: ActivitiesSort.defaultSort,
///   limit: 50,
/// ));
/// ```
///
/// ## Social Features
///
/// Build rich social experiences:
///
/// ```dart
/// // Manage comments
/// final commentList = client.activityCommentList(ActivityCommentsQuery(
///   activityId: 'activity-123',
///   limit: 20,
/// ));
///
/// // Handle reactions
/// final reactionList = client.activityReactionList(ActivityReactionsQuery(
///   activityId: 'activity-123',
///   limit: 100,
/// ));
///
/// // Manage bookmarks
/// final bookmarkList = client.bookmarkList(BookmarksQuery(
///   userId: 'user-123',
///   limit: 50,
/// ));
/// ```
///
/// ## Real-time Updates
///
/// The client automatically handles real-time updates through WebSocket connections.
/// State objects will automatically update when changes occur, and you can listen
/// for these changes:
///
/// ```dart
/// feed.addListener(() {
///   // React to feed state changes
///   if (feed.state.isLoading) {
///     showLoadingIndicator();
///   } else {
///     updateUI(feed.state.activities);
///   }
/// });
/// ```
///
/// ## Error Handling
///
/// API methods return Result types for explicit error handling:
///
/// ```dart
/// final result = await client.getApp();
/// switch (result) {
///   case Success(value: final appData):
///     print('App configuration: ${appData.name}');
///   case Failure(error: final error):
///     print('Failed to get app data: $error');
/// }
/// ```
///
/// ## Resource Management
///
/// Always disconnect the client when done to properly clean up resources:
///
/// ```dart
/// await client.disconnect();
/// ```
///
/// For more detailed documentation and examples, visit:
/// https://getstream.io/docs/feeds/
/// {@endtemplate}
abstract interface class StreamFeedsClient {
  /// Creates a new Stream Feeds client instance.
  ///
  /// The [apiKey] should be obtained from your Stream dashboard. The [user] contains
  /// authentication and profile information. Optional [config] provides client settings.
  ///
  /// Example:
  /// ```dart
  /// final client = StreamFeedsClient(
  ///   apiKey: 'your-api-key-here',
  ///   user: User(
  ///     id: 'user-123',
  ///     name: 'John Doe',
  ///     imageUrl: 'https://example.com/avatar.jpg',
  ///     role: 'user',
  ///     customData: {
  ///       'email': 'john@example.com',
  ///       'department': 'Engineering',
  ///     },
  ///   ),
  ///   tokenProvider: UserTokenProvider.static('user-jwt-token-here'),
  ///   config: FeedsConfig(
  ///     timeout: Duration(seconds: 30),
  ///     enableLogging: true,
  ///   ),
  /// );
  /// ```
  factory StreamFeedsClient({
    required String apiKey,
    required User user,
    String? userToken,
    TokenProvider? userTokenProvider,
    FeedsConfig config,
  }) = StreamFeedsClientImpl;

  /// Establishes a connection to the Stream service.
  ///
  /// This method sets up authentication and initializes the WebSocket connection for real-time
  /// updates.
  /// It should be called before using any other client functionality.
  ///
  /// Returns a [Result] indicating success or failure of the connection attempt.
  Future<void> connect();

  /// Disconnects the current [StreamFeedsClient].
  Future<void> disconnect();

  /// Fetches a feed based on the provided [FeedQuery].
  ///
  /// This method creates a [Feed] object using a [FeedQuery] that can include additional
  /// configuration such as activity filters, limits, and feed data for creation.
  ///
  /// Example:
  /// ```dart
  /// final query = FeedQuery(
  ///   fid: FeedId(group: 'user', id: 'john'),
  ///   activityLimit: 20,
  ///   data: FeedInput(name: "John's Feed")
  /// );
  /// final feed = client.feedWithQuery(query);
  /// ```
  ///
  /// - [query]: The feed query containing the feed identifier and optional configuration.
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feedFromQuery(FeedQuery query);

  /// Creates a feed list instance based on the provided query.
  ///
  /// This method creates a [FeedList] object that represents a collection of feeds matching the
  /// specified query. The feed list can be used to fetch multiple feeds, manage feed groups, and
  /// receive real-time updates for all feeds in the list.
  ///
  /// - [query]: The feeds query containing filtering and pagination parameters.
  ///
  /// Returns a [FeedList] instance that can be used to interact with the collection of feeds.
  FeedList feedList(FeedsQuery query);

  /// Creates a follow list instance based on the provided query.
  ///
  /// This method creates a [FollowList] object that represents a collection of follow
  /// relationships matching the specified query. The follow list can be used to fetch followers,
  /// following relationships, and manage follow data with pagination support.
  ///
  /// - [query]: The follows query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns a [FollowList] instance that can be used to interact with the collection of follow
  /// relationships.
  FollowList followList(FollowsQuery query);

//
//     // TODO: Event subscription
//
//
//     // TODO: Activities operations
//

  /// Creates an activity instance for the specified activity ID and feed ID.
  ///
  /// This method creates an [Activity] object that represents a specific activity within a feed.
  /// The activity can be used to manage comments, reactions, and other activity-specific
  /// operations.
  ///
  /// Example:
  /// ```dart
  /// final feedId = FeedId(group: 'user', id: 'john');
  /// final activity = client.activity(activityId: 'activity-123', fid: feedId);
  /// ```
  ///
  /// - [activityId]: The unique identifier of the activity.
  /// - [fid]: The feed identifier where the activity belongs.
  Activity activity(String activityId, FeedId fid);

  /// Creates an activity list instance based on the provided query.
  ///
  /// This method creates an [ActivityList] object that represents a collection of activities
  /// matching the specified query. The activity list can be used to fetch activities,
  /// manage activity pagination, and receive real-time updates for activity-related events.
  ///
  /// - [query]: The activities query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns an [ActivityList] instance that can be used to interact with the collection of
  /// activities.
  ActivityList activityList(ActivitiesQuery query);

  /// Creates an activity reaction list instance based on the provided query.
  ///
  /// This method creates an [ActivityReactionList] object that represents a collection of reactions
  /// for a specific activity. The activity reaction list can be used to fetch reactions for an activity,
  /// manage reaction pagination, and receive real-time updates for reaction-related events.
  ///
  /// - [query]: The activity reactions query containing the activity identifier and pagination
  /// parameters.
  ///
  /// Returns an [ActivityReactionList] instance that can be used to interact with the collection
  /// of activity reactions.
  ActivityReactionList activityReactionList(ActivityReactionsQuery query);

  /// Creates a bookmark list instance based on the provided query.
  ///
  /// This method creates a [BookmarkList] object that represents a collection of bookmarks
  /// matching the specified query. The bookmark list can be used to fetch user bookmarks,
  /// manage bookmark folders, and receive real-time updates for bookmark-related events.
  BookmarkList bookmarkList(BookmarksQuery query);

  /// Creates a bookmark folder list instance based on the provided query.
  ///
  /// This method creates a [BookmarkFolderList] object that represents a collection of bookmark
  /// folders matching the specified query. The bookmark folder list can be used to fetch user
  /// bookmark folders, manage folder organization, and receive real-time updates for
  /// folder-related events.
  ///
  /// - [query]: The bookmark folders query containing filtering, sorting, and pagination
  /// parameters.
  ///
  /// Returns a [BookmarkFolderList] instance that can be used to interact with the collection of
  /// bookmark folders.
  BookmarkFolderList bookmarkFolderList(BookmarkFoldersQuery query);

  /// Creates a comment list instance based on the provided query.
  ///
  /// This method creates a [CommentList] object that represents a collection of comments
  /// matching the specified query. The comment list can be used to fetch comments,
  /// manage comment pagination, and receive real-time updates for comment-related events.
  ///
  /// - [query]: The comments query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns a [CommentList] instance that can be used to interact with a collection of comments.
  CommentList commentList(CommentsQuery query);

  /// Creates an activity comment list instance based on the provided query.
  ///
  /// This method creates an [ActivityCommentList] object that represents a collection of comments
  /// for a specific activity. The activity comment list can be used to fetch comments for an
  /// activity, manage comment pagination, and receive real-time updates for comment-related
  /// events.
  ///
  /// - [query]: The activity comments query containing the activity identifier and pagination
  /// parameters.
  ///
  /// Returns an [ActivityCommentList] instance that can be used to interact with the collection of
  /// activity comments.
  ActivityCommentList activityCommentList(ActivityCommentsQuery query);

  /// Creates a comment reply list instance based on the provided query.
  ///
  /// This method creates a [CommentReplyList] object that represents a collection of replies
  /// for a specific comment. The comment reply list can be used to fetch replies to a comment,
  /// manage reply pagination, and receive real-time updates for reply-related events.
  ///
  /// - [query]: The comment replies query containing the comment identifier and pagination
  /// parameters.
  ///
  /// Returns a [CommentReplyList] instance that can be used to interact with the collection of
  /// comment replies.
  CommentReplyList commentReplyList(CommentRepliesQuery query);

  /// Creates a comment reaction list instance based on the provided query.
  ///
  /// This method creates a [CommentReactionList] object that represents a collection of reactions
  /// for a specific comment. The comment reaction list can be used to fetch reactions for a comment,
  /// manage reaction pagination, and receive real-time updates for reaction-related events.
  ///
  /// - [query]: The comment reactions query containing the comment identifier and pagination
  /// parameters.
  ///
  /// Returns a [CommentReactionList] instance that can be used to interact with the collection of
  /// comment reactions.
  CommentReactionList commentReactionList(CommentReactionsQuery query);

  /// Creates a member list instance based on the provided query.
  ///
  /// This method creates a [MemberList] object that represents a collection of feed members
  /// matching the specified query. The member list can be used to fetch feed members, manage
  /// member pagination,  and receive real-time updates for member-related events.
  ///
  /// - [query]: The members query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns a [MemberList] instance that can be used to interact with the collection of feed
  /// members.
  MemberList memberList(MembersQuery query);

  /// Creates a poll vote list instance based on the provided query.
  ///
  /// This method creates a [PollVoteList] object that represents a collection of poll votes
  /// matching the specified query. The poll vote list can be used to fetch poll votes,
  /// manage vote pagination, and receive real-time updates for vote-related events.
  ///
  /// - [query]: The poll votes query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns a [PollVoteList] instance that can be used to interact with the collection of poll
  /// votes.
  PollVoteList pollVoteList(PollVotesQuery query);

  /// Creates a poll list instance based on the provided query.
  ///
  /// This method creates a [PollList] object that represents a collection of polls
  /// matching the specified query. The poll list can be used to fetch polls,
  /// manage poll pagination, and receive real-time updates for poll-related events.
  ///
  /// - [query]: The polls query containing filtering, sorting, and pagination parameters.
  ///
  /// Returns a [PollList] instance that can be used to interact with the collection of polls.
  PollList pollList(PollsQuery query);

  /// Creates a moderation configuration list instance based on the provided query.
  ///
  /// This method creates a [ModerationConfigList] object that represents a collection of
  /// moderation configurations matching the specified query. The moderation configuration list can
  /// be used to fetch configurations, manage configuration pagination, and receive real-time
  /// updates for configuration-related events.
  ///
  /// - [query]: The moderation configurations query containing filtering, sorting, and
  /// pagination parameters.
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
  /// Returns a [Result] containing the [AppData] if successful, or an error if the request fails.
  Future<Result<AppData>> getApp();

  // TODO: Devices API

  /// Deletes a previously uploaded file from the CDN.
  ///
  /// This is typically used for videos, or other non-image attachments.
  /// The method makes an asynchronous request to the global file deletion endpoint.
  ///
  /// - [url]: The URL of the file to be deleted.
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteFile(String url);

  /// Deletes a previously uploaded image from the CDN.
  ///
  /// This is intended for removing images such as user-uploaded photos or thumbnails.
  /// The method makes an asynchronous request to the global image deletion endpoint.
  ///
  /// - [url]: The URL of the image to be deleted.
  ///
  /// Returns a [Result] indicating success or failure of the deletion operation.
  Future<Result<void>> deleteImage(String url);

  /// Provides an instance of [ModerationClient] for managing moderation-related operations.
  ///
  /// This client allows you to interact with moderation configurations, perform content
  /// moderation, and manage moderation-related queries.
  ModerationClient get moderation;
}

/// Extension methods for the [StreamFeedsClient] to simplify feed creation.
extension StreamFeedsClientHelpers on StreamFeedsClient {
  /// Creates a feed instance for the specified group and id.
  ///
  /// This method creates a [Feed] object that represents a specific feed.
  /// The feed can be used to fetch activities, manage follows, and receive real-time updates.
  ///
  /// Example:
  /// ```dart
  /// final userFeed = client.feed('user', 'john');
  /// final timelineFeed = client.feed('timeline', 'flat');
  /// ```
  ///
  /// - [group]: The feed group identifier (e.g., "user", "timeline", "notification").
  /// - [id]: The specific feed identifier within the group (e.g., "john", "flat").
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feed(String group, String id) {
    final fid = FeedId(group: group, id: id);
    return feedFromId(fid);
  }

  /// Creates a feed instance for the specified feed ID.
  ///
  /// This method creates a [Feed] object that represents a specific feed.
  /// The feed can be used to fetch activities, manage follows, and receive real-time updates.
  ///
  /// Example:
  /// ```dart
  /// final feedId = FeedId(group: 'user', id: 'john');
  /// final userFeed = client.feedById(feedId);
  /// ```
  ///
  /// - [fid]: The [FeedId] identifier containing the group and ID.
  ///
  /// Returns a [Feed] instance that can be used to interact with the specified feed.
  Feed feedFromId(FeedId fid) {
    final query = FeedQuery(fid: fid);
    return feedFromQuery(query);
  }
}

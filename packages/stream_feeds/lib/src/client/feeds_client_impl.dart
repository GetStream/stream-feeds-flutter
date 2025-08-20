import 'dart:async';

import 'package:stream_core/stream_core.dart';

import '../core/models/app_data.dart';
import '../core/models/feed_id.dart';
import '../core/models/feeds_config.dart';
import '../core/repository/activities_repository.dart';
import '../core/repository/app_repository.dart';
import '../core/repository/bookmarks_repository.dart';
import '../core/repository/comments_repository.dart';
import '../core/repository/feeds_repository.dart';
import '../core/repository/moderation_repository.dart';
import '../core/repository/polls_repository.dart';
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
import '../core/utils/endpoint_config.dart';
import '../generated/api/api.dart' as api;
import '../ws/feeds_ws_event.dart';
import 'feeds_client.dart';
import 'moderation_client.dart';

class StreamFeedsClientImpl implements StreamFeedsClient {
  StreamFeedsClientImpl({
    required this.apiKey,
    required this.user,
    this.config = const FeedsConfig(),
    String? userToken,
    TokenProvider? userTokenProvider,
  }) : assert(
          userToken != null || userTokenProvider != null,
          'Provide either a user token or a user token provider, or both',
        ) {
    // TODO: Make this configurable
    const endpointConfig = EndpointConfig.production;

    final systemEnvironmentManager = SystemEnvironmentManager(
      environment: const SystemEnvironment(
        sdkName: 'stream-feeds-dart',
        sdkIdentifier: 'dart',
        sdkVersion: '0.1.0',
      ),
    );

    final webSocketUri = Uri.parse(endpointConfig.wsEndpoint).replace(
      queryParameters: <String, String>{
        'api_key': apiKey,
        'stream-auth-type': 'jwt',
        'X-Stream-Client': systemEnvironmentManager.userAgent,
      },
    );

    tokenManager = switch (userTokenProvider) {
      final provider? => TokenManager.provider(
          user: user,
          provider: provider,
          token: userToken,
        ),
      _ => TokenManager.static(user: user, token: userToken!),
    };

    webSocketClient = WebSocketClient(
      url: webSocketUri.toString(),
      eventDecoder: FeedsWsEvent.fromEventObject,
      onConnectionEstablished: _authenticateUser,
    );

    final apiClient = api.DefaultApi(
      CoreHttpClient(
        apiKey,
        systemEnvironmentManager: systemEnvironmentManager,
        options: HttpClientOptions(baseUrl: endpointConfig.baseFeedsUrl),
        connectionIdProvider: () => webSocketClient.connectionId,
        tokenManager: tokenManager,
      ),
    );

    activitiesRepository = ActivitiesRepository(apiClient);
    appRepository = AppRepository(apiClient);
    bookmarksRepository = BookmarksRepository(apiClient);
    commentsRepository = CommentsRepository(apiClient);
    feedsRepository = FeedsRepository(apiClient);
    moderationRepository = ModerationRepository(apiClient);
    pollsRepository = PollsRepository(apiClient);

    moderation = ModerationClient(moderationRepository);
  }

  final String apiKey;
  final User user;
  final FeedsConfig config;

  late final TokenManager tokenManager;
  late final WebSocketClient webSocketClient;

  late final ActivitiesRepository activitiesRepository;
  late final AppRepository appRepository;
  late final BookmarksRepository bookmarksRepository;
  late final CommentsRepository commentsRepository;
  late final FeedsRepository feedsRepository;
  late final ModerationRepository moderationRepository;
  late final PollsRepository pollsRepository;

  @override
  late final ModerationClient moderation;

  Future<void> _authenticateUser() async {
    final connectUserRequest = WsAuthMessageRequest(
      products: ['feeds'],
      token: await tokenManager.loadToken(),
      userDetails: ConnectUserDetailsRequest(
        id: user.id,
        name: user.originalName,
        image: user.imageUrl,
        customData: user.custom,
      ),
    );

    webSocketClient.send(connectUserRequest);
  }

  Completer<void>? _connectionCompleter;
  ConnectionRecoveryHandler? _connectionRecoveryHandler;
  StreamSubscription<WebSocketConnectionState>? _connectionSubscription;

  SharedEmitter<WsEvent> get events => webSocketClient.events;

  void _onConnectionStateChanged(WebSocketConnectionState state) {
    // Connection completer not yet initialized, return early
    if (_connectionCompleter == null) return;

    if (state is Connected) {
      _connectionCompleter?.complete();
      _connectionCompleter = null;
    } else if (state is Disconnected) {
      _connectionCompleter?.completeError(Exception('Connection failed'));
      _connectionCompleter = null;
    }
  }

  @override
  Future<void> connect() async {
    // Already connected, return early
    if (webSocketClient.connectionState is Connected) return;

    // Waiting for an existing connection to complete
    if (_connectionCompleter != null) return _connectionCompleter?.future;

    if (user.type == UserAuthType.anonymous) {
      // Anonymous users cannot connect to the feeds websocket
      throw ClientException(message: 'Anonymous users cannot connect.');
    }

    _connectionRecoveryHandler = DefaultConnectionRecoveryHandler(
      client: webSocketClient,
    );

    webSocketClient.connect();

    _connectionSubscription = webSocketClient.connectionStateStream.listen(
      _onConnectionStateChanged,
    );

    _connectionCompleter = Completer<void>();
    return _connectionCompleter?.future;
  }

  @override
  Future<void> disconnect() async {
    _connectionCompleter = null;
    await _connectionRecoveryHandler?.dispose();
    await _connectionSubscription?.cancel();

    webSocketClient.disconnect(source: DisconnectionSource.userInitiated());
  }

  @override
  Feed feedFromQuery(FeedQuery query) {
    return Feed(
      query: query,
      currentUserId: user.id,
      activitiesRepository: activitiesRepository,
      bookmarksRepository: bookmarksRepository,
      commentsRepository: commentsRepository,
      feedsRepository: feedsRepository,
      pollsRepository: pollsRepository,
      eventsEmitter: events,
    );
  }

  @override
  FeedList feedList(FeedsQuery query) {
    // TODO: implement feedList
    throw UnimplementedError();
  }

  @override
  FollowList followList(FollowsQuery query) {
    // TODO: implement followList
    throw UnimplementedError();
  }

  @override
  Activity activity(String activityId, FeedId fid) {
    // TODO: implement activity
    throw UnimplementedError();
  }

  @override
  ActivityList activityList(ActivitiesQuery query) {
    // TODO: implement activityList
    throw UnimplementedError();
  }

  @override
  ActivityReactionList activityReactionList(ActivityReactionsQuery query) {
    // TODO: implement activityReactionList
    throw UnimplementedError();
  }

  @override
  BookmarkList bookmarkList(BookmarksQuery query) {
    // TODO: implement bookmarkList
    throw UnimplementedError();
  }

  @override
  BookmarkFolderList bookmarkFolderList(BookmarkFoldersQuery query) {
    // TODO: implement bookmarkFolderList
    throw UnimplementedError();
  }

  @override
  CommentList commentList(CommentsQuery query) {
    // TODO: implement commentList
    throw UnimplementedError();
  }

  @override
  ActivityCommentList activityCommentList(ActivityCommentsQuery query) {
    // TODO: implement activityCommentList
    throw UnimplementedError();
  }

  @override
  CommentReplyList commentReplyList(CommentRepliesQuery query) {
    // TODO: implement commentReplyList
    throw UnimplementedError();
  }

  @override
  CommentReactionList commentReactionList(CommentReactionsQuery query) {
    // TODO: implement commentReactionList
    throw UnimplementedError();
  }

  @override
  MemberList memberList(MembersQuery query) {
    // TODO: implement memberList
    throw UnimplementedError();
  }

  @override
  PollVoteList pollVoteList(PollVotesQuery query) {
    // TODO: implement pollVoteList
    throw UnimplementedError();
  }

  @override
  PollList pollList(PollsQuery query) {
    // TODO: implement pollList
    throw UnimplementedError();
  }

  @override
  ModerationConfigList moderationConfigList(ModerationConfigsQuery query) {
    // TODO: implement moderationConfigList
    throw UnimplementedError();
  }

  @override
  Future<Result<AppData>> getApp() {
    // TODO: implement getApp
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteFile(String url) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteImage(String url) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}

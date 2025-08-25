import 'dart:async';

import 'package:stream_core/stream_core.dart';

import '../feeds_client.dart';
import '../generated/api/api.dart' as api;
import '../models/app_data.dart';
import '../models/feed_id.dart';
import '../models/feeds_config.dart';
import '../models/push_notifications_config.dart';
import '../repository/activities_repository.dart';
import '../repository/app_repository.dart';
import '../repository/bookmarks_repository.dart';
import '../repository/comments_repository.dart';
import '../repository/devices_repository.dart';
import '../repository/feeds_repository.dart';
import '../repository/moderation_repository.dart';
import '../repository/polls_repository.dart';
import '../state/activity.dart';
import '../state/activity_comment_list.dart';
import '../state/activity_list.dart';
import '../state/activity_reaction_list.dart';
import '../state/bookmark_folder_list.dart';
import '../state/bookmark_list.dart';
import '../state/comment_list.dart';
import '../state/comment_reaction_list.dart';
import '../state/comment_reply_list.dart';
import '../state/feed.dart';
import '../state/feed_list.dart';
import '../state/follow_list.dart';
import '../state/member_list.dart';
import '../state/moderation_config_list.dart';
import '../state/poll_list.dart';
import '../state/poll_vote_list.dart';
import '../state/query/activities_query.dart';
import '../state/query/activity_comments_query.dart';
import '../state/query/activity_reactions_query.dart';
import '../state/query/bookmark_folders_query.dart';
import '../state/query/bookmarks_query.dart';
import '../state/query/comment_reactions_query.dart';
import '../state/query/comment_replies_query.dart';
import '../state/query/comments_query.dart';
import '../state/query/feed_query.dart';
import '../state/query/feeds_query.dart';
import '../state/query/follows_query.dart';
import '../state/query/members_query.dart';
import '../state/query/moderation_configs_query.dart';
import '../state/query/poll_votes_query.dart';
import '../state/query/polls_query.dart';
import '../ws/feeds_ws_event.dart';
import 'endpoint_config.dart';
import 'moderation_client.dart';

class StreamFeedsClientImpl implements StreamFeedsClient {
  StreamFeedsClientImpl({
    required this.apiKey,
    required this.user,
    this.config = const FeedsConfig(),
    TokenProvider? tokenProvider,
    RetryStrategy? retryStrategy,
    NetworkStateProvider? networkStateProvider,
    AppLifecycleStateProvider? appLifecycleStateProvider,
    List<AutomaticReconnectionPolicy>? reconnectionPolicies,
  }) {
    // TODO: Make this configurable
    const endpointConfig = EndpointConfig.production;

    // region Token manager setup

    final userTokenProvider = switch ((user.type, tokenProvider)) {
      (UserType.regular, final provider?) => provider,
      (UserType.regular, null) => throw ArgumentError(
          'TokenProvider must be provided for regular users.',
        ),
      (UserType.anonymous || UserType.guest, _) => TokenProvider.static(
          UserToken.anonymous(userId: user.id),
        ),
    };

    _tokenManager = TokenManager(
      userId: user.id,
      tokenProvider: userTokenProvider,
    );

    // endregion

    // region WebSocket client setup

    _ws = StreamWebSocketClient(
      options: WebSocketOptions(
        url: endpointConfig.wsEndpoint,
        queryParameters: {
          'api_key': apiKey,
          'stream-auth-type': 'jwt',
          'X-Stream-Client': _systemEnvironmentManager.userAgent,
        },
      ),
      messageCodec: const FeedsWsCodec(),
      onConnectionEstablished: _authenticateUser,
    );

    _connectionRecoveryHandler = ConnectionRecoveryHandler(
      client: _ws,
      retryStrategy: retryStrategy,
      networkStateProvider: networkStateProvider,
      appLifecycleStateProvider: appLifecycleStateProvider,
      policies: reconnectionPolicies,
    );

    // endregion

    // region Http client setup

    final connectionIdInterceptor = ConnectionIdInterceptor(() {
      final connectionState = _ws.connectionState;
      if (connectionState.value case Connected(:final healthCheck)) {
        return healthCheck.connectionId;
      }

      return null; // No connection ID available
    });

    final httpClient = StreamCoreHttpClient(
      options: BaseOptions(
        baseUrl: endpointConfig.baseFeedsUrl,
        connectTimeout: const Duration(seconds: 6),
        receiveTimeout: const Duration(seconds: 6),
      ),
    ).apply(
      (client) => client.interceptors.addAll([
        ApiKeyInterceptor(apiKey),
        HeadersInterceptor(_systemEnvironmentManager),
        if (user.type != UserType.anonymous) connectionIdInterceptor,
        AuthInterceptor(client, _tokenManager),
        const ApiErrorInterceptor(),
        LoggingInterceptor(requestHeader: true),
      ]),
    );

    final apiClient = api.DefaultApi(httpClient);

    // endregion

    // region Initialize repositories

    _activitiesRepository = ActivitiesRepository(apiClient);
    _appRepository = AppRepository(apiClient);
    _bookmarksRepository = BookmarksRepository(apiClient);
    _commentsRepository = CommentsRepository(apiClient);
    _devicesRepository = DevicesRepository(apiClient);
    _feedsRepository = FeedsRepository(apiClient);
    _moderationRepository = ModerationRepository(apiClient);
    _pollsRepository = PollsRepository(apiClient);

    moderation = ModerationClient(_moderationRepository);

    // endregion
  }

  final String apiKey;

  @override
  final User user;

  final FeedsConfig config;

  late final TokenManager _tokenManager;
  late final StreamWebSocketClient _ws;
  late final ConnectionRecoveryHandler _connectionRecoveryHandler;

  late final ActivitiesRepository _activitiesRepository;
  late final AppRepository _appRepository;
  late final BookmarksRepository _bookmarksRepository;
  late final CommentsRepository _commentsRepository;
  late final DevicesRepository _devicesRepository;
  late final FeedsRepository _feedsRepository;
  late final ModerationRepository _moderationRepository;
  late final PollsRepository _pollsRepository;

  // TODO: Fill this with correct values
  late final _systemEnvironmentManager = SystemEnvironmentManager(
    environment: const SystemEnvironment(
      sdkName: 'stream-feeds-dart',
      sdkIdentifier: 'dart',
      sdkVersion: '0.1.0',
    ),
  );

  @override
  void updateSystemEnvironment(SystemEnvironment environment) {
    _systemEnvironmentManager.updateEnvironment(environment);
  }

  @override
  late final ModerationClient moderation;

  Future<void> _authenticateUser() async {
    final userToken = await _tokenManager.getToken();

    final connectUserRequest = WsAuthMessageRequest(
      products: const ['feeds'],
      token: userToken.rawValue,
      userDetails: ConnectUserDetailsRequest(
        id: user.id,
        name: user.originalName,
        image: user.imageUrl,
        custom: user.custom,
      ),
    );

    _ws.send(connectUserRequest);
  }

  @override
  EventEmitter get events => _ws.events;

  @override
  ConnectionStateEmitter get connectionState => _ws.connectionState;

  @override
  Future<void> connect() async {
    if (user.type == UserType.guest) {
      throw ArgumentError('Anonymous users cannot connect to the WebSocket.');
    }

    // TODO: Add support for Guest users

    // Connect to the WebSocket
    unawaited(_ws.connect());

    final state = await Future.any([
      connectionState.waitFor<Connected>(),
      connectionState.waitFor<Disconnected>(),
    ]);

    if (state is Disconnected) {
      throw Exception('WebSocket connection failed: $connectionState');
    }
  }

  @override
  Future<void> disconnect() async {
    await _connectionRecoveryHandler.dispose();
    await _ws.disconnect();
  }

  @override
  Feed feedFromQuery(FeedQuery query) {
    return Feed(
      query: query,
      currentUserId: user.id,
      activitiesRepository: _activitiesRepository,
      bookmarksRepository: _bookmarksRepository,
      commentsRepository: _commentsRepository,
      feedsRepository: _feedsRepository,
      pollsRepository: _pollsRepository,
      eventsEmitter: events,
    );
  }

  @override
  FeedList feedList(FeedsQuery query) {
    return FeedList(
      query: query,
      feedsRepository: _feedsRepository,
      eventsEmitter: events,
    );
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
    return CommentList(
      query: query,
      commentsRepository: _commentsRepository,
      eventsEmitter: events,
    );
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
    return MemberList(
      query: query,
      feedsRepository: _feedsRepository,
      eventsEmitter: events,
    );
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
    return ModerationConfigList(
      query: query,
      moderationRepository: _moderationRepository,
      eventsEmitter: events,
    );
  }

  @override
  Future<Result<AppData>> getApp() => _appRepository.getApp();

  @override
  Future<Result<api.ListDevicesResponse>> queryDevices() {
    return _devicesRepository.queryDevices();
  }

  @override
  Future<Result<void>> createDevice(
    String id,
    PushNotificationsProvider pushProvider,
    String pushProviderName,
  ) {
    return _devicesRepository.createDevice(id, pushProvider, pushProviderName);
  }

  @override
  Future<Result<void>> deleteDevice(String id) {
    return _devicesRepository.deleteDevice(id);
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

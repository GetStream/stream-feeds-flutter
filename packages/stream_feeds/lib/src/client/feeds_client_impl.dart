import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stream_core/stream_core.dart';

import '../cdn/cdn_api.dart';
import '../cdn/feeds_cdn_client.dart';
import '../feeds_client.dart';
import '../generated/api/api.dart' as api;
import '../models/activity_data.dart';
import '../models/app_data.dart';
import '../models/batch_follow_data.dart';
import '../models/feed_id.dart';
import '../models/feeds_config.dart';
import '../models/follow_data.dart';
import '../models/model_updates.dart';
import '../models/push_notifications_config.dart';
import '../repository/activities_repository.dart';
import '../repository/app_repository.dart';
import '../repository/bookmarks_repository.dart';
import '../repository/capabilities_repository.dart';
import '../repository/collections_repository.dart';
import '../repository/comments_repository.dart';
import '../repository/devices_repository.dart';
import '../repository/feeds_repository.dart';
import '../repository/guest_repository.dart';
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
import '../state/event/on_activity_added.dart';
import '../state/event/state_update_event.dart';
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

class StreamFeedsClientImpl with Disposable implements StreamFeedsClient {
  StreamFeedsClientImpl({
    required this.apiKey,
    required User user,
    this.config = const FeedsConfig(),
    TokenProvider? tokenProvider,
    RetryStrategy? retryStrategy,
    NetworkStateProvider? networkStateProvider,
    LifecycleStateProvider? lifecycleStateProvider,
    List<AutomaticReconnectionPolicy>? reconnectionPolicies,
    WebSocketProvider? wsProvider,
    api.DefaultApi? feedsRestApi,
  }) : _user = user {
    StreamLogger.configure(config.logConfig);

    // TODO: Make this configurable
    const endpointConfig = EndpointConfig.production;

    // region Token manager setup

    final (userId, userTokenProvider) = switch ((user.type, tokenProvider)) {
      (.regular, final provider?) => (user.id, provider),
      (.regular, null) => throw ArgumentError('TokenProvider must be provided for regular users.'),
      (.anonymous || .guest, _) => (User.anonymousUserId, TokenProvider.static(.anonymous())),
    };

    _tokenManager = TokenManager(
      userId: userId,
      tokenProvider: userTokenProvider,
    );

    // endregion

    // region WebSocket client setup

    _ws = StreamWebSocketClient(
      tag: 'SF:Ws',
      messageCodec: const FeedsWsCodec(),
      onAuthenticate: _authenticateUser,
      wsProvider: wsProvider,
      optionsBuilder: () => WebSocketOptions(
        url: endpointConfig.wsEndpoint,
        queryParameters: {
          'api_key': apiKey,
          // Feeds only support ws conn for jwt auth
          'stream-auth-type': AuthType.jwt.headerValue,
          'X-Stream-Client': _systemEnvironmentManager.userAgent,
        },
      ),
    );

    _connectionRecoveryHandler = ConnectionRecoveryHandler(
      client: _ws,
      tag: 'SF:WsRecovery',
      retryStrategy: retryStrategy,
      networkStateProvider: networkStateProvider,
      lifecycleStateProvider: lifecycleStateProvider,
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

    final httpClient =
        StreamCoreHttpClient(
          options: BaseOptions(
            baseUrl: endpointConfig.baseFeedsUrl,
            connectTimeout: const Duration(seconds: 6),
            receiveTimeout: const Duration(seconds: 6),
          ),
        ).apply(
          (client) => client.interceptors.addAll([
            ApiKeyInterceptor(apiKey),
            HeadersInterceptor(_systemEnvironmentManager),
            if (user.type != .anonymous) connectionIdInterceptor,
            AuthInterceptor(tag: 'SF:HttpAuth', client, _tokenManager),
            const ApiErrorInterceptor(),
            LoggingInterceptor(tag: 'SF:Http', requestHeader: true),
          ]),
        );

    // endregion

    // region Initialize repositories

    _cdnClient = config.cdnClient ?? FeedsCdnClient(CdnApi(httpClient));
    attachmentUploader = StreamAttachmentUploader(cdn: _cdnClient);

    final feedsApi = feedsRestApi ?? api.DefaultApi(httpClient);

    _activitiesRepository = ActivitiesRepository(feedsApi, attachmentUploader);
    _appRepository = AppRepository(feedsApi);
    _bookmarksRepository = BookmarksRepository(feedsApi);
    _collectionsRepository = CollectionsRepository(feedsApi);
    _commentsRepository = CommentsRepository(feedsApi, attachmentUploader);
    _devicesRepository = DevicesRepository(feedsApi);
    _feedsRepository = FeedsRepository(feedsApi);
    _moderationRepository = ModerationRepository(feedsApi);
    _pollsRepository = PollsRepository(feedsApi);
    _capabilitiesRepository = CapabilitiesRepository(feedsApi);
    _guestRepository = GuestRepository(feedsApi);

    moderation = ModerationClient(_moderationRepository);

    // endregion

    // Map WebSocket events to state update events
    _wsEventToStateMapperSubscription = events.listen((event) {
      final stateEvent = StateUpdateEvent.fromWsEvent(event);
      stateEvent?.let(_stateUpdateEmitter.tryEmit);
    });
  }

  final String apiKey;

  @override
  User get user => _user;
  User _user;

  final FeedsConfig config;

  final _logger = const StreamLogger('SF:Client');

  late final TokenManager _tokenManager;
  late final StreamWebSocketClient _ws;
  late final ConnectionRecoveryHandler _connectionRecoveryHandler;

  late final CdnClient _cdnClient;

  @override
  late final StreamAttachmentUploader attachmentUploader;

  late final ActivitiesRepository _activitiesRepository;
  late final AppRepository _appRepository;
  late final BookmarksRepository _bookmarksRepository;
  late final CollectionsRepository _collectionsRepository;
  late final CommentsRepository _commentsRepository;
  late final DevicesRepository _devicesRepository;
  late final FeedsRepository _feedsRepository;
  late final ModerationRepository _moderationRepository;
  late final PollsRepository _pollsRepository;
  late final CapabilitiesRepository _capabilitiesRepository;
  late final GuestRepository _guestRepository;

  // TODO: Fill this with correct values
  late final _systemEnvironmentManager = SystemEnvironmentManager(
    environment: const SystemEnvironment(
      sdkName: 'stream-feeds-dart',
      sdkIdentifier: 'dart',
      sdkVersion: '0.3.0',
    ),
  );

  @override
  void updateSystemEnvironment(SystemEnvironment environment) {
    _systemEnvironmentManager.updateEnvironment(environment);
  }

  @override
  late final ModerationClient moderation;

  Future<void> _authenticateUser(
    WsRequestSender send,
    StreamApiError? previousError,
  ) async {
    if (previousError?.isTokenExpiredError ?? false) {
      _tokenManager.expireToken();

      if (_tokenManager.usesStaticProvider) {
        throw ClientException(message: 'The token was refused and the provider has no other to give');
      }
    }

    final userToken = await _tokenManager.getToken();
    final connectUserRequest = WsAuthMessageRequest(
      products: const ['feeds'],
      token: userToken.rawValue,
      userDetails: .fromUser(user),
    );

    return send(connectUserRequest).getOrThrow();
  }

  @override
  EventEmitter<WsEvent> get events => _ws.events;

  @override
  EventEmitter<StateUpdateEvent> get stateUpdateEvents => _stateUpdateEmitter;
  late final _stateUpdateEmitter = MutableEventEmitter<StateUpdateEvent>();
  late final StreamSubscription<WsEvent> _wsEventToStateMapperSubscription;

  @override
  ConnectionStateEmitter get connectionState => _ws.connectionState;

  @override
  Future<void> connect({
    bool connectWebSocket = true,
  }) {
    if (isDisposed) {
      throw StateError('Client for ${user.id} has been disposed');
    }

    if (connectionState.value case Connecting() || Authenticating()) {
      throw ClientException(message: 'Connection already in progress for ${user.id}');
    }

    if (connectionState.value case Connected()) {
      throw ClientException(message: 'Connection already available for ${user.id}');
    }

    _logger.d(() => 'connect ${user.id} (${user.type.name}), webSocket: $connectWebSocket');

    return switch (user.type) {
      .guest => _connectGuestUser(connectWebSocket: connectWebSocket),
      .regular || .anonymous => _connectUser(connectWebSocket: connectWebSocket),
    };
  }

  Future<void> _connectGuestUser({
    required bool connectWebSocket,
  }) async {
    assert(user.type == .guest, 'Can only connect as a guest user');

    // Every exchange creates another guest, so one already established is kept.
    if (_tokenManager.userId != user.id) {
      final result = await _guestRepository.createGuest(user);

      // Reported like every other connect failure, with the cause attached.
      final response = result.getOrElse(
        (error, stackTrace) => throw ClientException(
          message: 'Failed to create a guest user',
          error: error,
          stackTrace: stackTrace,
        ),
      );

      final tokenProvider = TokenProvider.static(response.token);

      // The server assigns the id, so adopt it and authenticate as it.
      _logger.d(() => 'guest created, server assigned ${response.user.id}');
      _user = response.user;
      _tokenManager.setTokenProvider(
        response.user.id,
        tokenProvider: tokenProvider,
      );
    }

    return _connectUser(connectWebSocket: connectWebSocket);
  }

  Future<void> _connectUser({
    required bool connectWebSocket,
  }) async {
    // An anonymous user has no token to authenticate a socket with.
    if (!connectWebSocket || user.type == .anonymous) {
      _logger.d(() => 'connected ${user.id} without a socket');
      return;
    }

    _ws.connect().ignore();

    final state = await Future.any([
      connectionState.waitFor<Connected>(),
      connectionState.waitFor<Disconnected>(),
    ]);

    if (state case Disconnected(:final source)) {
      _logger.w(() => 'connect ${user.id} failed: ${source.closeReason}', error: source.cause);
      throw ClientException(message: source.closeReason, error: source.cause);
    }

    _logger.d(() => 'connected ${user.id}');
  }

  @override
  Future<void> disconnect() => _ws.disconnect();

  @override
  Future<void> dispose() async {
    if (isDisposed) return;

    await _wsEventToStateMapperSubscription.cancel();
    await _stateUpdateEmitter.close();

    await _connectionRecoveryHandler.dispose();
    await _ws.dispose();

    _capabilitiesRepository.dispose();

    return super.dispose();
  }

  @override
  Feed feedFromQuery(
    FeedQuery query, {
    OnNewActivity onNewActivity = defaultOnNewActivity,
  }) {
    return Feed(
      query: query,
      currentUserId: user.id,
      onNewActivity: onNewActivity,
      activitiesRepository: _activitiesRepository,
      bookmarksRepository: _bookmarksRepository,
      commentsRepository: _commentsRepository,
      feedsRepository: _feedsRepository,
      pollsRepository: _pollsRepository,
      capabilitiesRepository: _capabilitiesRepository,
      onReconnectEmitter: onReconnectEmitter,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  FeedList feedList(FeedsQuery query) {
    return FeedList(
      query: query,
      feedsRepository: _feedsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  FollowList followList(FollowsQuery query) {
    return FollowList(
      query: query,
      feedsRepository: _feedsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  Activity activity({
    required String activityId,
    required FeedId fid,
    ActivityData? initialData,
  }) {
    return Activity(
      fid: fid,
      activityId: activityId,
      currentUserId: user.id,
      initialActivityData: initialData,
      activitiesRepository: _activitiesRepository,
      commentsRepository: _commentsRepository,
      pollsRepository: _pollsRepository,
      capabilitiesRepository: _capabilitiesRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  ActivityList activityList(ActivitiesQuery query) {
    return ActivityList(
      query: query,
      currentUserId: user.id,
      activitiesRepository: _activitiesRepository,
      capabilitiesRepository: _capabilitiesRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  Future<Result<List<ActivityData>>> upsertActivities({
    required List<api.ActivityRequest> activities,
  }) {
    return _activitiesRepository.upsertActivities(activities);
  }

  @override
  Future<Result<api.DeleteActivitiesResponse>> deleteActivities({
    required List<String> ids,
    bool? hardDelete,
  }) {
    return _activitiesRepository.deleteActivities(
      deleteActivitiesRequest: api.DeleteActivitiesRequest(
        ids: ids,
        hardDelete: hardDelete,
      ),
    );
  }

  @override
  ActivityReactionList activityReactionList(ActivityReactionsQuery query) {
    return ActivityReactionList(
      query: query,
      activitiesRepository: _activitiesRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  BookmarkList bookmarkList(BookmarksQuery query) {
    return BookmarkList(
      query: query,
      bookmarksRepository: _bookmarksRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  BookmarkFolderList bookmarkFolderList(BookmarkFoldersQuery query) {
    return BookmarkFolderList(
      query: query,
      bookmarksRepository: _bookmarksRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  CommentList commentList(CommentsQuery query) {
    return CommentList(
      query: query,
      currentUserId: user.id,
      commentsRepository: _commentsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  ActivityCommentList activityCommentList(ActivityCommentsQuery query) {
    return ActivityCommentList(
      query: query,
      currentUserId: user.id,
      commentsRepository: _commentsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  CommentReplyList commentReplyList(CommentRepliesQuery query) {
    return CommentReplyList(
      query: query,
      currentUserId: user.id,
      commentsRepository: _commentsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  CommentReactionList commentReactionList(CommentReactionsQuery query) {
    return CommentReactionList(
      query: query,
      commentsRepository: _commentsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  MemberList memberList(MembersQuery query) {
    return MemberList(
      query: query,
      feedsRepository: _feedsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  PollVoteList pollVoteList(PollVotesQuery query) {
    return PollVoteList(
      query: query,
      pollsRepository: _pollsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  PollList pollList(PollsQuery query) {
    return PollList(
      query: query,
      currentUserId: user.id,
      pollsRepository: _pollsRepository,
      eventsEmitter: _stateUpdateEmitter,
    );
  }

  @override
  ModerationConfigList moderationConfigList(ModerationConfigsQuery query) {
    return ModerationConfigList(
      query: query,
      moderationRepository: _moderationRepository,
    );
  }

  @override
  Future<Result<AppData>> getApp() => _appRepository.getApp();

  @override
  Future<Result<api.ListDevicesResponse>> queryDevices() {
    return _devicesRepository.queryDevices();
  }

  @override
  Future<Result<void>> createDevice({
    required String id,
    required PushNotificationsProvider pushProvider,
    required String pushProviderName,
  }) {
    return _devicesRepository.createDevice(
      id,
      pushProvider,
      pushProviderName,
    );
  }

  @override
  Future<Result<void>> deleteDevice({required String id}) {
    return _devicesRepository.deleteDevice(id);
  }

  @override
  Future<Result<void>> deleteFile({required String url}) {
    return _cdnClient.deleteFile(url);
  }

  @override
  Future<Result<void>> deleteImage({required String url}) {
    return _cdnClient.deleteImage(url);
  }

  @override
  Future<Result<BatchFollowData>> getOrCreateFollows(
    api.FollowBatchRequest request,
  ) async {
    final result = await _feedsRepository.getOrCreateFollows(request);

    result.onSuccess((data) {
      final createdIds = data.created.map((f) => f.id).toSet();
      final updates = ModelUpdates<FollowData>(
        added: data.created,
        updated: data.follows.where((f) => !createdIds.contains(f.id)).toList(),
      );

      _stateUpdateEmitter.tryEmit(FollowBatchUpdate(updates: updates));
    });

    return result;
  }

  @override
  Future<Result<List<FollowData>>> getOrCreateUnfollows(
    api.UnfollowBatchRequest request,
  ) async {
    final result = await _feedsRepository.getOrCreateUnfollows(request);

    result.onSuccess((data) {
      final updates = ModelUpdates<FollowData>(
        removedIds: data.map((f) => f.id).toSet(),
      );

      _stateUpdateEmitter.tryEmit(FollowBatchUpdate(updates: updates));
    });

    return result;
  }

  @override
  Future<Result<api.ReadCollectionsResponse>> readCollections({
    required List<String> refs,
  }) {
    return _collectionsRepository.readCollections(refs: refs);
  }

  @override
  Future<Result<api.CreateCollectionsResponse>> createCollections({
    required api.CreateCollectionsRequest request,
  }) {
    return _collectionsRepository.createCollections(request: request);
  }

  @override
  Future<Result<api.UpdateCollectionsResponse>> updateCollections({
    required api.UpdateCollectionsRequest request,
  }) {
    return _collectionsRepository.updateCollections(request: request);
  }

  @override
  Future<Result<api.DeleteCollectionsResponse>> deleteCollections({
    required List<String> refs,
  }) {
    return _collectionsRepository.deleteCollections(refs: refs);
  }

  Stream<void> get onReconnectEmitter {
    return connectionState
        .scan(
          (state, connectionStatus, i) => switch (connectionStatus) {
            Initialized() || Connecting() => (
              wasDisconnected: state.wasDisconnected,
              reconnected: false,
            ),
            Disconnecting() || Disconnected() => (
              wasDisconnected: true,
              reconnected: false,
            ),
            Connected() => (
              wasDisconnected: false,
              reconnected: state.wasDisconnected,
            ),
            _ => state,
          },
          (wasDisconnected: false, reconnected: false),
        )
        .mapNotNull((state) => state.reconnected ? () : null);
  }
}

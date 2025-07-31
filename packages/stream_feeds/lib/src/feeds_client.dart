import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:stream_core/stream_core.dart';
import 'package:uuid/uuid.dart';

import '../stream_feeds.dart';
import 'generated/api/api.g.dart' as api;
import 'repositories.dart';
import 'utils/endpoint_config.dart';
import 'ws/feeds_ws_event.dart';

class FeedsClient {
  FeedsClient({
    required this.apiKey,
    required this.user,
    required this.userToken,
    this.config = const FeedsConfig(),
    this.userTokenProvider,
    this.networkMonitor,
  }) {
    apiClient = api.DefaultApi(
      api.ApiClient(
        basePath: endpointConfig.baseFeedsUrl,
        authentication: _Authentication(
          apiKey: apiKey,
          user: user,
          getToken: () async => userToken,
          getConnectionId: () => webSocketClient?.connectionId,
        ),
      ),
    );
    final websocketUri = Uri.parse(endpointConfig.wsEndpoint).replace(
      queryParameters: <String, String>{
        'api_key': apiKey,
        'stream-auth-type': 'jwt',
        'X-Stream-Client': 'stream-feeds-dart',
      },
    );

    webSocketClient = WebSocketClient(
      url: websocketUri.toString(),
      eventDecoder: FeedsWsEvent.fromEventObject,
      onConnectionEstablished: _authenticate,
    );

    feedsRepository = FeedsRepository(apiClient: apiClient);
  }

  final String apiKey;
  final User user;
  final String userToken;
  final FeedsConfig config;
  final UserTokenProvider? userTokenProvider;
  final NetworkMonitor? networkMonitor;

  late final api.DefaultApi apiClient;
  late final FeedsRepository feedsRepository;

  static final endpointConfig = EndpointConfig.production;
  late final WebSocketClient webSocketClient;
  ConnectionRecoveryHandler? connectionRecoveryHandler;
  Stream<FeedsWsEvent> get feedsEvents =>
      webSocketClient.events.asStream().whereType<FeedsWsEvent>();

  Completer<void>? _connectionCompleter;
  StreamSubscription<WebSocketConnectionState>? _connectionSubscription;

  /// Connects to the feeds websocket.
  /// Future will complete when the connection is established and the user is authenticated.
  /// If the authentication fails, the future will complete with an error.
  Future<void> connect() async {
    webSocketClient.connect();

    _connectionSubscription = webSocketClient!.connectionStateStream
        .listen(_onConnectionStateChanged);

    connectionRecoveryHandler = DefaultConnectionRecoveryHandler(
      client: webSocketClient,
      networkMonitor: networkMonitor,
    );

    _connectionCompleter = Completer<void>();
    return _connectionCompleter!.future;
  }

  /// Disconnects from the feeds websocket.
  /// The FeedsClient should no longer be used after calling this method.
  void disconnect() {
    connectionRecoveryHandler?.dispose();
    webSocketClient.disconnect();
    _connectionSubscription?.cancel();
    _connectionCompleter?.complete();
    _connectionCompleter = null;
  }

  void _onConnectionStateChanged(WebSocketConnectionState state) {
    if (_connectionCompleter != null) {
      if (state is Connected) {
        _connectionCompleter!.complete();
        _connectionCompleter = null;
      }
      if (state is Disconnected) {
        _connectionCompleter!.completeError(Exception('Connection failed'));
        _connectionCompleter = null;
      }
    }
  }

  void _authenticate() {
    final connectUserRequest = WsAuthMessageRequest(
      products: ['feeds'],
      token: userToken,
      userDetails: ConnectUserDetailsRequest(
        id: user.id,
        name: user.originalName,
        image: user.imageUrl,
        customData: user.customData,
      ),
    );

    webSocketClient.send(connectUserRequest);
  }

  /// Creates a feed instance based on the provided query.
  ///
  /// This method creates a [Feed] object using a [FeedQuery] that can include additional
  /// configuration such as activity filters, limits, and feed data for creation.
  ///
  /// - Parameter query: The feed query containing the feed identifier and optional configuration
  /// - Returns: A [Feed] instance that can be used to interact with the specified feed
  Feed feed({required FeedQuery query}) {
    return Feed(query: query, client: this);
  }
}

class FeedsConfig {
  const FeedsConfig();
  // TODO: Add config for feeds
}

typedef ConnectionIdProvider = String? Function();
typedef UserTokenProvider = Future<String> Function();

// TODO: Migrate the API to dio for authentication and refresh of user tokens
class _Authentication extends api.Authentication {
  _Authentication({
    required this.apiKey,
    required this.user,
    required this.getToken,
    required this.getConnectionId,
  });

  final String apiKey;
  final User user;
  final UserTokenProvider getToken;
  final ConnectionIdProvider getConnectionId;

  @override
  Future<void> applyToParams(
    List<api.QueryParam> queryParams,
    Map<String, String> headerParams,
  ) async {
    queryParams.add(api.QueryParam('api_key', apiKey));
    final connectionId = getConnectionId();
    final userToken = await getToken();
    switch (user.type) {
      case UserAuthType.regular || UserAuthType.guest:
        if (connectionId != null) {
          queryParams.add(api.QueryParam('connection_id', connectionId));
        }
        headerParams['stream-auth-type'] = 'jwt';
        headerParams['Authorization'] = userToken;
      case UserAuthType.anonymous:
        headerParams['stream-auth-type'] = 'anonymous';
        if (userToken.isNotEmpty) {
          headerParams['Authorization'] = userToken;
        }
    }
    headerParams['X-Stream-Client'] = 'stream-feeds-dart';
    headerParams['x-client-request-id'] = const Uuid().v4();
  }
}

import 'package:stream_core/src/user/user.dart';
import 'package:uuid/uuid.dart';

import '../stream_feeds.dart';
import 'generated/api/api.g.dart' as api;
import 'repositories.dart';

class FeedsClient {
  FeedsClient({
    required this.apiKey,
    required this.user,
    required this.userToken,
    this.config = const FeedsConfig(),
    this.userTokenProvider,
  }) {
    apiClient = api.DefaultApi(
      api.ApiClient(
        authentication: _Authentication(
          apiKey: apiKey,
          user: user,
          getToken: () async => userToken,
          getConnectionId: () => null,
        ),
      ),
    );
    feedsRepository = FeedsRepository(apiClient: apiClient);
  }

  final String apiKey;
  final User user;
  final String userToken;
  final FeedsConfig config;
  final UserTokenProvider? userTokenProvider;

  late final api.DefaultApi apiClient;
  late final FeedsRepository feedsRepository;

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

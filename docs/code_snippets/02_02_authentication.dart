import 'package:stream_feeds/stream_feeds.dart';

Future<void> regularUserLogin() async {
  // Regular user: provide a JWT token (from your server).
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
  );
  await client.connect();
}

Future<void> dynamicTokenProvider() async {
  // Dynamic token provider: fetches a new token from your server
  // when the current one expires.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.dynamic((userId) async {
      // Fetch a fresh JWT for `userId` from your backend.
      final token = await fetchTokenFromYourServer(userId);
      return UserToken(token);
    }),
  );
  await client.connect();
}

// Placeholder for your server token fetch
Future<String> fetchTokenFromYourServer(String userId) async => '<jwt>';

Future<void> guestUserLogin() async {
  // Guest user: the SDK obtains a temporary token during connect, so no
  // tokenProvider is needed. The session is temporary and is not tied to a
  // persistent account.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: User.guest('guest-${DateTime.now().millisecondsSinceEpoch}'),
  );
  await client.connect();

  // The server assigns the guest its own id, so read it from `client.user`
  // rather than reusing the id you asked for.
  final feed = client.feed(group: 'user', id: client.user.id);
  await feed.getOrCreate();
}

Future<void> anonymousUserLogin() async {
  // Anonymous user: no token of its own and no WebSocket connection. Use it to
  // read public feeds. Calling connect() is not required, and opens no
  // connection for an anonymous user.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User.anonymous(),
  );

  // Watching requires a connection, so ask for a feed that is not watched.
  final feed = client.feedFromQuery(
    const FeedQuery(
      fid: FeedId(group: 'user', id: 'alice'),
      watch: false,
    ),
  );
  await feed.getOrCreate();
}

Future<void> requestOnlyLogin() async {
  // Authenticate without opening a WebSocket, for a client that only makes
  // requests. No events are emitted, and a watched query is rejected because
  // watching requires a connection.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'alice'),
    tokenProvider: TokenProvider.static(UserToken('<your_jwt_token>')),
  );
  await client.connect(connectWebSocket: false);

  final feed = client.feedFromQuery(
    const FeedQuery(
      fid: FeedId(group: 'user', id: 'alice'),
      watch: false,
    ),
  );
  await feed.getOrCreate();
}

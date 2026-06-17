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
  // Guest user: the SDK automatically calls POST /api/v2/guest to obtain
  // a temporary JWT — no tokenProvider is needed.
  // Guest users have full read/write access and a real WebSocket connection,
  // but their session is temporary and not tied to a persistent account.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: User.guest('guest-${DateTime.now().millisecondsSinceEpoch}'),
  );
  await client.connect(); // Guest JWT is fetched automatically on connect.

  final feed = client.feed(group: 'user', id: client.user.id);
  await feed.getOrCreate();
}

Future<void> anonymousUserLogin() async {
  // Anonymous user: read-only access with no JWT or WebSocket connection.
  // Use this for public feeds that don't require authentication.
  // Note: calling connect() throws for anonymous users.
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User.anonymous(),
  );

  // Read public feed data without connecting.
  final feed = client.feed(group: 'user', id: 'alice');
  await feed.getOrCreate();
}

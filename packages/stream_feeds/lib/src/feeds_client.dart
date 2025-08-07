import 'package:stream_core/stream_core.dart';

import '../stream_feeds.dart';
import 'internal_feeds_client.dart';

abstract interface class FeedsClient {
  factory FeedsClient({
    required String apiKey,
    required User user,
    String? userToken,
    TokenProvider? userTokenProvider,
    FeedsConfig config = const FeedsConfig(),
  }) =>
      InternalFeedsClient(
        apiKey: apiKey,
        user: user,
        userToken: userToken,
        userTokenProvider: userTokenProvider,
        config: config,
      );

  /// Connects to the feeds websocket.
  /// Future will complete when the connection is established and the user is authenticated.
  /// If the authentication fails, the future will complete with an error.
  Future<void> connect();

  /// Disconnects from the feeds websocket.
  void disconnect();

  /// Disposes the FeedsClient.
  /// This should be called when the FeedsClient is no longer needed.
  /// It will disconnect from the websocket and dispose of the client.
  void dispose();

  /// Creates a feed instance based on the provided query.
  ///
  /// This method creates a [Feed] object using a [FeedQuery] that can include additional
  /// configuration such as activity filters, limits, and feed data for creation.
  ///
  /// - Parameter query: The feed query containing the feed identifier and optional configuration
  /// - Returns: A [Feed] instance that can be used to interact with the specified feed
  Feed feed({required FeedQuery query});
}

class FeedsConfig {
  const FeedsConfig({
    this.networkMonitor,
  });

  final NetworkMonitor? networkMonitor;
}

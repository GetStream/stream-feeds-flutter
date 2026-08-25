import 'package:stream_core/stream_core.dart';

import 'push_notifications_config.dart';

/// Configuration settings for the Stream Feeds SDK.
///
/// Contains global configuration options including push notifications
/// and other SDK-wide settings.
class FeedsConfig {
  const FeedsConfig({
    this.cdnClient,
    this.pushNotificationsConfig,
    this.customHeaders,
  });

  final CdnClient? cdnClient;

  final PushNotificationsConfig? pushNotificationsConfig;

  /// Custom headers sent along with every API request.
  ///
  /// Useful for passing extra request context to the backend, for example
  /// `x-stream-ext` which is surfaced as `request_info.ext` in webhooks:
  ///
  /// ```dart
  /// final client = StreamFeedsClient(
  ///   apiKey: 'your-api-key',
  ///   user: user,
  ///   userTokenProvider: tokenProvider,
  ///   config: const FeedsConfig(
  ///     customHeaders: {'x-stream-ext': 'my-value'},
  ///   ),
  /// );
  /// ```
  ///
  /// These cannot be used to overwrite the SDK's internal headers
  /// (`api_key`, `Authorization`, `stream-auth-type` and `X-Stream-Client`) —
  /// those are always applied last and take precedence.
  ///
  /// Applies to HTTP requests only, not to the WebSocket connection.
  final Map<String, String>? customHeaders;
}

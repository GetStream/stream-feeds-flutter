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
    this.logConfig,
  });

  final CdnClient? cdnClient;

  final PushNotificationsConfig? pushNotificationsConfig;

  /// How much the client reports, and where those records go.
  ///
  /// Left out, the client touches no logger at all — the one every Stream SDK in the process
  /// shares stays as whatever configured it, or silent if nothing did.
  final StreamLogConfig? logConfig;
}

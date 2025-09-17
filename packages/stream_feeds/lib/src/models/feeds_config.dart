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
  });

  final CdnClient? cdnClient;

  final PushNotificationsConfig? pushNotificationsConfig;
}

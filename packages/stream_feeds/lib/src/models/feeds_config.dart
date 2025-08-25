import 'push_notifications_config.dart';

/// Configuration settings for the Stream Feeds SDK.
///
/// Contains global configuration options including push notifications
/// and other SDK-wide settings.
class FeedsConfig {
  const FeedsConfig({
    this.pushNotificationsConfig,
  });

  // TODO: Add CDN client
  // final FileUploader fileUploader;

  final PushNotificationsConfig? pushNotificationsConfig;
}

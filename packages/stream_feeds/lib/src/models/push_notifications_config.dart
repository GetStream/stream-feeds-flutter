import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'push_notifications_config.freezed.dart';

/// Push notification configuration settings.
///
/// Contains provider information and settings for configuring push
/// notifications in the Stream Feeds system.
@freezed
class PushNotificationsConfig with _$PushNotificationsConfig {
  /// Creates a new [PushNotificationsConfig] instance.
  const PushNotificationsConfig({
    required this.pushProviderInfo,
  });

  /// Config for regular push notifications.
  @override
  final PushProviderInfo pushProviderInfo;
}

/// Information about the push provider.
@freezed
class PushProviderInfo with _$PushProviderInfo {
  /// Creates a new [PushProviderInfo] instance.
  const PushProviderInfo({
    required this.name,
    required this.pushProvider,
  });

  /// The name of the push provider.
  @override
  final String name;

  /// The push provider type.
  @override
  final PushNotificationsProvider pushProvider;
}

/// Supported push notification providers.
enum PushNotificationsProvider {
  /// Firebase Cloud Messaging provider.
  firebase('firebase'),

  /// Apple Push Notification service provider.
  apn('apn'),

  /// Huawei Push Kit provider.
  huawei('huawei'),

  /// Xiaomi Push service provider.
  xiaomi('xiaomi');

  const PushNotificationsProvider(this.value);

  /// The string value of the push provider.
  final String value;

  @override
  String toString() => value;
}

/// Converts a [PushNotificationsProvider] to a [CreateDeviceRequestPushProvider] request model.
extension PushNotificationsProviderMapper on PushNotificationsProvider {
  /// Converts this push notification provider to an API enum.
  CreateDeviceRequestPushProvider toRequest() {
    return switch (this) {
      PushNotificationsProvider.firebase =>
        CreateDeviceRequestPushProvider.firebase,
      PushNotificationsProvider.apn => CreateDeviceRequestPushProvider.apn,
      PushNotificationsProvider.huawei =>
        CreateDeviceRequestPushProvider.huawei,
      PushNotificationsProvider.xiaomi =>
        CreateDeviceRequestPushProvider.xiaomi,
    };
  }
}

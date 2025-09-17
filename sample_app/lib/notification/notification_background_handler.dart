import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:stream_feeds/stream_feeds.dart';

import '../core/di/di_initializer.dart';
import 'notification.dart';
import 'notification_service.dart';

/// Background message handler for Firebase Cloud Messaging.
///
/// This function is called when the app receives a push notification
/// while running in the background or when terminated.
///
/// Note: This must be a top-level function (not a class method).
@pragma('vm:entry-point')
Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  // Background message handling is only needed for Android due to default
  // data only message template from backend.
  if (!CurrentPlatform.isAndroid) return;

  final messageData = message.data;
  // If there's no data payload, there's nothing to process
  if (messageData.isEmpty) return;

  final notification = FeedsNotification.fromJson(messageData);
  // Only handle notifications sent from Stream Feeds
  if (notification.sender != 'stream.feeds') return;

  debugPrint('📨 Background message received: ${notification.type}');
  debugPrint('📨 Title: ${notification.title}');
  debugPrint('📨 Body: ${notification.body}');

  await initDI(); // Ensure dependencies are initialized

  final notificationService = locator<NotificationService>();
  final isInitialized = await notificationService.initLocalNotifications();
  if (!isInitialized) return;

  // Show a local notification for the received push notification
  await notificationService.showLocalNotification(notification);

  return resetDI(); // Reset dependencies after handling
}

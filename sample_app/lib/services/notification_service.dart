// ignore_for_file: join_return_with_assignment

import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart' hide Priority;

import '../core/di/app_module.dart';

/// Background message handler for Firebase Cloud Messaging.
///
/// This function is called when the app receives a push notification
/// while running in the background or when terminated.
///
/// Note: This must be a top-level function (not a class method).
@pragma('vm:entry-point')
Future<void> _onBackgroundMessageHandler(RemoteMessage message) async {
  debugPrint('📨 Background message received: ${message.messageId}');
  debugPrint('📨 Title: ${message.notification?.title}');
  debugPrint('📨 Body: ${message.notification?.body}');
  debugPrint('📨 Data: ${message.data}');

  // Here you can process the notification data and perform background tasks
  // such as updating local storage, showing local notifications, etc.
}

@singleton
class NotificationService extends Disposable {
  NotificationService(this._localNotification);
  final LocalNotification _localNotification;

  Future<Result<bool>> requestPermission() async {
    final result = await runSafely(
      () => FirebaseMessaging.instance.requestPermission(),
    );

    return result.map((it) {
      var enabled = it.authorizationStatus == AuthorizationStatus.authorized;
      enabled |= it.authorizationStatus == AuthorizationStatus.provisional;

      return enabled;
    });
  }

  Future<Result<void>> clearNotifications() {
    return runSafely(_localNotification.cancelAll);
  }

  Future<void> cancelNotification(int id) {
    return _localNotification.cancel(id);
  }

  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedSubscription;

  /// Sets up message handlers for foreground and background messages.
  Future<void> setupMessageHandlers() async {
    // Setup background message handler
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessageHandler);

    // Handle foreground messages
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );

    // Handle notification taps when app is in background
    _onMessageOpenedSubscription = FirebaseMessaging.onMessageOpenedApp.listen(
      _handleBackgroundTap,
    );

    // Handle initial message when app is launched from terminated state
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage == null) return;

    return _handleBackgroundTap(initialMessage);
  }

  // Handles FCM messages received while app is in foreground.
  Future<Result<void>> _handleForegroundMessage(RemoteMessage message) async {
    print('📱 Foreground message received: ${message.messageId}');
    debugPrint('📱 Foreground message received: ${message.messageId}');
    debugPrint('📱 Title: ${message.notification?.title}');
    debugPrint('📱 Body: ${message.notification?.body}');

    // Show local notification for foreground messages
    return _showLocalNotification(message);
  }

  // Handles notification taps when app is in background or terminated.
  void _handleBackgroundTap(RemoteMessage message) {
    debugPrint('🔔 Background notification tapped: ${message.messageId}');
    debugPrint('🔔 Data: ${message.data}');

    // Handle navigation based on notification data
    _handleNotificationNavigation(message.data);
  }

  void _handleNotificationNavigation(Map<String, dynamic> data) {
    // TODO: Implement actual navigation logic
  }

  void _onNotificationTapped(NotificationResponse response) {
    debugPrint('🔔 Local notification tapped: ${response.id}');
    debugPrint('🔔 Payload: ${response.payload}');

    // TODO: Parse payload and handle navigation
  }

  Future<Result<void>> _showLocalNotification(RemoteMessage message) {
    return runSafely(() async {
      final notification = message.notification;
      if (notification == null) return;

      const androidDetails = AndroidNotificationDetails(
        'stream_feeds_channel',
        'Stream Feeds Notifications',
        channelDescription: 'Notifications for Stream Feeds',
        importance: Importance.high,
        priority: Priority.high,
        // icon: '@drawable/ic_notification',
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const notificationDetails = NotificationDetails(
        iOS: iosDetails,
        android: androidDetails,
      );

      return _localNotification.show(
        message.hashCode,
        notification.title,
        notification.body,
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    });
  }

  @override
  @disposeMethod
  FutureOr<void> dispose() {
    _onMessageSubscription?.cancel();
    _onMessageOpenedSubscription?.cancel();
    return super.dispose();
  }
}

///// Initializes local notifications with platform-specific settings.
//   Future<void> _initializeLocalNotifications() async {
//     const androidSettings = AndroidInitializationSettings(
//       '@drawable/ic_notification',
//     );
//
//     const iosSettings = DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );
//
//     const initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//
//     await _localNotifications.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: _onNotificationTapped,
//     );
//
//     // Create notification channel for Android
//     if (Platform.isAndroid) {
//       await _createNotificationChannel();
//     }
//   }
//
//   /// Creates notification channel for Android.
//   Future<void> _createNotificationChannel() async {
//     const channel = AndroidNotificationChannel(
//       'stream_feeds_channel',
//       'Stream Feeds Notifications',
//       description:
//           'Notifications for Stream Feeds activities, comments, and reactions',
//       importance: Importance.high,
//       enableVibration: true,
//       playSound: true,
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }
//
//   /// Sets up FCM message handlers for foreground and background.
//   Future<void> _setupFCMHandlers() async {
//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
//
//     // Handle notification taps when app is in background
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       _handleBackgroundNotificationTap,
//     );
//
//     // Handle initial message when app is launched from terminated state
//     final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage == null) return;
//
//     return _handleBackgroundNotificationTap(initialMessage);
//   }
//
//   /// Handles FCM messages received while app is in foreground.
//   Future<void> _handleForegroundMessage(RemoteMessage message) async {
//     if (kDebugMode) {
//       print('📱 Foreground message received: ${message.messageId}');
//       print('📱 Title: ${message.notification?.title}');
//       print('📱 Body: ${message.notification?.body}');
//     }
//
//     // Show local notification for foreground messages
//     await _showLocalNotification(message);
//   }
//
//   /// Handles notification taps when app is in background or terminated.
//   void _handleBackgroundNotificationTap(RemoteMessage message) {
//     if (kDebugMode) {
//       print('🔔 Background notification tapped: ${message.messageId}');
//       print('🔔 Data: ${message.data}');
//     }
//
//     // Handle navigation based on notification data
//     _handleNotificationNavigation(message.data);
//   }
//
//   /// Handles local notification taps.
//   void _onNotificationTapped(NotificationResponse response) {
//     if (kDebugMode) {
//       print('🔔 Local notification tapped: ${response.id}');
//       print('🔔 Payload: ${response.payload}');
//     }
//
//     // Parse payload and handle navigation
//     if (response.payload != null) {
//       final data = _parseNotificationPayload(response.payload!);
//       _handleNotificationNavigation(data);
//     }
//   }
//
//   /// Shows a local notification for the received FCM message.
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     final notification = message.notification;
//     if (notification == null) return;
//
//     const androidDetails = AndroidNotificationDetails(
//       'stream_feeds_channel',
//       'Stream Feeds Notifications',
//       channelDescription:
//           'Notifications for Stream Feeds activities, comments, and reactions',
//       importance: Importance.high,
//       priority: Priority.high,
//       icon: '@drawable/ic_notification',
//       enableVibration: true,
//       playSound: true,
//     );
//
//     const iosDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//
//     const notificationDetails = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );
//
//     await _localNotifications.show(
//       message.hashCode,
//       notification.title,
//       notification.body,
//       notificationDetails,
//       payload: _createNotificationPayload(message.data),
//     );
//   }
//
//   /// Creates a notification payload from FCM data.
//   String _createNotificationPayload(Map<String, dynamic> data) {
//     // Convert FCM data to a simple string format
//     // In a real app, you might use JSON encoding
//     final entries = data.entries.map((e) => '${e.key}=${e.value}').toList();
//     return entries.join('&');
//   }
//
//   /// Parses notification payload back to data map.
//   Map<String, String> _parseNotificationPayload(String payload) {
//     final data = <String, String>{};
//     final pairs = payload.split('&');
//
//     for (final pair in pairs) {
//       final parts = pair.split('=');
//       if (parts.length == 2) {
//         data[parts[0]] = parts[1];
//       }
//     }
//
//     return data;
//   }
//
//   /// Handles navigation based on notification data.
//   void _handleNotificationNavigation(Map<String, dynamic> data) {
//     // Extract navigation parameters from notification data
//     final type = data['type'] as String?;
//     final feedId = data['feed_id'] as String?;
//     final activityId = data['activity_id'] as String?;
//
//     if (kDebugMode) {
//       print('🧭 Handling navigation for notification type: $type');
//       print('🧭 Feed ID: $feedId, Activity ID: $activityId');
//     }
//
//     // TODO: Implement actual navigation logic
//     // This will be integrated with AutoRoute navigation
//     // Example:
//     // switch (type) {
//     //   case 'activity_added':
//     //     context.router.push(FeedRoute(feedId: feedId));
//     //     break;
//     //   case 'comment_added':
//     //     context.router.push(ActivityRoute(activityId: activityId));
//     //     break;
//     //   // ... other cases
//     // }
//   }
//
//   /// Clears all notifications and resets badge count.
//   Future<void> clearAllNotifications() async {
//     await _localNotifications.cancelAll();
//
//     if (kDebugMode) {
//       print('🧹 All notifications cleared');
//     }
//   }

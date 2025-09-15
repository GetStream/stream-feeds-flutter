// ignore_for_file: join_return_with_assignment

import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feed/stream_feed.dart';

import '../core/di/app_module.dart';
import 'notification.dart';
import 'notification_background_handler.dart';

const notificationChannelId = 'stream_feeds_channel';
const notificationChannelName = 'Stream Feeds Notifications';
const notificationChannelDescription = 'Notifications for Stream Feeds';

@lazySingleton
class NotificationService extends Disposable {
  NotificationService(this._localNotification);
  final LocalNotification _localNotification;

  /// Sets the callback for handling notification taps.
  ///
  /// The [it] will be called whenever a user taps on a notification.
  set onNotificationTap(OnNotificationTap it) => _onNotificationTap = it;
  OnNotificationTap? _onNotificationTap;

  Future<void> initialize() async {
    _registerMessageHandlers();

    await requestPermission();
    await initLocalNotifications();
    await createNotificationChannel();

    final initialMessage = await _getInitialMessage();
    if (initialMessage != null) {
      _onMessageTap(initialMessage, appState: DeviceState.terminated);
    }
  }

  Future<bool> requestPermission() async {
    final result = await FirebaseMessaging.instance.requestPermission();

    var enabled = result.authorizationStatus == AuthorizationStatus.authorized;
    enabled |= result.authorizationStatus == AuthorizationStatus.provisional;

    return enabled;
  }

  var _isLocalNotificationsInitialized = false;
  Future<bool> initLocalNotifications() async {
    if (_isLocalNotificationsInitialized) return true;

    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const androidSettings = AndroidInitializationSettings(
      '@drawable/ic_notification',
    );

    const initSettings = InitializationSettings(
      iOS: iosSettings,
      android: androidSettings,
    );

    final result = await runSafely(
      () => _localNotification.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onBackgroundLocalMessageTap,
      ),
    );

    final isInitialized = result.getOrNull() ?? false;
    _isLocalNotificationsInitialized = isInitialized;

    return isInitialized;
  }

  // Ensures the notification channel is created for Android.
  Future<void> createNotificationChannel() async {
    if (_localNotification.androidPlugin case final androidPlugin?) {
      const channel = AndroidNotificationChannel(
        notificationChannelId,
        notificationChannelName,
        description: notificationChannelDescription,
        importance: Importance.high,
      );

      return androidPlugin.createNotificationChannel(channel);
    }
  }

  Future<void> showLocalNotification(
    FeedsNotification notification,
  ) {
    const androidDetails = AndroidNotificationDetails(
      notificationChannelId,
      notificationChannelName,
      channelDescription: notificationChannelDescription,
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

    final payload = {'data': notification.toJson()};

    return _localNotification.show(
      notification.hashCode,
      notification.title ?? 'New Notification',
      notification.body ?? 'You have a new notification.',
      notificationDetails,
      payload: jsonEncode(payload),
    );
  }

  // region Get Initial Message

  Future<RemoteMessage?> _getInitialMessage() async {
    final messages = await Future.wait([
      _getInitialFcmMessage(),
      _getInitialLocalMessage(),
    ]);

    return messages.firstWhereOrNull((it) => it != null);
  }

  Future<RemoteMessage?> _getInitialFcmMessage() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage == null) return null;

    return initialMessage;
  }

  Future<RemoteMessage?> _getInitialLocalMessage() async {
    final isInitialized = await initLocalNotifications();
    if (!isInitialized) return null;

    final details = await _localNotification.getNotificationAppLaunchDetails();
    if (details == null || !details.didNotificationLaunchApp) return null;

    final response = details.notificationResponse;
    if (response == null) return null;

    final payload = response.payload?.let(jsonDecode);
    if (payload == null) return null;

    return RemoteMessage.fromMap(payload);
  }

  // endregion

  // region Message Handlers

  StreamSubscription<RemoteMessage>? _onMessageSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedSubscription;

  // Registers message handlers for foreground and background messages.
  void _registerMessageHandlers() {
    // Register background message handler
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);

    // Handle foreground messages
    _onMessageSubscription = FirebaseMessaging.onMessage.listen(
      _onForegroundMessage,
    );

    // Handle notification taps when app is in background
    _onMessageOpenedSubscription = FirebaseMessaging.onMessageOpenedApp.listen(
      _onBackgroundMessageTap,
    );
  }

  // Handles messages received while app is in foreground.
  void _onForegroundMessage(RemoteMessage message) {
    final messageData = message.data;
    if (messageData.isEmpty) return;

    final notification = FeedsNotification.fromJson(messageData);
    // Only handle notifications sent from Stream Feeds
    if (notification.sender != 'stream.feeds') return;

    debugPrint('📱 Foreground message received: ${notification.type}');
    debugPrint('📱 Title: ${notification.title}');
    debugPrint('📱 Body: ${notification.body}');

    // Show local notification for foreground messages if needed
  }

  // Handles notification taps when app is in background.
  void _onBackgroundMessageTap(RemoteMessage message) {
    return _onMessageTap(message, appState: DeviceState.background);
  }

  // Handles local notification taps when app is in background.
  void _onBackgroundLocalMessageTap(NotificationResponse response) {
    final payload = response.payload?.let(jsonDecode);
    if (payload == null) return;

    final message = RemoteMessage.fromMap(payload);

    return _onMessageTap(message, appState: DeviceState.background);
  }

  // endregion

  void _onMessageTap(
    RemoteMessage message, {
    required DeviceState appState,
  }) {
    final data = message.data;
    if (data.isEmpty) return;

    final notification = FeedsNotification.fromJson(data);

    final info = NotificationInfo(
      deviceState: appState,
      notification: notification,
    );

    return _onNotificationTap?.call(info);
  }

  Future<void> clearNotifications() => _localNotification.cancelAll();

  @override
  @disposeMethod
  Future<void> dispose() async {
    await _onMessageSubscription?.cancel();
    await _onMessageOpenedSubscription?.cancel();
    return super.dispose();
  }
}

typedef AndroidLocalNotification = AndroidFlutterLocalNotificationsPlugin;

extension on LocalNotification {
  AndroidLocalNotification? get androidPlugin {
    return resolvePlatformSpecificImplementation<AndroidLocalNotification>();
  }
}

typedef OnNotificationTap = void Function(NotificationInfo info);

enum DeviceState { foreground, background, terminated }

class NotificationInfo {
  const NotificationInfo({
    required this.deviceState,
    required this.notification,
  });

  final DeviceState deviceState;
  final FeedsNotification notification;
}

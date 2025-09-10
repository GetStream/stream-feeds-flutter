import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';
import '../../push/push_provider.dart';

/// Alias for easier readability
typedef LocalNotification = FlutterLocalNotificationsPlugin;

@module
abstract class AppModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named('apn')
  PushProvider get iosPush => const PushProvider.apn(name: 'apn');

  @Named('firebase')
  PushProvider get androidPush => const PushProvider.firebase(name: 'firebase');

  @singleton
  @preResolve
  Future<FirebaseApp> get firebaseApp async {
    final options = DefaultFirebaseOptions.currentPlatform;
    return Firebase.initializeApp(options: options);
  }

  @singleton
  LocalNotification get localNotifications => LocalNotification();
}

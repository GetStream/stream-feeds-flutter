import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:stream_feeds/stream_feeds.dart';

/// Signature for a function that creates a [Stream] of push tokens.
typedef TokenStreamProvider = Stream<String> Function();

class PushProvider {
  const PushProvider.firebase({
    required this.name,
    TokenStreamProvider tokenStreamProvider = _firebaseTokenProvider,
  })  : _tokenStreamProvider = tokenStreamProvider,
        type = PushNotificationsProvider.firebase;

  const PushProvider.apn({
    required this.name,
    TokenStreamProvider tokenStreamProvider = _apnTokenProvider,
  })  : _tokenStreamProvider = tokenStreamProvider,
        type = PushNotificationsProvider.apn;

  static Stream<String> _firebaseTokenProvider() async* {
    final initialToken = await FirebaseMessaging.instance.getToken();
    if (initialToken != null && initialToken.isNotEmpty) yield initialToken;

    yield* FirebaseMessaging.instance.onTokenRefresh;
  }

  static Stream<String> _apnTokenProvider() async* {
    final initialToken = await FirebaseMessaging.instance.getAPNSToken();
    if (initialToken != null && initialToken.isNotEmpty) yield initialToken;

    yield* FirebaseMessaging.instance.onTokenRefresh;
  }

  /// The name of the push provider.
  final String name;

  /// The push provider type.
  final PushNotificationsProvider type;

  /// Returns the current push token for the device.
  Future<String> getToken({required Duration timeout}) {
    return onTokenRefresh.first.timeout(timeout);
  }

  /// Emits the current push token for the device and emits a new token
  /// whenever the token is refreshed.
  Stream<String> get onTokenRefresh => _tokenStreamProvider();
  final TokenStreamProvider _tokenStreamProvider;
}

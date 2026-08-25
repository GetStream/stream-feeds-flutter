import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../config/demo_app_config.dart';
import '../../core/models/user_credentials.dart';
import '../../push/push_provider.dart';
import '../../push/push_token_manager.dart';
import '../../services/app_preferences.dart';

const _logger = StreamLogger('App:Auth');

@lazySingleton
class AuthController extends ValueNotifier<AuthState> {
  AuthController(
    this._appPreferences,
    @Named('apn') this._iosPushProvider,
    @Named('firebase') this._androidPushProvider,
    this._networkStateProvider,
    this._lifecycleStateProvider,
  ) : super(const Unauthenticated());

  final AppPreferences _appPreferences;
  final PushProvider _iosPushProvider;
  final PushProvider _androidPushProvider;
  final NetworkStateProvider _networkStateProvider;
  final LifecycleStateProvider _lifecycleStateProvider;

  PushTokenManager? _pushTokenManager;

  Future<void> connect(UserCredentials credentials) async {
    value = const Authenticating();
    _logger.d(() => 'connecting ${credentials.user.id}');

    final token = credentials.token;

    final client = StreamFeedsClient(
      user: credentials.user,
      apiKey: DemoAppConfig.current.apiKey,
      // A guest must be given none: the client obtains its own during `connect()`.
      tokenProvider: token?.let((it) => TokenProvider.static(UserToken(it))),
      networkStateProvider: _networkStateProvider,
      lifecycleStateProvider: _lifecycleStateProvider,
      config: const FeedsConfig(
        logConfig: StreamLogConfig(
          priority: kDebugMode ? .debug : .info,
        ),
      ),
    );

    final result = await runSafely(client.connect);
    result.onSuccess((_) {
      // Stored as it was asked for, so a guest asks again on the next launch.
      _appPreferences.storeUserCredentials(credentials);

      // Initialize the push manager if not already initialized
      _pushTokenManager ??= PushTokenManager(
        client: client,
        iosPushProvider: _iosPushProvider,
        androidPushProvider: _androidPushProvider,
      );

      // Register the device for push notifications
      _pushTokenManager?.registerDevice();
    });

    value = result.fold(
      // The server assigns a guest its id, so the client's user is the one that
      // connected, not the one that was asked for.
      onSuccess: (_) {
        _logger.d(() => 'connected as ${client.user.id}');
        return Authenticated(client.user, client);
      },
      // Reported rather than swallowed: dropping to the user picker with no explanation is the
      // one moment this is worth interrupting for.
      onFailure: (error, stackTrace) {
        _logger.w(
          () => 'could not connect ${credentials.user.id}',
          error: error,
          stackTrace: stackTrace,
        );
        return const Unauthenticated();
      },
    );
  }

  Future<void> disconnect() async {
    final authState = value;
    if (authState is! Authenticated) return;

    final client = authState.client;

    // Unregister the device from push notifications
    _pushTokenManager?.unregisterDevice().ignore();
    _pushTokenManager = null;

    _logger.d(() => 'disconnecting ${client.user.id}');

    // Disposed rather than disconnected: this client is not used again.
    client.dispose().ignore();
    await _appPreferences.clearUserCredentials();

    value = const Unauthenticated();
  }
}

sealed class AuthState {
  const AuthState();
}

final class Authenticated extends AuthState {
  const Authenticated(this.user, this.client);

  final User user;
  final StreamFeedsClient client;
}

final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

final class Authenticating extends AuthState {
  const Authenticating();
}

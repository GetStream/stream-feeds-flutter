import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../config/demo_app_config.dart';
import '../../core/models/user_credentials.dart';
import '../../push/push_provider.dart';
import '../../push/push_token_manager.dart';
import '../../services/app_preferences.dart';

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

    final token = UserToken(credentials.token);

    final client = StreamFeedsClient(
      user: credentials.user,
      apiKey: DemoAppConfig.current.apiKey,
      tokenProvider: TokenProvider.static(token),
      networkStateProvider: _networkStateProvider,
      lifecycleStateProvider: _lifecycleStateProvider,
    );

    final result = await runSafely(client.connect);
    result.onSuccess((_) {
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
      onSuccess: (_) => Authenticated(credentials.user, client),
      onFailure: (_, __) => const Unauthenticated(),
    );
  }

  Future<void> disconnect() async {
    final authState = value;
    if (authState is! Authenticated) return;

    final client = authState.client;

    // Unregister the device from push notifications
    _pushTokenManager?.unregisterDevice().ignore();
    _pushTokenManager = null;

    client.disconnect().ignore();
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

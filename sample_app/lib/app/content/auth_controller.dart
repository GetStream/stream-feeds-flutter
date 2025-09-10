import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feed/stream_feed.dart';

import '../../core/di/di_initializer.dart';
import '../../core/models/user_credentials.dart';
import '../../services/app_preferences.dart';

@lazySingleton
class AuthController extends ValueNotifier<AuthState> {
  AuthController(
    this._appPreferences,
  ) : super(const Unauthenticated());

  final AppPreferences _appPreferences;

  Future<void> connect(UserCredentials credentials) async {
    final client = locator<StreamFeedsClient>(param1: credentials);

    final result = await runSafely(client.connect);
    result.onSuccess((_) => _appPreferences.storeUserCredentials(credentials));

    value = result.fold(
      onSuccess: (_) => Authenticated(credentials.user, client),
      onFailure: (_, __) => const Unauthenticated(),
    );
  }

  Future<void> disconnect() async {
    final authState = value;
    if (authState is! Authenticated) return;

    final client = authState.client;

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

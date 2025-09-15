import 'dart:async';

import 'package:stream_feed/stream_feed.dart';

import 'push_provider.dart';

class PushTokenManager extends Disposable {
  PushTokenManager({
    required this.client,
    required this.iosPushProvider,
    required this.androidPushProvider,
  });

  final StreamFeedsClient client;
  final PushProvider iosPushProvider;
  final PushProvider androidPushProvider;

  StreamSubscription<String>? _tokenSubscription;
  Future<void> _onTokenRefresh(String token, PushProvider provider) async {
    final result = await client.createDevice(
      id: token,
      pushProvider: provider.type,
      pushProviderName: provider.name,
    );

    return result.getOrNull();
  }

  void registerDevice() {
    final pushProvider = switch (CurrentPlatform.type) {
      PlatformType.ios => iosPushProvider,
      PlatformType.android => androidPushProvider,
      _ => null,
    };

    if (pushProvider == null) return;

    _tokenSubscription = pushProvider.onTokenRefresh.listen(
      (token) => _onTokenRefresh(token, pushProvider),
    );
  }

  Future<void> unregisterDevice() async {
    final pushProvider = switch (CurrentPlatform.type) {
      PlatformType.ios => iosPushProvider,
      PlatformType.android => androidPushProvider,
      _ => null,
    };

    if (pushProvider == null) return;

    final tokenResult = await runSafely(
      () => pushProvider.getToken(timeout: const Duration(seconds: 3)),
    );

    final token = tokenResult.getOrNull();
    if (token == null) return;

    final result = await client.deleteDevice(id: token);
    return result.getOrNull();
  }

  @override
  Future<void> dispose() async {
    await _tokenSubscription?.cancel();
    return super.dispose();
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'push_provider.dart';

class PushManager extends Disposable {
  PushManager({
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
    debugPrint('🚀 PushManager - Starting device registration...');
    debugPrint('🚀 PushManager - Platform: ${CurrentPlatform.type}');
    
    final pushProvider = switch (CurrentPlatform.type) {
      PlatformType.ios => iosPushProvider,
      PlatformType.android => androidPushProvider,
      _ => null,
    };

    if (pushProvider == null) {
      debugPrint('❌ PushManager - Cannot register device: unsupported platform');
      return;
    }

    debugPrint('🚀 PushManager - Using provider: ${pushProvider.name} (${pushProvider.type})');
    debugPrint('🚀 PushManager - Starting token stream subscription...');

    _tokenSubscription = pushProvider.onTokenRefresh.listen(
      (token) {
        debugPrint('📱 PushManager - Received token: ${token}');
        _onTokenRefresh(token, pushProvider);
      },
      onError: (error) {
        debugPrint('💥 PushManager - Token stream error: $error');
      },
      onDone: () {
        debugPrint('🔚 PushManager - Token stream completed');
      },
    );
    
    debugPrint('✅ PushManager - Token subscription started');
  }

  Future<void> unregisterDevice() async {
    final pushProvider = switch (CurrentPlatform.type) {
      PlatformType.ios => iosPushProvider,
      PlatformType.android => androidPushProvider,
      _ => null,
    };

    if (pushProvider == null) {
      debugPrint('Cannot unregister device: unsupported platform');
      return;
    }

    final tokenResult = await runSafely(
      () => pushProvider.getToken(timeout: const Duration(seconds: 3)),
    );

    final token = tokenResult.getOrNull();
    if (token == null) {
      debugPrint('No token available to unregister device');
      return;
    }

    final result = await client.deleteDevice(id: token);
    return result.getOrNull();
  }

  @override
  FutureOr<void> dispose() {
    _tokenSubscription?.cancel();
    return super.dispose();
  }
}

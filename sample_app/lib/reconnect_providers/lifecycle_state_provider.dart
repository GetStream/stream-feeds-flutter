import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart';

@LazySingleton(as: LifecycleStateProvider)
class AppLifecycleStateProvider
    with Disposable, WidgetsBindingObserver
    implements LifecycleStateProvider {
  AppLifecycleStateProvider() {
    // Start listening to lifecycle changes.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  LifecycleStateEmitter get state => _state;
  late final _state = MutableStateEmitter(LifecycleState.foreground);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final wasInBackground = _state.value == LifecycleState.background;
    final isInBackground = !_isAppInForeground(state);

    if (wasInBackground && !isInBackground) {
      _state.value = LifecycleState.foreground;
    } else if (!wasInBackground && isInBackground) {
      _state.value = LifecycleState.background;
    }
  }

  bool _isAppInForeground(AppLifecycleState state) {
    return switch (state) {
      AppLifecycleState.resumed || AppLifecycleState.inactive => true,
      _ => false,
    };
  }

  @override
  Future<void> dispose() async {
    await _state.close();
    WidgetsBinding.instance.removeObserver(this);
    return super.dispose();
  }
}

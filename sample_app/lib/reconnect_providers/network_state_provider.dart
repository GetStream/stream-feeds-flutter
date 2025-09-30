import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:stream_feeds/stream_feeds.dart';

@LazySingleton(as: NetworkStateProvider)
final class InternetStateProvider
    with Disposable
    implements NetworkStateProvider {
  InternetStateProvider({
    required InternetConnection checker,
  }) : _checker = checker {
    // Subscribe to the status changes.
    _connectionSubscription = _checker.onStatusChange.listen(_onStatusChange);
  }

  final InternetConnection _checker;

  @override
  NetworkStateEmitter get state => _state;
  late final _state = MutableStateEmitter(NetworkState.unknown);

  StreamSubscription<InternetStatus>? _connectionSubscription;
  void _onStatusChange(InternetStatus status) {
    _state.value = switch (status) {
      InternetStatus.connected => NetworkState.connected,
      InternetStatus.disconnected => NetworkState.disconnected,
    };
  }

  @override
  Future<void> dispose() async {
    await _state.close();
    await _connectionSubscription?.cancel();
    return super.dispose();
  }
}

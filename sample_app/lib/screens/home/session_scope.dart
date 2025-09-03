import 'package:flutter/widgets.dart';
import 'package:stream_feeds/stream_feeds.dart';

class SessionScope extends InheritedWidget {
  const SessionScope({
    super.key,
    required this.user,
    required this.client,
    required super.child,
  });

  final User user;
  final StreamFeedsClient client;

  static SessionScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SessionScope>();
    assert(scope != null, 'No SessionScope found in context');
    return scope!;
  }

  @override
  bool updateShouldNotify(SessionScope oldWidget) {
    // only rebuild dependents if values actually change
    return user != oldWidget.user || client != oldWidget.client;
  }
}

extension SessionScopeExtension on BuildContext {
  User get currentUser => SessionScope.of(this).user;
  StreamFeedsClient get client => SessionScope.of(this).client;
}

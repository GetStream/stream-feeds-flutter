import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../login_screen/demo_app_config.dart';
import '../login_screen/user_credentials.dart';

class AppStateProvider extends ValueNotifier<AppState> {
  AppStateProvider() : super(InitialState());

  late final SharedPreferences _prefs;

  String? get userId {
    if (value is LoggedInState) {
      return (value as LoggedInState).feedsClient.user.id;
    }
    return null;
  }

  bool get isLoggedIn => value is! LoggedOutState;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final userId = _prefs.getString('user_id');
    if (userId != null) {
      final credentials = UserCredentials.credentialsFor(userId);
      await setUser(credentials);
    } else {
      value = LoggedOutState();
    }
  }

  Future<void> setUser(UserCredentials userCredentials) async {
    await _prefs.setString('user_id', userCredentials.user.id);
    value = LoadingState();
    final client = FeedsClient(
      apiKey: DemoAppConfig.current.apiKey,
      user: userCredentials.user,
      userToken: userCredentials.token,
    );
    await client.connect();

    value = LoggedInState(
      feedsClient: client,
    );
  }

  void clearUserId() {
    _prefs.remove('user_id');
    if (value is LoggedInState) {
      (value as LoggedInState).feedsClient.dispose();
    }
    value = LoggedOutState();
  }
}

abstract class AppState {}

class InitialState extends AppState {}

class LoggedOutState extends AppState {}

class LoadingState extends AppState {}

class LoggedInState extends AppState {
  LoggedInState({required this.feedsClient});

  final FeedsClient feedsClient;
}

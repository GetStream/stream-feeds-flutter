import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../config/demo_app_config.dart';
import '../models/user_credentials.dart';

@module
abstract class AppModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @factoryMethod
  StreamFeedsClient feed(@factoryParam UserCredentials credentials) {
    final token = UserToken(credentials.token);

    return StreamFeedsClient(
      user: credentials.user,
      apiKey: DemoAppConfig.current.apiKey,
      tokenProvider: TokenProvider.static(token),
    );
  }
}

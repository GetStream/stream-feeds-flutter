import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../app/content/auth_controller.dart';

@module
abstract class SessionModule {
  @Singleton(scope: 'session')
  StreamFeedsClient authenticatedFeedsClient(AuthController auth) {
    return (auth.value as Authenticated).client;
  }
}

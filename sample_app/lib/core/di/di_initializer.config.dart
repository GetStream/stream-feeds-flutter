// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:stream_feeds/stream_feeds.dart' as _i250;

import '../../app/content/auth_controller.dart' as _i817;
import '../../navigation/app_router.dart' as _i783;
import '../../navigation/guards/auth_guard.dart' as _i253;
import '../../notification/notification_service.dart' as _i902;
import '../../push/push_provider.dart' as _i235;
import '../../services/app_preferences.dart' as _i825;
import 'app_module.dart' as _i460;
import 'session_module.dart' as _i849;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => appModule.firebaseApp,
      preResolve: true,
    );
    gh.lazySingleton<_i460.LocalNotification>(
        () => appModule.localNotifications);
    gh.lazySingleton<_i825.AppPreferences>(
        () => _i825.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.factory<_i235.PushProvider>(
      () => appModule.androidPush,
      instanceName: 'firebase',
    );
    gh.factory<_i235.PushProvider>(
      () => appModule.iosPush,
      instanceName: 'apn',
    );
    gh.lazySingleton<_i902.NotificationService>(
      () => _i902.NotificationService(gh<_i460.LocalNotification>()),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i817.AuthController>(() => _i817.AuthController(
          gh<_i825.AppPreferences>(),
          gh<_i235.PushProvider>(instanceName: 'apn'),
          gh<_i235.PushProvider>(instanceName: 'firebase'),
        ));
    gh.factory<_i253.AuthGuard>(
        () => _i253.AuthGuard(gh<_i817.AuthController>()));
    gh.lazySingleton<_i783.AppRouter>(
        () => _i783.AppRouter(gh<_i253.AuthGuard>()));
    return this;
  }

// initializes the registration of session-scope dependencies inside of GetIt
  _i174.GetIt initSessionScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'session',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        final sessionModule = _$SessionModule();
        gh.lazySingleton<_i250.StreamFeedsClient>(() =>
            sessionModule.authenticatedFeedsClient(gh<_i817.AuthController>()));
      },
    );
  }
}

class _$AppModule extends _i460.AppModule {}

class _$SessionModule extends _i849.SessionModule {}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sample/app/app_state.dart' as _i870;
import 'package:sample/app/content/auth_controller.dart' as _i27;
import 'package:sample/core/di/auth_module.dart' as _i209;
import 'package:sample/core/di/di_module.dart' as _i238;
import 'package:sample/core/models/user_credentials.dart' as _i845;
import 'package:sample/navigation/app_router.dart' as _i701;
import 'package:sample/navigation/guards/auth_guard.dart' as _i1031;
import 'package:sample/services/app_preferences.dart' as _i354;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:stream_feeds/stream_feeds.dart' as _i250;

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
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i870.AppStateNotifier>(() => _i870.AppStateNotifier());
    gh.singleton<_i354.AppPreferences>(
        () => _i354.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i27.AuthController>(
        () => _i27.AuthController(gh<_i354.AppPreferences>()));
    gh.factory<_i1031.AuthGuard>(
        () => _i1031.AuthGuard(gh<_i27.AuthController>()));
    gh.factoryParam<_i250.StreamFeedsClient, _i845.UserCredentials, dynamic>((
      credentials,
      _,
    ) =>
        appModule.feed(credentials));
    gh.lazySingleton<_i701.AppRouter>(
        () => _i701.AppRouter(gh<_i1031.AuthGuard>()));
    return this;
  }

// initializes the registration of session-scope dependencies inside of GetIt
  _i174.GetIt initSessionScope({_i174.ScopeDisposeFunc? dispose}) {
    return _i526.GetItHelper(this).initScope(
      'session',
      dispose: dispose,
      init: (_i526.GetItHelper gh) {
        final sessionModule = _$SessionModule();
        gh.singleton<_i250.StreamFeedsClient>(
            () => sessionModule.authenticatedFeeds(gh<_i27.AuthController>()));
      },
    );
  }
}

class _$AppModule extends _i238.AppModule {}

class _$SessionModule extends _i209.SessionModule {}

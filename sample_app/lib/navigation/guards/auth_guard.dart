import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart' show StreamLogger;

import '../../app/content/auth_controller.dart';
import '../app_router.dart';

const _logger = StreamLogger('App:Nav');

@injectable
class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this._authController);

  final AuthController _authController;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    _logger.d(() => 'auth guard: ${resolver.routeName} while ${_authController.value.runtimeType}');
    final isAuthenticated = _authController.value is Authenticated;
    // If the user is authenticated, allow navigation to the requested route.
    if (isAuthenticated) return resolver.next();

    // If the user is being authenticated, show the splash screen.
    if (_authController.value is Authenticating) {
      resolver.redirectUntil(const AppSplashRoute(), replace: true);
    }

    // Otherwise, redirect to the Choose user page.
    resolver.redirectUntil(const ChooseUserRoute(), replace: true);
  }
}

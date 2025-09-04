import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../app/content/auth_controller.dart';
import '../app_router.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this._authController);

  final AuthController _authController;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = _authController.value is Authenticated;
    // If the user is authenticated, allow navigation to the requested route.
    if (isAuthenticated) return resolver.next();
    // Otherwise, redirect to the Choose user page.
    resolver.redirectUntil(const ChooseUserRoute(), replace: true);
  }
}

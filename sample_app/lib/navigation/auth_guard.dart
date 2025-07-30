import 'package:auto_route/auto_route.dart';

import 'app_router.dart';
import 'app_state.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.appState});

  final AppStateProvider appState;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (appState.isLoggedIn) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirectUntil to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirectUntil(
        const LoginRoute(),
      );
    }
  }
}

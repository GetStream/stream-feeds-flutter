import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.prefs});

  final SharedPreferences prefs;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final userId = prefs.getString('user_id');

    if (userId != null) {
      // if user is authenticated we continue
      resolver.next();
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirectUntil to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirectUntil(
        LoginRoute(
          onResult: (success) {
            // if success == true the navigation will be resumed
            // else it will be aborted
            resolver.next(success);
          },
        ),
      );
    }
  }
}

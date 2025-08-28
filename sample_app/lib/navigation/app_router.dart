import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../screens/choose_user/choose_user_screen.dart';
import '../screens/home/home_screen.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this._authGuard);

  final AuthGuard _authGuard;

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/',
        initial: true,
        page: HomeRoute.page,
        guards: [_authGuard],
      ),
      AutoRoute(
        path: '/choose_user',
        page: ChooseUserRoute.page,
        keepHistory: false,
      ),
    ];
  }
}

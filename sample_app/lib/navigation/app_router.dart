import 'package:auto_route/auto_route.dart';

import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';
import 'app_state.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter({required this.appState});
  final AppStateProvider appState;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          guards: [AuthGuard(appState: appState)],
        ),
        AutoRoute(page: LoginRoute.page),
      ];
}

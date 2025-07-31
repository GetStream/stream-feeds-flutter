import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'navigation/app_router.dart';
import 'navigation/app_state.dart';
import 'widgets/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppStateProvider();
  await appState.init();
  GetIt.instance.registerSingleton(appState);
  runApp(MyApp(appState: appState));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appState});

  final AppStateProvider appState;
  late final AppRouter _router = AppRouter(appState: appState);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: FeedsSampleThemeData.light,
      routerConfig: _router.config(reevaluateListenable: appState),
    );
  }
}

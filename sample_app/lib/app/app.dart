import 'package:flutter/material.dart';

import '../widgets/app_failure.dart';
import '../widgets/app_splash.dart';
import 'app_state.dart';
import 'content/app_content.dart';

class StreamFeedsSampleApp extends StatefulWidget {
  const StreamFeedsSampleApp({super.key});

  @override
  State<StreamFeedsSampleApp> createState() => _StreamFeedsSampleAppState();
}

class _StreamFeedsSampleAppState extends State<StreamFeedsSampleApp> {
  late final _appStateNotifier = AppStateNotifier();

  @override
  void initState() {
    super.initState();
    _appStateNotifier.init();
  }

  @override
  void dispose() {
    _appStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _appStateNotifier,
      builder: (context, state, child) {
        // If there was an error initializing the app, show failure widget.
        if (state is AppStateFailed) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: AppFailure(
              error: state.error,
              stackTrace: state.stackTrace,
            ),
          );
        }

        // If the app is initialized, show the app content.
        if (state is AppStateInitialized) {
          final credentials = state.credentials;
          return StreamFeedsSampleAppContent(credentials: credentials);
        }

        // Otherwise, show splash whilst waiting for initialization
        return const Directionality(
          textDirection: TextDirection.ltr,
          child: AppSplash(),
        );
      },
    );
  }
}

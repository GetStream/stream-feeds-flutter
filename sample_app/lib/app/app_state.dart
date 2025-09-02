import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../core/di/di_initializer.dart';
import '../core/models/user_credentials.dart';
import '../services/app_preferences.dart';

@singleton
class AppStateNotifier extends ValueNotifier<AppState> {
  AppStateNotifier() : super(const AppStateLoading());

  Future<void> init([FutureOr<void> Function()? fn]) async {
    final result = await runSafely(() async {
      // Initialize the dependency injection system
      await initDI();

      await Future<void>.delayed(const Duration(seconds: 3));

      // Ensure all fonts are loaded before rendering the app
      await GoogleFonts.pendingFonts();

      // Invoke additional initialization logic (if any)
      await fn?.call();

      // Load saved user credentials from secure storage (if any)
      final preferences = locator<AppPreferences>();
      return preferences.getUserCredentials();
    });

    value = result.fold(
      onSuccess: AppStateInitialized.new,
      onFailure: AppStateFailed.new,
    );
  }
}

sealed class AppState {
  const AppState();
}

final class AppStateLoading implements AppState {
  const AppStateLoading();
}

final class AppStateInitialized implements AppState {
  const AppStateInitialized(this.credentials);

  final UserCredentials? credentials;
}

final class AppStateFailed implements AppState {
  const AppStateFailed(this.error, this.stackTrace);

  final Object error;
  final StackTrace? stackTrace;
}

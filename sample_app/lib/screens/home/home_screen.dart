import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/content/auth_controller.dart';
import '../../core/di/di_initializer.dart';
import 'session_scope.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = locator<AuthController>();
    final state = authController.value;
    final (user, client) = switch (state) {
      Authenticated(:final user, :final client) => (user, client),
      _ => throw Exception('User not authenticated'),
    };

    return SessionScope(
      user: user,
      client: client,
      child: const AutoRouter(),
    );
  }
}

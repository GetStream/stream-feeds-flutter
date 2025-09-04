import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/di/di_initializer.config.dart';
import '../../core/di/di_initializer.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    locator.initSessionScope();
  }

  @override
  void dispose() {
    locator.popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const AutoRouter();
}

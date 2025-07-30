import 'package:flutter/material.dart';

import 'login_screen/login_screen.dart';
import 'widgets/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FeedsSampleThemeData.light,
      home: const LoginScreen(),
    );
  }
}

// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class FeedsSampleThemeData {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
    ),
    listTileTheme: ListTileThemeData(
      subtitleTextStyle: TextStyle(color: Colors.grey.shade600),
    ),
  );
}

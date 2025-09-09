import 'package:flutter/widgets.dart';

/// Standard responsive breakpoints following Material Design guidelines.
enum Breakpoint {
  /// Compact screens (phones) - 0 to 599dp
  compact,

  /// Medium screens (tablets, small laptops) - 600 to 839dp
  medium,

  /// Expanded screens (large tablets, desktops) - 840dp and up
  expanded;

  /// Gets the current breakpoint for the given width.
  static Breakpoint fromWidth(double width) {
    if (width < 600) return Breakpoint.compact;
    if (width < 840) return Breakpoint.medium;
    return Breakpoint.expanded;
  }

  /// Gets the current breakpoint from context.
  static Breakpoint fromContext(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return fromWidth(width);
  }
}

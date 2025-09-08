import 'package:flutter/material.dart';

import '../theme/extensions/theme_extensions.dart';

/// The default size for the icon inside the action button.
const double kDefaultActionButtonIconSize = 16;

/// The default padding around the action button.
const double kDefaultActionButtonPadding = 8;

/// {@template streamActionButton}
/// A customized action button for feed interactions.
///
/// This is used to create like, comment, share, and bookmark buttons
/// in the activity feed with optional count display.
/// {@endtemplate}
class ActionButton extends StatelessWidget {
  /// {@macro streamActionButton}
  const ActionButton({
    super.key,
    required this.icon,
    required this.count,
    this.onTap,
    this.color,
    this.disabledColor,
    this.iconSize = kDefaultActionButtonIconSize,
    this.padding = const EdgeInsets.all(kDefaultActionButtonPadding),
  });

  /// The icon to display inside the button.
  final Widget icon;

  /// The count to display below the icon.
  final int count;

  /// The callback that is called when the button is tapped.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onTap;

  /// The color to use for the icon and text, if the button is enabled.
  ///
  /// If null, uses the theme's low emphasis text color.
  final Color? color;

  /// The color to use for the icon and text, if the button is disabled.
  final Color? disabledColor;

  /// The size of the icon inside the button.
  ///
  /// Defaults to 16.0.
  final double iconSize;

  /// The padding around the button content.
  ///
  /// Defaults to EdgeInsets.all(8.0).
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      onPressed: onTap,
      label: Text(count.toString()),
      style: TextButton.styleFrom(
        foregroundColor: color,
        iconColor: color,
        disabledForegroundColor: disabledColor,
        disabledIconColor: disabledColor,
        iconSize: iconSize,
        padding: padding,
        minimumSize: Size.zero,
        textStyle: context.appTextStyles.footnote,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

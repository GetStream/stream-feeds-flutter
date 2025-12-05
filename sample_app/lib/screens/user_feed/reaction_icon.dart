// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';

/// {@template reactionIcon}
/// Reaction icon data
/// {@endtemplate}
class ReactionIcon {
  /// {@macro reactionIcon}
  const ReactionIcon({
    required this.type,
    required this.icon,
    required this.filledIcon,
    this.iconColor,
    this.emojiCode,
  });

  /// Type of reaction
  final String type;

  /// The outlined icon representing the reaction.
  ///
  /// For example, a heart outline for a "like" reaction.
  final IconData icon;

  /// The filled icon representing the reaction.
  ///
  /// For example, a filled heart for a "like" reaction.
  final IconData filledIcon;

  /// The color associated with the reaction icon.
  ///
  /// This color is typically used to highlight the icon when selected.
  final Color? iconColor;

  /// Optional emoji code for the reaction.
  ///
  /// Used to display a custom emoji in the notification.
  final String? emojiCode;

  /// The default list of reaction icons provided by the app.
  ///
  /// This includes two reactions:
  /// - heart: Represented by a heart icon
  /// - fire: Represented by a fire icon
  ///
  /// These default reactions can be used directly or as a starting point for
  /// custom reaction configurations.
  static const List<ReactionIcon> defaultReactions = [
    ReactionIcon(
      type: 'heart',
      emojiCode: '❤️',
      icon: Icons.favorite_outline_rounded,
      filledIcon: Icons.favorite_rounded,
      iconColor: Color(0xFFE91E63),
    ),
    ReactionIcon(
      type: 'fire',
      emojiCode: '🔥',
      icon: Icons.local_fire_department_outlined,
      filledIcon: Icons.local_fire_department_rounded,
      iconColor: Color(0xFFFF5722),
    ),
  ];
}

/// Extension methods for [ReactionIcon].
extension ReactionIconExtension on ReactionIcon {
  /// Returns the appropriate icon based on whether the reaction is highlighted.
  IconData getIcon(bool highlighted) => highlighted ? filledIcon : icon;

  /// Returns the appropriate color based on whether the reaction is highlighted.
  Color? getColor(bool isHighlighted) => isHighlighted ? iconColor : null;
}

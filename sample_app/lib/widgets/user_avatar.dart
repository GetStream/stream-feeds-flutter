import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import '../theme/extensions/theme_extensions.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
    this.radius = 20,
    this.backgroundColor,
  });

  /// Creates a small user avatar (24×24 pixels).
  const UserAvatar.small({
    super.key,
    required this.user,
    this.backgroundColor,
  }) : radius = 12;

  /// Creates a medium user avatar for AppBar (36×36 pixels).
  const UserAvatar.appBar({
    super.key,
    required this.user,
    this.backgroundColor,
  }) : radius = 18;

  /// Creates a standard user avatar for ListTile (40×40 pixels).
  const UserAvatar.listTile({
    super.key,
    required this.user,
    this.backgroundColor,
  }) : radius = 20;

  /// Creates a large user avatar (56×56 pixels).
  const UserAvatar.large({
    super.key,
    required this.user,
    this.backgroundColor,
  }) : radius = 28;

  /// Creates an extra large user avatar (80×80 pixels).
  const UserAvatar.extraLarge({
    super.key,
    required this.user,
    this.backgroundColor,
  }) : radius = 40;

  final User user;
  final double radius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? context.appColors.textLowEmphasis,
      backgroundImage: switch (user.image) {
        final image? => NetworkImage(image),
        _ => null,
      },
      child: switch (user.image) {
        null => radius > 12 ? BackupGradientAvatar(username: user.name) : null,
        _ => null,
      },
    );
  }
}

class BackupGradientAvatar extends StatelessWidget {
  const BackupGradientAvatar({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    final initials = switch (username.trim().split(' ')) {
      [final part] => part[0],
      [final first, final second, ...] => '${first[0]} ${second[0]}',
      _ => '',
    };

    return Text(initials);
  }
}

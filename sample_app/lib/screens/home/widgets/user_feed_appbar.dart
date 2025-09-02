import 'package:flutter/material.dart';

import '../../../theme/extensions/theme_extensions.dart';

class UserFeedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const UserFeedAppbar({
    super.key,
    required this.title,
    this.leading,
    this.centerTitle,
    required this.actions,
  });

  final Widget title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.appColors.barsBg,
      foregroundColor: context.appColors.textHighEmphasis,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

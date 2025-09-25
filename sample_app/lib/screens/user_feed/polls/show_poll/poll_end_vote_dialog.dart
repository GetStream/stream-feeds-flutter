import 'package:flutter/material.dart';

import '../../../../theme/extensions/theme_extensions.dart';

/// {@template showPollSuggestOptionDialog}
/// Shows a dialog that allows the user to end vote for a poll.
/// {@endtemplate}
Future<bool?> showPollEndVoteDialog({
  required BuildContext context,
}) {
  return showDialog<bool?>(
    context: context,
    builder: (_) => const PollEndVoteDialog(),
  );
}

/// {@template pollEndVoteDialog}
/// A dialog that allows the user to end vote for a poll.
/// {@endtemplate}
class PollEndVoteDialog extends StatelessWidget {
  /// {@macro pollEndVoteDialog}
  const PollEndVoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    final actions = [
      TextButton(
        onPressed: () => Navigator.of(context).maybePop(false),
        style: TextButton.styleFrom(
          textStyle: textTheme.headlineBold,
          foregroundColor: colorTheme.accentPrimary,
          disabledForegroundColor: colorTheme.disabled,
        ),
        child: Text('Cancel'.toUpperCase()),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).maybePop(true),
        style: TextButton.styleFrom(
          textStyle: textTheme.headlineBold,
          foregroundColor: colorTheme.accentPrimary,
          disabledForegroundColor: colorTheme.disabled,
        ),
        child: Text('End'.toUpperCase()),
      ),
    ];

    return AlertDialog(
      title: Text(
        'End vote',
        style: textTheme.headlineBold,
      ),
      actions: actions,
      titlePadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(8),
      backgroundColor: colorTheme.appBg,
    );
  }
}

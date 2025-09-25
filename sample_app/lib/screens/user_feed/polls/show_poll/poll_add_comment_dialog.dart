import 'package:flutter/material.dart';

import '../../../../theme/extensions/theme_extensions.dart';
import '../create_poll/poll_text_field.dart';

/// {@template showPollAddCommentDialog}
/// Shows a dialog that allows the user to add a poll comment.
///
/// Optionally, you can provide an [initialValue] to pre-fill the text field.
/// {@endtemplate}
Future<String?> showPollAddCommentDialog({
  required BuildContext context,
  String initialValue = '',
}) =>
    showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PollAddCommentDialog(
        initialValue: initialValue,
      ),
    );

/// {@template pollAddCommentDialog}
/// A dialog that allows the user to add or update a poll comment.
///
/// Optionally, you can provide an [initialValue] to pre-fill the text field.
/// {@endtemplate}
class PollAddCommentDialog extends StatefulWidget {
  /// {@macro pollAddCommentDialog}
  const PollAddCommentDialog({
    super.key,
    this.initialValue = '',
  });

  /// Initial answer to be displayed in the text field.
  ///
  /// Defaults to an empty string.
  final String initialValue;

  @override
  State<PollAddCommentDialog> createState() => _PollAddCommentDialogState();
}

class _PollAddCommentDialogState extends State<PollAddCommentDialog> {
  late String _comment = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    final actions = [
      TextButton(
        onPressed: Navigator.of(context).pop,
        style: TextButton.styleFrom(
          textStyle: textTheme.headlineBold,
          foregroundColor: colorTheme.accentPrimary,
          disabledForegroundColor: colorTheme.disabled,
        ),
        child: Text('Cancel'.toUpperCase()),
      ),
      TextButton(
        onPressed: switch (_comment == widget.initialValue) {
          true => null,
          false => () => Navigator.of(context).pop(_comment),
        },
        style: TextButton.styleFrom(
          textStyle: textTheme.headlineBold,
          foregroundColor: colorTheme.accentPrimary,
          disabledForegroundColor: colorTheme.disabled,
        ),
        child: Text('Send'.toUpperCase()),
      ),
    ];

    return AlertDialog(
      title: Text(
        switch (widget.initialValue.isEmpty) {
          true => 'Add a comment',
          false => 'Update your comment',
        },
        style: textTheme.headlineBold,
      ),
      actions: actions,
      titlePadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.all(8),
      backgroundColor: colorTheme.appBg,
      content: StreamPollTextField(
        autoFocus: true,
        initialValue: _comment,
        hintText: 'Enter your comment',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        style: textTheme.headline,
        fillColor: colorTheme.inputBg,
        borderRadius: BorderRadius.circular(12),
        onChanged: (value) => setState(() => _comment = value),
      ),
    );
  }
}

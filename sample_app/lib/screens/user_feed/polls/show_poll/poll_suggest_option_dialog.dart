import 'package:flutter/material.dart';

import '../../../../theme/extensions/theme_extensions.dart';
import '../create_poll/poll_text_field.dart';

/// {@template showPollSuggestOptionDialog}
/// Shows a dialog that allows the user to suggest an option for a poll.
///
/// Optionally, you can provide an [initialOption] to pre-fill the text field.
/// {@endtemplate}
Future<String?> showPollSuggestOptionDialog({
  required BuildContext context,
  String initialOption = '',
}) =>
    showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PollSuggestOptionDialog(
        initialOption: initialOption,
      ),
    );

/// {@template pollSuggestOptionDialog}
/// A dialog that allows the user to suggest an option for a poll.
///
/// Optionally, you can provide an [initialOption] to pre-fill the text field.
/// {@endtemplate}
class PollSuggestOptionDialog extends StatefulWidget {
  /// {@macro pollSuggestOptionDialog}
  const PollSuggestOptionDialog({
    super.key,
    this.initialOption = '',
  });

  /// Initial option to be displayed in the text field.
  ///
  /// Defaults to an empty string.
  final String initialOption;

  @override
  State<PollSuggestOptionDialog> createState() =>
      _PollSuggestOptionDialogState();
}

class _PollSuggestOptionDialogState extends State<PollSuggestOptionDialog> {
  late String _option = widget.initialOption;

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
        onPressed: switch (_option == widget.initialOption) {
          true => null,
          false => () => Navigator.of(context).pop(_option),
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
        'Suggest an option',
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
        initialValue: _option,
        hintText: 'Enter a new option',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        style: textTheme.headline,
        fillColor: colorTheme.inputBg,
        borderRadius: BorderRadius.circular(12),
        onChanged: (value) => setState(() => _option = value),
      ),
    );
  }
}

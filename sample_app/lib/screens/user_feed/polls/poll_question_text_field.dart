import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../theme/extensions/theme_extensions.dart';
import 'poll_config.dart';
import 'poll_text_field.dart' show StreamPollTextField;

class _NullConst {
  const _NullConst();
}

const _nullConst = _NullConst();

/// {@template pollQuestion}
/// A data class that represents a poll question.
/// {@endtemplate}
class PollQuestion {
  /// {@macro pollQuestion}
  PollQuestion({
    this.originalId,
    this.text = '',
    this.error,
  });

  /// The unique id of the poll this question belongs to.
  final String? originalId;

  /// The text of the poll question.
  final String text;

  /// Optional error message based on the validation of the poll question.
  ///
  /// If the poll question is valid, this will be `null`.
  final String? error;

  /// A copy of the current [PollQuestion] with the provided values.
  PollQuestion copyWith({
    String? originalId,
    String? text,
    Object? error = _nullConst,
  }) {
    return PollQuestion(
      originalId: originalId ?? this.originalId,
      text: text ?? this.text,
      error: error == _nullConst ? this.error : error as String?,
    );
  }
}

/// {@template pollQuestionTextField}
/// A widget that represents a text field for poll question input.
/// {@endtemplate}
class PollQuestionTextField extends StatefulWidget {
  /// {@macro pollQuestionTextField}
  const PollQuestionTextField({
    super.key,
    required this.initialQuestion,
    this.title,
    this.hintText,
    this.questionRange = const (min: 1, max: 80),
    this.onChanged,
  });

  /// An optional title to be displayed above the text field.
  final String? title;

  /// The hint text to be displayed in the text field.
  final String? hintText;

  /// The length constraints of the poll question.
  ///
  /// If `null`, there are no constraints on the length of the question.
  final Range<int>? questionRange;

  /// The poll question.
  final PollQuestion initialQuestion;

  /// Callback called when the poll question is changed.
  final ValueChanged<PollQuestion>? onChanged;

  @override
  State<PollQuestionTextField> createState() => _PollQuestionTextFieldState();
}

class _PollQuestionTextFieldState extends State<PollQuestionTextField> {
  late var _question = widget.initialQuestion;

  @override
  void didUpdateWidget(covariant PollQuestionTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update the question if the updated initial question is different from
    // the current question.
    final currQuestion = _question;
    final newQuestion = widget.initialQuestion;
    final questionEquality = EqualityBy<PollQuestion, (String?, String)>(
      (it) => (it.originalId, it.text),
    );

    if (questionEquality.equals(currQuestion, newQuestion) case false) {
      _question = newQuestion;
    }
  }

  String? _validateQuestion(String question) {
    final range = widget.questionRange;
    if (range == null) return null;
    final (:min, :max) = range;

    // Check if the question is too short.
    if (min != null && question.length < min) {
      return 'Question must be at least $min characters long';
    }

    // Check if the question is too long.
    if (max != null && question.length > max) {
      return 'Question must be at most $max characters long';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.appColors;
    final textTheme = context.appTextStyles;
    final fillColor = colorTheme.inputBg;
    final borderRadius = BorderRadius.circular(12);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title case final title?) ...[
          Text(title, style: textTheme.bodyBold),
          const SizedBox(height: 8),
        ],
        DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: borderRadius,
          ),
          child: StreamPollTextField(
            initialValue: _question.text,
            hintText: widget.hintText,
            fillColor: fillColor,
            borderRadius: borderRadius,
            errorText: _question.error,
            onChanged: (text) {
              _question = _question.copyWith(
                text: text,
                error: _validateQuestion(text),
              );

              widget.onChanged?.call(_question);
            },
          ),
        ),
      ],
    );
  }
}

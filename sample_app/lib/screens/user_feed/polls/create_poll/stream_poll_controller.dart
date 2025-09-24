import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'create_poll_state.dart';
import 'poll_config.dart';

part 'stream_poll_controller.freezed.dart';

/// {@template streamPollController}
/// Controller used to manage the state of a poll.
/// {@endtemplate}
class StreamPollController extends ValueNotifier<CreatePollState> {
  /// {@macro streamPollController}
  factory StreamPollController({
    CreatePollState? poll,
    PollConfig? config,
  }) =>
      StreamPollController._(
        config ?? const PollConfig(),
        poll ?? CreatePollState.empty(),
      );

  StreamPollController._(this.config, super._value);

  /// The configuration used to validate the poll.
  final PollConfig config;

  /// Returns `true` if the poll is valid.
  ///
  /// The poll is considered valid if it passes all the validations specified
  /// in the [config].
  ///
  /// See also:
  /// * [validateGranularly], which returns a [Set] of [PollValidationError] if
  ///   there are any errors.
  bool validate() => validateGranularly().isEmpty;

  /// Validates the poll with the validation specified in the [config], and
  /// returns a [Set] of [PollValidationError] only, if any.
  ///
  /// See also:
  /// * [validate], which also validates the poll and returns true if there are
  ///   no errors.
  Set<PollValidationError> validateGranularly() {
    final invalidErrors = <PollValidationError>{};

    // Validate the name length
    if (config.nameRange case final nameRange?) {
      final name = value.name;
      final (:min, :max) = nameRange;

      if (min != null && name.length < min ||
          max != null && name.length > max) {
        invalidErrors.add(
          PollValidationError.nameRange(name, range: nameRange),
        );
      }
    }

    // Validate if the poll options are unique.
    if (config.allowDuplicateOptions case false) {
      final options = value.options;
      final uniqueOptions = options.map((it) => it.text).toSet();
      if (uniqueOptions.length != options.length) {
        invalidErrors.add(
          PollValidationError.duplicateOptions(options),
        );
      }
    }

    // Validate the poll options count
    if (config.optionsRange case final optionsRange?) {
      final options = value.options;
      final nonEmptyOptions = [...options.where((it) => it.text.isNotEmpty)];
      final (:min, :max) = optionsRange;

      if (min != null && nonEmptyOptions.length < min ||
          max != null && nonEmptyOptions.length > max) {
        invalidErrors.add(
          PollValidationError.optionsRange(options, range: optionsRange),
        );
      }
    }

    // Validate the max number of votes allowed if enforceUniqueVote is false.
    if (value.enforceUniqueVote case false) {
      if (value.maxVotesAllowed case final maxVotesAllowed?) {
        if (config.allowedVotesRange case final allowedVotesRange?) {
          final (:min, :max) = allowedVotesRange;

          if (min != null && maxVotesAllowed < min ||
              max != null && maxVotesAllowed > max) {
            invalidErrors.add(
              PollValidationError.maxVotesAllowed(
                maxVotesAllowed,
                range: allowedVotesRange,
              ),
            );
          }
        }
      }
    }

    return invalidErrors;
  }

  /// Adds a new option with the provided [text] and [extraData].
  ///
  /// The new option will be added to the end of the list of options.
  void addOption(
    String text, {
    Map<String, Object?> extraData = const {},
  }) {
    final options = [...value.options];
    final newOption = PollOptionInputState(text: text);
    value = value.copyWith(options: [...options, newOption]);
  }

  /// Updates the option at the provided [index] with the provided [text] and
  /// [extraData].
  void updateOption(
    String text, {
    required int index,
    Map<String, Object?> extraData = const {},
  }) {
    final options = [...value.options];
    options[index] = options[index].copyWith(
      text: text,
    );

    value = value.copyWith(options: options);
  }

  /// Removes the option at the provided [index].
  PollOptionInputState removeOption(int index) {
    final options = [...value.options];
    final removed = options.removeAt(index);
    value = value.copyWith(options: options);

    return removed;
  }

  /// Sets the poll question.
  set question(String question) {
    value = value.copyWith(name: question);
  }

  /// Sets the poll options.
  set options(List<PollOptionInputState> options) {
    value = value.copyWith(options: options);
  }

  /// Sets the poll enforce unique vote.
  set enforceUniqueVote(bool enforceUniqueVote) {
    value = value.copyWith(enforceUniqueVote: enforceUniqueVote);
  }

  /// Sets the poll max votes allowed.
  ///
  /// If `null`, there is no limit to the number of votes allowed.
  set maxVotesAllowed(int? maxVotesAllowed) {
    value = value.copyWith(maxVotesAllowed: maxVotesAllowed);
  }

  set allowSuggestions(bool allowSuggestions) {
    value = value.copyWith(allowUserSuggestedOptions: allowSuggestions);
  }

  /// Sets the poll voting visibility.
  set votingVisibility(VotingVisibility visibility) {
    value = value.copyWith(votingVisibility: visibility);
  }

  /// Sets whether the poll allows comments.
  set allowComments(bool allowComments) {
    value = value.copyWith(allowAnswers: allowComments);
  }
}

/// {@template pollValidationError}
/// Union representing the possible validation errors while creating a poll.
///
/// The errors are used to provide feedback to the user about what went wrong
/// while creating a poll.
/// {@endtemplate}
@freezed
sealed class PollValidationError with _$PollValidationError {
  /// Occurs when the poll contains duplicate options.
  const factory PollValidationError.duplicateOptions(
    List<PollOptionInputState> options,
  ) = _PollValidationErrorDuplicateOptions;

  /// Occurs when the poll question length is not within the allowed range.
  const factory PollValidationError.nameRange(
    String name, {
    required Range<int> range,
  }) = _PollValidationErrorNameRange;

  /// Occurs when the poll options count is not within the allowed range.
  const factory PollValidationError.optionsRange(
    List<PollOptionInputState> options, {
    required Range<int> range,
  }) = _PollValidationErrorOptionsRange;

  /// Occurs when the poll max votes allowed is not within the allowed range.
  const factory PollValidationError.maxVotesAllowed(
    int maxVotesAllowed, {
    required Range<int> range,
  }) = _PollValidationErrorMaxVotesAllowed;
}

// coverage:ignore-start

/// @nodoc
extension PollValidationErrorPatternMatching on PollValidationError {
  /// @nodoc
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<PollOptionInputState> options)
        duplicateOptions,
    required TResult Function(String name, Range<int> range) nameRange,
    required TResult Function(
            List<PollOptionInputState> options, Range<int> range)
        optionsRange,
    required TResult Function(int maxVotesAllowed, Range<int> range)
        maxVotesAllowed,
  }) {
    final error = this;
    return switch (error) {
      _PollValidationErrorDuplicateOptions() => duplicateOptions(error.options),
      _PollValidationErrorNameRange() => nameRange(error.name, error.range),
      _PollValidationErrorOptionsRange() =>
        optionsRange(error.options, error.range),
      _PollValidationErrorMaxVotesAllowed() =>
        maxVotesAllowed(error.maxVotesAllowed, error.range),
    };
  }

  /// @nodoc
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<PollOptionInputState> options)? duplicateOptions,
    TResult? Function(String name, Range<int> range)? nameRange,
    TResult? Function(List<PollOptionInputState> options, Range<int> range)?
        optionsRange,
    TResult? Function(int maxVotesAllowed, Range<int> range)? maxVotesAllowed,
  }) {
    final error = this;
    return switch (error) {
      _PollValidationErrorDuplicateOptions() =>
        duplicateOptions?.call(error.options),
      _PollValidationErrorNameRange() =>
        nameRange?.call(error.name, error.range),
      _PollValidationErrorOptionsRange() =>
        optionsRange?.call(error.options, error.range),
      _PollValidationErrorMaxVotesAllowed() =>
        maxVotesAllowed?.call(error.maxVotesAllowed, error.range),
    };
  }

  /// @nodoc
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<PollOptionInputState> options)? duplicateOptions,
    TResult Function(String name, Range<int> range)? nameRange,
    TResult Function(List<PollOptionInputState> options, Range<int> range)?
        optionsRange,
    TResult Function(int maxVotesAllowed, Range<int> range)? maxVotesAllowed,
    required TResult orElse(),
  }) {
    final error = this;
    final result = switch (error) {
      _PollValidationErrorDuplicateOptions() =>
        duplicateOptions?.call(error.options),
      _PollValidationErrorNameRange() =>
        nameRange?.call(error.name, error.range),
      _PollValidationErrorOptionsRange() =>
        optionsRange?.call(error.options, error.range),
      _PollValidationErrorMaxVotesAllowed() =>
        maxVotesAllowed?.call(error.maxVotesAllowed, error.range),
    };

    return result ?? orElse();
  }

  /// @nodoc
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PollValidationErrorDuplicateOptions value)
        duplicateOptions,
    required TResult Function(_PollValidationErrorNameRange value) nameRange,
    required TResult Function(_PollValidationErrorOptionsRange value)
        optionsRange,
    required TResult Function(_PollValidationErrorMaxVotesAllowed value)
        maxVotesAllowed,
  }) {
    final error = this;
    return switch (error) {
      _PollValidationErrorDuplicateOptions() => duplicateOptions(error),
      _PollValidationErrorNameRange() => nameRange(error),
      _PollValidationErrorOptionsRange() => optionsRange(error),
      _PollValidationErrorMaxVotesAllowed() => maxVotesAllowed(error),
    };
  }

  /// @nodoc
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PollValidationErrorDuplicateOptions value)?
        duplicateOptions,
    TResult? Function(_PollValidationErrorNameRange value)? nameRange,
    TResult? Function(_PollValidationErrorOptionsRange value)? optionsRange,
    TResult? Function(_PollValidationErrorMaxVotesAllowed value)?
        maxVotesAllowed,
  }) {
    final error = this;
    return switch (error) {
      _PollValidationErrorDuplicateOptions() => duplicateOptions?.call(error),
      _PollValidationErrorNameRange() => nameRange?.call(error),
      _PollValidationErrorOptionsRange() => optionsRange?.call(error),
      _PollValidationErrorMaxVotesAllowed() => maxVotesAllowed?.call(error),
    };
  }

  /// @nodoc
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PollValidationErrorDuplicateOptions value)?
        duplicateOptions,
    TResult Function(_PollValidationErrorNameRange value)? nameRange,
    TResult Function(_PollValidationErrorOptionsRange value)? optionsRange,
    TResult Function(_PollValidationErrorMaxVotesAllowed value)?
        maxVotesAllowed,
    required TResult orElse(),
  }) {
    final error = this;
    final result = switch (error) {
      _PollValidationErrorDuplicateOptions() => duplicateOptions?.call(error),
      _PollValidationErrorNameRange() => nameRange?.call(error),
      _PollValidationErrorOptionsRange() => optionsRange?.call(error),
      _PollValidationErrorMaxVotesAllowed() => maxVotesAllowed?.call(error),
    };

    return result ?? orElse();
  }
}

// coverage:ignore-end

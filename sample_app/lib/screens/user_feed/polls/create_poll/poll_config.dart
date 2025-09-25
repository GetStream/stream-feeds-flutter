typedef Range<T> = ({T? min, T? max});

class PollConfig {
  const PollConfig({
    this.nameRange = const (min: 1, max: 80),
    this.optionsRange = const (min: 1, max: 10),
    this.allowDuplicateOptions = false,
    this.allowedVotesRange = const (min: 2, max: 10),
  });

  /// The minimum and maximum length of the poll question.
  /// if `null`, there is no limit to the length of the question.
  ///
  /// Defaults to `1` and `80`.
  final Range<int>? nameRange;

  /// The minimum and maximum length of the poll options.
  /// if `null`, there is no limit to the length of the options.
  ///
  /// Defaults to `2` and `10`.
  final Range<int>? optionsRange;

  /// Whether the poll allows duplicate options.
  ///
  /// Defaults to `false`.
  final bool allowDuplicateOptions;

  /// The minimum and maximum number of votes allowed.
  /// if `null`, there is no limit to the number of votes allowed.
  ///
  /// Defaults to `2` and `10`.
  final Range<int>? allowedVotesRange;
}

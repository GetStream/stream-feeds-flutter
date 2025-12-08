import 'package:stream_core/stream_core.dart';

/// Extension for converting a [Filter] instance to a request format.
extension FilterRequestExtension on Filter {
  /// Converts this [Filter] instance to a request format suitable for API calls.
  Map<String, Object?> toRequest() => toJson();
}

/// Extension to check if an object [T] matches a given filter.
extension MatchesExtensions<T extends Object> on T {
  /// Null filter means "no filter", so everything matches.
  bool matches(Filter<T>? filter) {
    return filter == null || filter.matches(this);
  }
}

import 'package:stream_core/stream_core.dart';

/// Extension for converting a [Filter] instance to a request format.
extension FilterRequestExtension on Filter {
  /// Converts this [Filter] instance to a request format suitable for API calls.
  Map<String, Object?> toRequest() => toJson();
}

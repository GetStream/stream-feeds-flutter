import 'package:stream_core/stream_core.dart';

import '../../generated/api/model/sort_param_request.dart' as api;

/// Extension for converting a [Sort] instance to a request format.
extension SortRequestExtension<T extends Object> on Sort<T> {
  /// Converts this [Sort] instance to a request format suitable for API calls.
  api.SortParamRequest toRequest() {
    return api.SortParamRequest(
      field: field.remote,
      direction: direction.value,
    );
  }
}

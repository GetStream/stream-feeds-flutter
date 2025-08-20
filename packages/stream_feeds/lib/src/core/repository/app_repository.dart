import 'package:stream_core/stream_core.dart';

import '../../generated/api/api.dart' as api;
import '../models/app_data.dart';

/// Repository for managing application configuration data.
///
/// Provides methods for fetching application settings including URL enrichment,
/// translation, and file upload configurations. All methods return [Result] objects
/// for explicit error handling.
class AppRepository {
  /// Creates a new [AppRepository] instance.
  ///
  /// Requires an [apiClient] for making API calls to the Stream Feeds service.
  const AppRepository(this._apiClient);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _apiClient;

  /// Fetches the application configuration data.
  ///
  /// Returns a [Result] containing the [AppData] or an error.
  Future<Result<AppData>> getApp() {
    return runSafely(() async {
      final response = await _apiClient.getApp();

      if (response == null) {
        throw ClientException(message: 'No result data from getApp');
      }

      return response.app.toModel();
    });
  }
}

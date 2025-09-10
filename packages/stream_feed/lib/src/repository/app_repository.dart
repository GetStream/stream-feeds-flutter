import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/app_data.dart';

/// Repository for managing application configuration data.
///
/// Provides methods for fetching application settings including URL enrichment,
/// translation, and file upload configurations.
///
/// All methods return [Result] objects for explicit error handling.
class AppRepository {
  /// Creates a new [AppRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const AppRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Fetches the application configuration data.
  ///
  /// Retrieves application settings including URL enrichment, translation,
  /// and file upload configurations from the server.
  ///
  /// Returns a [Result] containing the [AppData] or an error.
  Future<Result<AppData>> getApp() async {
    final result = await _api.getApp();

    return result.map((response) => response.app.toModel());
  }
}

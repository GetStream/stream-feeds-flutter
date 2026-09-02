import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/user_data.dart';
import '../state/query/users_query.dart';

/// Repository for querying user data.
///
/// Provides methods for searching users by filter conditions, sort, and pagination.
///
/// All methods return [Result] objects for explicit error handling.
class UsersRepository {
  /// Creates a new [UsersRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const UsersRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Queries users matching the given [query].
  ///
  /// Returns a [Result] containing a list of [UserData] or an error.
  Future<Result<List<UserData>>> queryUsers(UsersQuery query) async {
    final request = query.toRequest();
    final result = await _api.queryUsers(payload: request);

    return result.map(
      (response) => response.users.map((u) => u.toModel()).toList(),
    );
  }
}

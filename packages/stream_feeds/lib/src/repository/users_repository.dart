import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;
import '../models/user_data.dart';

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

  /// Queries users matching the provided filter conditions.
  ///
  /// Searches for users using the specified [filterConditions] map and optional
  /// [sort], [limit], [offset], [presence], and [includeDeactivatedUsers] parameters.
  ///
  /// Returns a [Result] containing a list of [UserData] or an error.
  Future<Result<List<UserData>>> queryUsers({
    required Map<String, Object?> filterConditions,
    List<api.SortParamRequest>? sort,
    int? limit,
    int? offset,
    bool? presence,
    bool? includeDeactivatedUsers,
  }) async {
    final payload = api.QueryUsersPayload(
      filterConditions: filterConditions,
      sort: sort,
      limit: limit,
      offset: offset,
      presence: presence,
      includeDeactivatedUsers: includeDeactivatedUsers,
    );

    final result = await _api.queryUsers(payload: payload);

    return result.map((response) => response.users.map((u) => u.toModel()).toList());
  }
}

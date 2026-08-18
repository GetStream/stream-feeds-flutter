import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/query_configuration.dart';
import '../models/user_data.dart';
import 'query/users_query.dart';

part 'user_list_state.freezed.dart';

/// Manages the state of a user list and handles state updates.
///
/// Provides methods to update the user list state in response to data changes
/// from the Stream Feeds API.
class UserListStateNotifier extends StateNotifier<UserListState> {
  UserListStateNotifier({
    required UserListState initialState,
  }) : super(initialState);

  QueryConfiguration<UserData>? _queryConfig;
  List<Sort<UserData>> get usersSort {
    return _queryConfig?.sort ?? UsersSort.defaultSort;
  }

  /// Handles the result of a query for more users.
  ///
  /// [offset] and [limit] are the pagination parameters that were sent with the
  /// request which produced [users]. The users endpoint returns no page
  /// cursors, so the offset of the next page is derived from the number of
  /// users the server returned.
  void onQueryMoreUsers(
    List<UserData> users,
    QueryConfiguration<UserData> queryConfig, {
    required int offset,
    int? limit,
  }) {
    _queryConfig = queryConfig;

    // Merge the new users with the existing ones (keeping the sort order)
    final updatedUsers = state.users.merge(
      users,
      key: (it) => it.id,
      compare: usersSort.compare,
    );

    state = state.copyWith(
      users: updatedUsers,
      nextOffset: _nextOffset(
        offset: offset,
        pageSize: users.length,
        limit: limit,
      ),
    );
  }

  // Computes the offset of the next page, or null when there is nothing more
  // to load.
  //
  // The offset advances by the number of users the server returned rather than
  // by the length of the merged list, so that pages overlapping on a user id do
  // not shift the position in the result set.
  static int? _nextOffset({
    required int offset,
    required int pageSize,
    int? limit,
  }) {
    // An empty page always means the end was reached.
    if (pageSize == 0) return null;

    // So does a page shorter than the one that was requested, but only when the
    // query specified a limit. Without one the server applies its own default,
    // which the SDK does not know.
    if (limit != null && pageSize < limit) return null;

    final nextOffset = offset + pageSize;

    // The API rejects offsets above the maximum, so stop instead of issuing a
    // request that is guaranteed to fail. Deliberately not clamped: requesting
    // the maximum again would return a non-empty page forever.
    if (nextOffset > UsersQuery.maxOffset) return null;

    return nextOffset;
  }
}

/// An observable state object that manages the current state of a user list.
///
/// Maintains the currently loaded users and the offset needed to load the next
/// page of results.
@freezed
class UserListState with _$UserListState {
  /// Creates a new [UserListState] instance.
  const UserListState({
    this.users = const [],
    this.nextOffset,
  });

  /// All the paginated users currently loaded.
  ///
  /// Contains every user fetched across pagination requests, ordered by the
  /// sorting configuration of the query.
  @override
  final List<UserData> users;

  /// The offset to request for the next page of users, or `null` when there are
  /// no more users to load.
  ///
  /// Unlike most other collections in this SDK, users are paginated with
  /// `limit`/`offset` instead of cursors, because the users endpoint does not
  /// return page cursors.
  ///
  /// This is `null` before the first query, once the last page has been
  /// reached, and once the next page would exceed [UsersQuery.maxOffset].
  @override
  final int? nextOffset;

  /// Whether there are more users available to load.
  ///
  /// Because the endpoint reports no total count, the end is only known once a
  /// page comes back shorter than the requested [UsersQuery.limit], or empty
  /// when the query specified no limit. A query without a limit therefore ends
  /// with a final request that returns no users.
  bool get canLoadMore => nextOffset != null;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/query_configuration.dart';
import '../models/user_data.dart';
import '../repository/users_repository.dart';
import 'query/users_query.dart';
import 'state_notifier_extension.dart';
import 'user_list_state.dart';

/// Represents a list of users with a query and state.
///
/// The primary interface for working with user lists in the Stream Feeds SDK that provides
/// functionality for querying and managing collections of users with pagination support.
///
/// Each user list instance maintains its own state that can be observed for updates.
/// The user list state includes the users fetched so far and pagination information.
///
/// Users are paginated by offset rather than by cursor, because the users
/// endpoint does not return page cursors.
class UserList extends Disposable {
  UserList({
    required this.query,
    required this.usersRepository,
  }) {
    _stateNotifier = UserListStateNotifier(
      initialState: const UserListState(),
    );
  }

  final UsersQuery query;
  final UsersRepository usersRepository;

  UserListState get state => stateNotifier.value;
  StateNotifier<UserListState> get notifier => stateNotifier;
  Stream<UserListState> get stream => stateNotifier.stream;

  @internal
  UserListStateNotifier get stateNotifier => _stateNotifier;
  late final UserListStateNotifier _stateNotifier;

  /// Queries the initial list of users based on the provided [UsersQuery].
  ///
  /// Returns a [Result] containing a list of [UserData] or an error.
  Future<Result<List<UserData>>> get() => _queryUsers(query);

  /// Queries more users based on the current pagination state.
  ///
  /// If there are no more users available, it returns an empty list.
  ///
  /// Optionally accepts a [limit] parameter to specify the maximum number of
  /// users to return.
  Future<Result<List<UserData>>> queryMoreUsers({int? limit}) async {
    // Build the query with the current pagination state (with next offset)
    final nextOffset = _stateNotifier.value.nextOffset;

    // Early return if no more users available
    if (nextOffset == null) return const Result.success([]);

    // Create a new query starting at the next page offset
    final nextQuery = query.copyWith(
      offset: nextOffset,
      limit: limit ?? query.limit,
    );

    return _queryUsers(nextQuery);
  }

  // Internal method to query users and update state.
  Future<Result<List<UserData>>> _queryUsers(UsersQuery query) async {
    final result = await usersRepository.queryUsers(query);

    result.onSuccess(
      (users) {
        _stateNotifier.onQueryMoreUsers(
          users,
          QueryConfiguration(
            filter: query.filter,
            sort: query.sort ?? UsersSort.defaultSort,
          ),
          offset: query.offset ?? 0,
          limit: query.limit,
        );
      },
    );

    return result;
  }

  @override
  void dispose() {
    _stateNotifier.dispose();
    super.dispose();
  }
}

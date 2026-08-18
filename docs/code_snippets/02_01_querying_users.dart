import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;

Future<void> queryUsers() async {
  // Search users by name prefix
  final userList = client.userList(
    UsersQuery(
      filter: Filter.autoComplete(UsersFilterField.name, 'Al'),
      sort: [UsersSort.asc(UsersSortField.name)],
      limit: 25,
    ),
  );

  final result = await userList.get();

  switch (result) {
    case Success(data: final users):
      for (final user in users) {
        print('${user.id}: ${user.name}');
      }
    case Failure(error: final error):
      print('Failed to query users: $error');
  }

  // The loaded users are also kept in the observable state of the list
  userList.stream.listen((state) => print('${state.users.length} users'));

  // Dispose the list when you no longer need it
  userList.dispose();
}

Future<void> queryUsersWithFilter() async {
  // Query users by exact ID match
  final userList = client.userList(
    UsersQuery(
      filter: Filter.in_(UsersFilterField.id, ['alice', 'bob', 'carol']),
    ),
  );

  final result = await userList.get();

  switch (result) {
    case Success(data: final users):
      print('Found ${users.length} users');
    case Failure(error: final error):
      print('Failed to query users: $error');
  }
}

Future<void> queryMoreUsers() async {
  // Users are paginated with limit/offset instead of cursors
  final userList = client.userList(
    UsersQuery(
      filter: Filter.contains(UsersFilterField.teams, 'support'),
      sort: [UsersSort.desc(UsersSortField.lastActive)],
      limit: 10,
    ),
  );

  await userList.get();

  // Keep loading while more users are available
  while (userList.state.canLoadMore) {
    final result = await userList.queryMoreUsers();
    if (result.isFailure) break;
  }

  for (final user in userList.state.users) {
    final status = user.online ? 'online' : 'offline';
    print('${user.name ?? user.id} is $status');
  }
}

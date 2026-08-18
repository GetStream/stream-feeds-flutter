import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;

Future<void> queryUsers() async {
  // Search users by name prefix
  final result = await client.queryUsers(
    UsersQuery(
      filter: Filter.autoComplete(UsersFilterField.name, 'Al'),
      sort: [UsersSort.asc(UsersSortField.name)],
      limit: 25,
    ),
  );

  switch (result) {
    case Success(data: final users):
      for (final user in users) {
        print('${user.id}: ${user.name}');
      }
    case Failure(error: final error):
      print('Failed to query users: $error');
  }
}

Future<void> queryUsersWithFilter() async {
  // Query users by exact ID match
  final result = await client.queryUsers(
    UsersQuery(
      filter: Filter.in_(UsersFilterField.id, ['alice', 'bob', 'carol']),
    ),
  );

  switch (result) {
    case Success(data: final users):
      print('Found ${users.length} users');
    case Failure(error: final error):
      print('Failed to query users: $error');
  }
}

Future<void> queryUsersWithPresence() async {
  // Query users and include online presence information
  final result = await client.queryUsers(
    UsersQuery(
      filter: Filter.contains(UsersFilterField.teams, 'support'),
      sort: [UsersSort.desc(UsersSortField.lastActive)],
      limit: 10,
      presence: true,
    ),
  );

  switch (result) {
    case Success(data: final users):
      for (final user in users) {
        final status = user.online ? 'online' : 'offline';
        print('${user.name ?? user.id} is $status');
      }
    case Failure(error: final error):
      print('Failed to query users: $error');
  }
}

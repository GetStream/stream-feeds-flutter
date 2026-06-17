import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;

Future<void> queryUsers() async {
  // Search users by name prefix
  final result = await client.queryUsers(
    filterConditions: {
      'name': {r'$autocomplete': 'Al'},
    },
    sort: [const SortParamRequest(field: 'name', direction: 1)],
    limit: 25,
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
    filterConditions: {
      'id': {
        r'$in': ['alice', 'bob', 'carol'],
      },
    },
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
    filterConditions: {
      'teams': {r'$contains': 'support'},
    },
    sort: [const SortParamRequest(field: 'last_active', direction: -1)],
    limit: 10,
    presence: true,
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

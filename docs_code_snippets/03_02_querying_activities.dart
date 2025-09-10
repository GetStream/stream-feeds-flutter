// ignore_for_file: unused_local_variable, file_names, avoid_redundant_argument_values

import 'package:stream_feed/stream_feed.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> activitySearchAndQueries() async {
  final query = ActivitiesQuery(
    filter: const Filter.equal(ActivitiesFilterField.type, 'post'),
    sort: [ActivitiesSort.desc(ActivitiesSortField.createdAt)],
    limit: 10,
  );

  final activityList = client.activityList(query);
  final activities = await activityList.get();
}

Future<void> queryActivitiesByText() async {
  // search for activities where the text includes the word 'popularity'.
  const query = ActivitiesQuery(
    filter: Filter.equal(ActivitiesFilterField.text, 'popularity'),
  );

  final activityList = client.activityList(query);
  final activities = await activityList.get();
}

Future<void> queryActivitiesBySearchData() async {
  // search for activities associated with the campaign ID 'spring-sale-2025'
  final searchValue = {
    'campaign': {'id': 'spring-sale-2025'},
  };

  final query = ActivitiesQuery(
    filter: Filter.contains(ActivitiesFilterField.searchData, searchValue),
  );

  final activityList = client.activityList(query);
  final activities = await activityList.get();

  // search for activities where the campaign took place in a mall
  const query2 = ActivitiesQuery(
    filter: Filter.pathExists(
      ActivitiesFilterField.searchData,
      'campaign.location.mall',
    ),
  );

  final activityList2 = client.activityList(query2);
  final activities2 = await activityList2.get();
}

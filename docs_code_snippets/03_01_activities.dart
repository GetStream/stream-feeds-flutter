// ignore_for_file: unused_local_variable, file_names, avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> creatingActivities() async {
  // Add an activity to 1 feed
  final activity = await feed.addActivity(
    request: const FeedAddActivityRequest(text: 'Hello world', type: 'post'),
  );

  // Add an activity to multiple feeds
  final multiFeedActivity = await feed.addActivity(
    request: const FeedAddActivityRequest(
      feeds: ['user:1', 'stock:apple'],
      text: 'apple stock will go up',
      type: 'post',
    ),
  );
}

Future<void> imageAndVideo() async {
  final imageActivity = await feed.addActivity(
    request: const FeedAddActivityRequest(
      attachments: [
        Attachment(imageUrl: 'https://example.com/image.jpg', type: 'image'),
      ],
      text: 'look at NYC',
      type: 'post',
    ),
  );
}

Future<void> stories() async {
  final tomorrow = DateTime.now().add(const Duration(days: 1));
  final storyActivity = await feed.addActivity(
    request: FeedAddActivityRequest(
      attachments: [
        const Attachment(
          imageUrl: 'https://example.com/image1.jpg',
          type: 'image',
        ),
        const Attachment(
          assetUrl: 'https://example.com/video1.mp4',
          type: 'video',
        ),
      ],
      expiresAt: tomorrow.toIso8601String(),
      text: 'My story',
      type: 'story',
    ),
  );
}

Future<void> addManyActivities() async {
  final activities = [
    const ActivityRequest(
      feeds: ['user:123'],
      id: '1',
      text: 'hi',
      type: 'post',
    ),
    const ActivityRequest(
      feeds: ['user:456'],
      id: '2',
      text: 'hi',
      type: 'post',
    ),
  ];
  final upsertedActivities = await client.upsertActivities(
    activities: activities,
  );
}

Future<void> updatingAndDeletingActivities() async {
  // Update an activity
  final updatedActivity = await feed.updateActivity(
    id: '123',
    request: const UpdateActivityRequest(
      text: 'Updated text',
      custom: {'custom': 'custom'},
    ),
  );
  // Delete an activity

  const hardDelete =
      false; // Soft delete sets deleted at but retains the data, hard delete fully removes it
  await feed.deleteActivity(id: '123', hardDelete: hardDelete);
  // Batch delete activities
  await client.deleteActivities(
    request: const DeleteActivitiesRequest(
      ids: ['123', '456'],
      hardDelete: false,
    ),
  );
}

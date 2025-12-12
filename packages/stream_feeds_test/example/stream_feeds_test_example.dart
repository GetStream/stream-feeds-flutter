// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('Feed Operations Example', () {
    feedTest(
      'gets or creates a feed',
      build: (client) => client.feed(group: 'user', id: 'john'),
      body: (tester) async {
        final result = await tester.getOrCreate();

        expect(result, isA<Result<FeedData>>());
        final feedData = result.getOrThrow();
        expect(feedData.id, 'id');
        expect(feedData.groupId, 'group');
      },
    );

    feedTest(
      'adds activity with text content',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) {
        tester.mockApi(
          (api) => api.addActivity(
            addActivityRequest: any(named: 'addActivityRequest'),
          ),
          result: createDefaultActivityResponse(
            id: 'new-activity',
            type: 'post',
          ),
        );
      },
      body: (tester) async {
        const request = FeedAddActivityRequest(
          type: 'post',
          text: 'Hello, world!',
          custom: <String, Object>{'priority': 'high'},
        );

        final result = await tester.feed.addActivity(request: request);

        expect(result, isA<Result<ActivityData>>());
        expect(result.getOrThrow().id, 'new-activity');
        expect(result.getOrThrow().type, 'post');
      },
    );
  });
}

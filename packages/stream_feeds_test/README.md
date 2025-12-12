# stream_feeds_test

Internal BDD-style test helpers and utilities for testing the Stream Feeds SDK.

## Features

This package provides:
- **Tester classes** for all state objects (Feed, ActivityList, CommentList, etc.)
- **Mock objects** for API and WebSocket testing
- **Helper functions** for creating test data and responses
- **API mocker mixin** for clean test setup and verification

## Usage

Add as a dev dependency in your `pubspec.yaml`:

```yaml
dev_dependencies:
  stream_feeds_test:
    path: ../stream_feeds_test
```

### Example Test

```dart
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('Feed Operations', () {
    feedTest(
      'adds activity successfully',
      build: (client) => client.feed(group: 'user', id: 'john'),
      setUp: (tester) {
        tester.mockApi(
          (api) => api.addActivity(addActivityRequest: any(named: 'addActivityRequest')),
          result: createDefaultActivityResponse(id: 'new-activity'),
        );
      },
      body: (tester) async {
        final result = await tester.feed.addActivity(
          FeedAddActivityRequest(verb: 'post', object: 'picture:1'),
        );

        expect(result, isA<Result<ActivityData>>());
        expect(result.getOrThrow().id, 'new-activity');
      },
      verify: (tester) {
        tester.verifyApi(
          (api) => api.addActivity(addActivityRequest: any(named: 'addActivityRequest')),
        );
      },
    );
  });
}
```

## Available Testers

- `feedTest` - For Feed operations
- `activityTest` - For Activity operations
- `activityListTest` - For ActivityList operations
- `activityCommentListTest` - For ActivityCommentList operations
- `commentListTest` - For CommentList operations
- `commentReplyListTest` - For CommentReplyList operations
- `feedListTest` - For FeedList operations
- `followListTest` - For FollowList operations
- `bookmarkListTest` - For BookmarkList operations
- `bookmarkFolderListTest` - For BookmarkFolderList operations
- `pollListTest` - For PollList operations
- `pollVoteListTest` - For PollVoteList operations

## Helper Functions

All test data factories from `test_data.dart` are available for creating mock responses:
- `createDefaultActivityResponse()`
- `createDefaultGetOrCreateFeedResponse()`
- `createDefaultCommentResponse()`
- And many more...

## API Mocking

Use the `ApiMockerMixin` methods in your testers:
- `mockApi()` - Set up a successful API response
- `mockApiResult()` - Set up a custom Result (success or failure)
- `verifyApi()` - Verify an API call was made once
- `verifyApiCalled()` - Verify an API call was made N times
- `verifyNeverCalled()` - Verify an API call was never made

## WebSocket Testing

Emit WebSocket events in your tests:

```dart
await tester.emitEvent(ActivityAddedFeedEvent(...));
await tester.pump(); // Wait for event processing
```

## License

Internal package - not for public distribution.

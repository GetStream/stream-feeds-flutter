# StreamFeeds (Flutter)

This is the official Flutter SDK for StreamFeeds, a platform for building apps with activity feeds support. The repository includes a low-level SDK that communicates with Stream's backend, as well as a demo app that showcases how to use it.

For detailed examples and supported features, please check out our [docs](https://getstream.io/activity-feeds/docs/flutter/).

Note: Activity Feeds V3 is in closed alpha — do not use it in production (just yet).

## What is Stream?

Stream allows developers to rapidly deploy scalable feeds, chat messaging and video with an industry leading 99.999% uptime SLA guarantee.

Stream lets you build **activity feeds at scale**. The largest apps on Stream have over **100 M+ users**.
V3 keeps that scalability while giving you more flexibility over the content shown in your feed.

## What’s new in Feeds V3

- **For-You feed**: Most modern apps combine a “For You” feed with a regular “Following” feed. V3 introduces **activity selectors** so you can:
  - surface popular activities
  - show activities near the user
  - match activities to a user’s interests
  - mix-and-match these selectors to build an engaging personalized feed.

- **Performance**: 20–30 % faster flat feeds. Major speedups for aggregation & ranking (full benchmarks coming soon)

- **Client-side SDKs**

- **Activity filtering**: Filter activity feeds with almost no hit to performance

- **Comments**: Voting, ranking, threading, images, URL previews, @mentions & notifications. Basically all the features of Reddit style commenting systems.

- **Advanced feed features**:
  - Activity expiration
  - visibility controls
  - feed visibility levels
  - feed members
  - bookmarking
  - follow-approval flow
  - stories support.

- **Search & queries**: Activity search, **query activities**, and **query feeds** endpoints.

- **Modern essentials**:
  - Permissions
  - OpenAPI spec
  - GDPR endpoints
  - realtime WebSocket events
  - push notifications
  - “own capabilities” API.

## 🚀 Getting Started

### Installation

The Flutter SDK for Stream Feeds is distributed through [pub.dev](https://pub.dev).

Currently we only have a package for the low level Feeds client: [stream_feed](https://pub.dev/packages/stream_feed).
Releases and changes are published on the [GitHub releases page](https://github.com/GetStream/stream-feeds-flutter/releases).

### Adding the SDK to your project

To add the Flutter SDK, you can add the latest dependencies for the SDK to your `pubspec.yaml` file:

```yaml
dependencies:
stream_feed: ^latest
```
Additionally, you can also run the `flutter pub add` command in the terminal to do this:

```shell
flutter pub add stream_feed
```

This command will automatically install the latest versions of the Stream SDK package from pub.dev to the dependencies section of your `pubspec.yaml`.

### Basic Usage

To get started, you need to create a `StreamFeedsClient` with your API key and a token.

Afterwards, it's pretty straightforward to start adding feeds and activities.

Check our docs for more details.

```dart
// Import the package
import 'package:stream_feed/stream_feed.dart';

// Initialize the client
final client = StreamFeedsClient(
  apiKey: '<your_api_key>',
  user: User(id: 'john'),
  tokenProvider: TokenProvider.static(UserToken('<user_token>')),
);

await client.connect();

// Create a feed (or get its data if exists)
final feed = client.feed(group: 'user', id: 'john');
final result = await feed.getOrCreate();

// Add activity
final activity = await feed.addActivity(
  request: FeedAddActivityRequest(type: 'post', text: 'Hello, Stream Feeds!'),
);
```

## 📖 Key Concepts

### Activities

Activities are the core content units in Stream Feeds. They can represent posts, photos, videos, polls, and any custom content type you define.

### Feeds

Feeds are collections of activities. They can be personal feeds, timeline feeds, notification feeds, or custom feeds for your specific use case.

### Real-time Updates

Stream Feeds provides real-time updates through WebSocket connections, ensuring your app stays synchronized with the latest content.

### Social Features

Built-in support for reactions, comments, bookmarks, and polls makes it easy to build engaging social experiences.

## 👩‍💻 Free for Makers 👨‍💻

Stream is free for most side and hobby projects. To qualify, your project/company needs to have < 5 team members and < $10k in monthly revenue. Makers get $100 in monthly credit for video for free.

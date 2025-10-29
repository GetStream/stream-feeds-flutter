import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

/// Get your own credentials from Stream.
/// For more detailed documentation and examples, visit:
/// https://getstream.io/activity-feeds/docs/flutter/
const apiKey = '';
const userId = '';
const userToken = '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stream Feeds Example', home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamFeedsClient client;
  late Future<void> connectionFuture;

  @override
  void initState() {
    super.initState();
    client = StreamFeedsClient(
      apiKey: apiKey,
      user: User(id: userId),
      tokenProvider: TokenProvider.static(UserToken(userToken)),
    );
    connectionFuture = client.connect();
  }

  @override
  void dispose() {
    client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Feeds Example')),
      body: FutureBuilder(
        future: connectionFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return MyTimeLine(client: client);
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MyTimeLine extends StatefulWidget {
  const MyTimeLine({super.key, required this.client});
  final StreamFeedsClient client;

  @override
  State<MyTimeLine> createState() => _MyTimeLineState();
}

class _MyTimeLineState extends State<MyTimeLine> {
  late final Feed feed;

  @override
  void initState() {
    super.initState();
    feed = widget.client.feedFromId(FeedId.timeline(userId));
    feed.getOrCreate();
  }

  @override
  void dispose() {
    feed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: feed.notifier,
      builder: (context, state, child) {
        return ListView.separated(
          itemCount: state.activities.length + 1,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            if (index == state.activities.length) {
              if (state.canLoadMoreActivities) {
                return TextButton(
                  onPressed: () {
                    feed.queryMoreActivities();
                  },
                  child: const Text('Load more'),
                );
              } else {
                return const Text('No more activities');
              }
            }

            return ActivityItem(activity: state.activities[index]);
          },
        );
      },
    );
  }
}

class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key, required this.activity});

  final ActivityData activity;

  @override
  Widget build(BuildContext context) {
    // Simple activity item with the activity text and an image if it has one
    final userImage = activity.user.image;
    final imageAttachment = activity.attachments.firstWhereOrNull(
      (attachment) => attachment.imageUrl != null,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundImage:
                  userImage != null ? NetworkImage(userImage) : null,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(activity.user.name?.characters.first ?? ''),
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (imageAttachment != null)
                  SizedBox(
                    height: 200,
                    child: Image.network(imageAttachment.imageUrl!),
                  ),
                Text(activity.text ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

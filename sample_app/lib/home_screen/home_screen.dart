import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../navigation/app_state.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AppStateProvider appStateProvider =
      GetIt.instance.get<AppStateProvider>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              appStateProvider.clearUserId();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: appStateProvider,
        builder: (context, appState, child) => switch (appState) {
          LoggedInState() => _FeedList(feedsClient: appState.feedsClient),
          _ => const Center(
              child: Text('Please login, you should not be here.'),
            )
        },
      ),
    );
  }
}

class _FeedList extends StatefulWidget {
  const _FeedList({required this.feedsClient});
  final StreamFeedsClient feedsClient;

  @override
  State<_FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<_FeedList> {
  late Feed feed;

  @override
  void initState() {
    super.initState();
    _createFeed();
  }

  @override
  void didUpdateWidget(covariant _FeedList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.feedsClient.user.id != widget.feedsClient.user.id) {
      _disposeFeed();
      _createFeed();
    }
  }

  @override
  void dispose() {
    _disposeFeed();
    super.dispose();
  }

  void _createFeed() {
    feed = widget.feedsClient.feed(
      'user',
      widget.feedsClient.user.id,
    )..getOrCreate();
  }

  void _disposeFeed() {
    //todo stop listening to the feed
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: feed.state,
      builder: (context, state, child) => RefreshIndicator(
        onRefresh: () => feed.getOrCreate(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
            itemCount: state.activities.length,
            itemBuilder: (context, index) {
              final activity = state.activities[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: switch (activity.user.image) {
                    final String imageUrl =>
                      CachedNetworkImageProvider(imageUrl),
                    _ => null,
                  },
                  child: switch (activity.user.image) {
                    String _ => null,
                    _ => Text(
                        activity.user.name?.substring(0, 1).toUpperCase() ??
                            '?',
                      ),
                  },
                ),
                title: Text(activity.user.name ?? 'unknown user'),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.text ?? 'empty message'),
                    Text('${activity.reactionCount} reactions'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

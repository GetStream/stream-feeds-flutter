import 'package:flutter/widgets.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

late StreamFeedsClient client;
late Feed feed;

Future<void> gettingStarted() async {
  // Import the package
  // import 'package:stream_feeds/stream_feeds.dart';

  // Initialize the client
  final client = StreamFeedsClient(
    apiKey: '<your_api_key>',
    user: const User(id: 'john'),
    tokenProvider: TokenProvider.static(UserToken('<user_token>')),
  );
  await client.connect();

  // Create a feed (or get its data if exists)
  final feed = client.feed(group: 'user', id: 'john');
  final result = await feed.getOrCreate();

  // Add activity
  final activity = await feed.addActivity(
    request: const FeedAddActivityRequest(
      type: 'post',
      text: 'Hello, Stream Feeds!',
    ),
  );
}

Future<void> socialMediaFeed() async {
  // Create a timeline feed
  final timeline = client.feed(group: 'timeline', id: 'john');
  await timeline.getOrCreate();

  // Add a reaction to activity
  await timeline.addReaction(
    activityId: 'activity_123',
    request: const AddReactionRequest(type: 'like'),
  );

  // Add a comment to activity
  await timeline.addComment(
    request: const ActivityAddCommentRequest(
      comment: 'Great post!',
      activityId: 'activity_123',
    ),
  );

  // Add a reaction to comment
  final activity = client.activity(
    activityId: 'activity_123',
    fid: const FeedId(group: 'timeline', id: 'john'),
  );

  await activity.addCommentReaction(
    commentId: 'commentId',
    request: const AddCommentReactionRequest(type: 'like'),
  );
}

Future<void> notificationFeed() async {
  // Create a notification feed
  final notifications = client.feed(group: 'notification', id: 'john');
  await notifications.getOrCreate();

  // Mark notifications as read
  await notifications.markActivity(
    request: const MarkActivityRequest(markAllRead: true),
  );
}

Future<void> polls() async {
  // Create a poll
  const feedId = FeedId(group: 'timeline', id: 'john');
  final feed = client.feedFromId(feedId);
  final result = await feed.createPoll(
    request: const CreatePollRequest(
      name: "What's your favorite color?",
      options: [
        PollOptionInput(text: 'Red'),
        PollOptionInput(text: 'Blue'),
        PollOptionInput(text: 'Green'),
      ],
    ),
    activityType: 'poll',
  );

  // Vote on a poll
  final activityData = result.getOrThrow();
  final activity = client.activity(activityId: activityData.id, fid: feedId);
  await activity.castPollVote(
    const CastPollVoteRequest(vote: VoteData(optionId: 'option_456')),
  );
}

Future<void> customActivityTypes() async {
  final workoutActivity = await feed.addActivity(
    request: const FeedAddActivityRequest(
      text: 'Just finished my run',
      custom: {'distance': 5.2, 'duration': 1800, 'calories': 450},
      type: 'workout',
    ),
  );
}

// Real-time updates with StateLayer

// imports
// import 'package:flutter/widgets.dart';
// import 'package:flutter_state_notifier/flutter_state_notifier.dart';
// import 'package:stream_feeds/stream_feeds.dart';
class FeedView extends StatefulWidget {
  const FeedView({super.key, required this.feed});
  final Feed feed;

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  void initState() {
    super.initState();
    widget.feed.getOrCreate();
  }

  @override
  void dispose() {
    widget.feed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: widget.feed.notifier,
      builder: (BuildContext context, FeedState state, Widget? child) {
        return Text(state.feed?.name ?? '');
      },
    );
  }
}

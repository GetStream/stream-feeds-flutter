import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../../core/di/di_initializer.dart';
import 'poll_message.dart';

class ShowPollWidget extends StatefulWidget {
  const ShowPollWidget({
    super.key,
    required this.feed,
    required this.activity,
    required this.poll,
  });
  final Feed feed;
  final ActivityData activity;
  final PollData poll;

  @override
  State<ShowPollWidget> createState() => _ShowPollWidgetState();
}

class _ShowPollWidgetState extends State<ShowPollWidget> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();
  late Activity activity;

  @override
  void initState() {
    super.initState();
    _getActivity();
  }

  @override
  void didUpdateWidget(covariant ShowPollWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activity.id != widget.activity.id) {
      activity.dispose();
      _getActivity();
    }
  }

  @override
  void dispose() {
    activity.dispose();
    super.dispose();
  }

  void _getActivity() {
    // Because we already have up to date initial data, we don't need to fetch it again.
    // The activity is being updated in real-time while this widget lives.
    activity = client.activity(
      activityId: widget.activity.id,
      fid: widget.feed.fid,
      initialData: widget.activity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: activity.notifier,
      builder: (context, state, child) {
        final poll = state.poll ?? widget.poll;
        return PollMessage(
          poll: poll,
          activity: activity,
          currentUser: client.user,
        );
      },
    );
  }
}

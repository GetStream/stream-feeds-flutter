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

class _ShowPollWidgetState extends State<ShowPollWidget>
    with AutomaticKeepAliveClientMixin {
  StreamFeedsClient get client => locator<StreamFeedsClient>();
  late Activity activity;

  @override
  bool get wantKeepAlive => true;

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
    activity = client.activity(
      activityId: widget.activity.id,
      fid: widget.feed.fid,
      initialData: widget.activity,
    );

    activity.get().ignore();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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

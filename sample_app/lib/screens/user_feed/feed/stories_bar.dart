import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/attachments/attachment_widget.dart';
import '../../../widgets/user_avatar.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar(this.storiesFeed, {super.key});

  final Feed storiesFeed;

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: storiesFeed.notifier,
      builder: (context, state, child) {
        final stories = state.aggregatedActivities;
        if (stories.isEmpty) {
          return const SizedBox.shrink();
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: stories
                .map((story) => _StoryItem(story, _onActivityWatched))
                .toList(),
          ),
        );
      },
    );
  }

  void _onActivityWatched(String activityId) {
    storiesFeed.markActivity(
      request: MarkActivityRequest(markWatched: [activityId]),
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem(
    this.storyGroup,
    this.activityWatched,
  );
  final AggregatedActivityData storyGroup;
  final ValueSetter<String> activityWatched;

  @override
  Widget build(BuildContext context) {
    final user = storyGroup.activities.first.user.toUser();

    final hasNewStory = storyGroup.activities.any(
      (activity) => activity.isWatched != true,
    );

    return InkWell(
      onTap: () => _FullScreenStory.show(context, storyGroup, activityWatched),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: hasNewStory
              ? BoxDecoration(
                  color: context.appColors.accentPrimary,
                  shape: BoxShape.circle,
                )
              : null,
          child: UserAvatar.listTile(user: user),
        ),
      ),
    );
  }
}

class _FullScreenStory extends StatefulWidget {
  const _FullScreenStory(
    this.storyGroup,
    this.activityWatched,
  );
  final AggregatedActivityData storyGroup;
  final ValueSetter<String> activityWatched;

  static void show(
    BuildContext context,
    AggregatedActivityData storyGroup,
    ValueSetter<String> activityWatched,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: _FullScreenStory(storyGroup, activityWatched),
      ),
    );
  }

  @override
  State<_FullScreenStory> createState() => _FullScreenStoryState();
}

class _FullScreenStoryState extends State<_FullScreenStory>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _onNextStory();
      }
    });
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int index = 0;
  ActivityData get currentStory => widget.storyGroup.activities[index];

  @override
  Widget build(BuildContext context) {
    final currentStory = this.currentStory;
    final attachment = currentStory.attachments.firstOrNull;

    return GestureDetector(
      onTap: _onNextStory,
      child: Stack(
        children: [
          if (attachment case final attachment?)
            AttachmentWidget(attachment: attachment)
          else
            Container(
              color: context.appColors.disabled,
              alignment: Alignment.center,
              child: UserAvatar.large(user: currentStory.user.toUser()),
            ),
          if (currentStory.text case final text?)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: context.appColors.barsBg.withValues(alpha: 0.5),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  style: context.appTextStyles.headlineBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              spacing: 8,
              children: [
                for (var i = 0; i < widget.storyGroup.activities.length; i++)
                  Expanded(
                    child: i == index
                        ? AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) => Row(
                              children: [
                                Expanded(
                                  flex: (_animation.value * 1000).toInt(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: context.appColors.accentPrimary,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                    height: 16,
                                  ),
                                ),
                                Expanded(
                                  flex: ((1 - _animation.value) * 1000).toInt(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: context.appColors.accentPrimary
                                          .withValues(alpha: 0.3),
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    height: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: context.appColors.accentPrimary
                                  .withValues(alpha: i <= index ? 1.0 : 0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 16,
                          ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onNextStory() {
    if (currentStory.isWatched != true) {
      widget.activityWatched(currentStory.id);
    }

    final stories = widget.storyGroup.activities;
    if (index < stories.length - 1) {
      setState(() {
        index++;
      });
      _animationController.forward(from: 0);
    } else {
      Navigator.of(context).pop();
    }
  }
}

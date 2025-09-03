import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../theme/extensions/theme_extensions.dart';
import '../../widgets/user_avatar.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.feedsClient,
    required this.feed,
  });

  final StreamFeedsClient feedsClient;
  final Feed feed;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  List<FeedData>? followSuggestions;

  @override
  void initState() {
    super.initState();
    widget.feed.queryFollowSuggestions();
    _queryFollowSuggestions();
  }

  @override
  void didUpdateWidget(covariant ProfileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.feed != widget.feed) {
      _queryFollowSuggestions();
    }
  }

  Future<void> _queryFollowSuggestions() async {
    followSuggestions = null;
    final result = await widget.feed.queryFollowSuggestions();
    setState(() {
      followSuggestions = result.getOrNull();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: widget.feed.notifier,
      builder: (context, state, child) {
        final feedMembers = state.members;
        final following = state.following;
        final followers = state.followers;

        return ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text('Profile', style: context.appTextStyles.headlineBold),
            ),
            ProfileItem.text(
              title: 'Feed members',
              value: feedMembers.isEmpty
                  ? 'No feed members'
                  : feedMembers
                      .map((member) => member.user.name ?? member.user.id)
                      .join(', '),
            ),
            const Divider(),
            ProfileItem(
              title: 'Following',
              child: following.isEmpty
                  ? const Text('You are not following anyone')
                  : Column(
                      children: following.map((follow) {
                        final feed = follow.targetFeed;

                        return _FollowerItem(
                          follower: feed,
                          buttonText: 'Unfollow',
                          onButtonPressed: () =>
                              widget.feed.unfollow(targetFid: feed.fid),
                        );
                      }).toList(),
                    ),
            ),
            const Divider(),
            ProfileItem(
              title: 'Followers',
              child: followers.isEmpty
                  ? const Text('You have no followers')
                  : Column(
                      children: following.map((follow) {
                        final feed = follow.sourceFeed;

                        return _FollowerItem(
                          follower: feed,
                          buttonText: 'Remove follower',
                          onButtonPressed: () =>
                              widget.feed.unfollow(targetFid: feed.fid),
                        );
                      }).toList(),
                    ),
            ),
            if (followSuggestions != null) ...[
              const Divider(),
              _FollowSuggestionsWidget(
                followSuggestions: followSuggestions!,
                onFollowPressed: (suggestion) {
                  widget.feed.follow(targetFid: suggestion.fid);
                  setState(() {
                    followSuggestions = followSuggestions
                        ?.where((it) => it != suggestion)
                        .toList();
                  });
                },
              ),
            ]
          ],
        );
      },
    );
  }
}

class _FollowerItem extends StatelessWidget {
  const _FollowerItem({
    super.key,
    required this.follower,
    required this.buttonText,
    required this.onButtonPressed,
  });
  final FeedData follower;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(follower.createdBy.name ?? follower.createdBy.id)),
        TextButton(onPressed: onButtonPressed, child: Text(buttonText)),
      ],
    );
  }
}

class _FollowSuggestionsWidget extends StatelessWidget {
  const _FollowSuggestionsWidget({
    required this.followSuggestions,
    required this.onFollowPressed,
  });
  final List<FeedData> followSuggestions;
  final ValueSetter<FeedData> onFollowPressed;

  @override
  Widget build(BuildContext context) {
    return ProfileItem(
      title: 'Who to follow',
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: followSuggestions
              .map(
                (suggestion) => _FollowSuggestionWidget(
                  owner: suggestion.createdBy,
                  followedFeed: suggestion.fid,
                  onFollowPressed: () => onFollowPressed(suggestion),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _FollowSuggestionWidget extends StatelessWidget {
  const _FollowSuggestionWidget({
    super.key,
    required this.owner,
    required this.followedFeed,
    required this.onFollowPressed,
  });
  final UserData owner;
  final FeedId followedFeed;
  final VoidCallback onFollowPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserAvatar.small(
            user: User(id: owner.id, name: owner.name, image: owner.image),
          ),
          Text(owner.name ?? owner.id),
          TextButton(onPressed: onFollowPressed, child: const Text('Follow')),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.child,
  });

  factory ProfileItem.text({
    required String title,
    required String value,
  }) {
    return ProfileItem(
      title: title,
      child: Text(value),
    );
  }

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.appTextStyles.bodyBold),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

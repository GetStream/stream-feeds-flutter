import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../core/di/di_initializer.dart';
import 'profile_header.dart';
import 'profile_list_item.dart';
import 'profile_section.dart';

int _sortFeedsByCreatorName(FeedData a, FeedData b) {
  final nameA = a.createdBy.id;
  final nameB = b.createdBy.id;
  return nameA.toLowerCase().compareTo(nameB.toLowerCase());
}

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    required this.userFeed,
    required this.timelineFeed,
    this.scrollController,
  });

  /// User feed is to post new activities to the user's feed
  final Feed userFeed;

  /// Timeline feed shows what the user is following
  final Feed timelineFeed;
  final ScrollController? scrollController;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();

  List<FeedData>? followSuggestions;

  @override
  void initState() {
    super.initState();
    _queryFollowSuggestions();
  }

  @override
  void didUpdateWidget(covariant UserProfile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userFeed != widget.userFeed) {
      _queryFollowSuggestions();
    }
  }

  Future<void> _queryFollowSuggestions() async {
    final result = await widget.userFeed.queryFollowSuggestions();
    if (mounted) _updateFollowSuggestions(result.getOrNull());
  }

  void _updateFollowSuggestions(List<FeedData>? suggestions) {
    final updatedSuggestions = suggestions?.sorted(_sortFeedsByCreatorName);
    setState(() => followSuggestions = updatedSuggestions);
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: widget.timelineFeed.notifier,
      builder: (context, timelineState, child) {
        return StateNotifierBuilder(
          stateNotifier: widget.userFeed.notifier,
          builder: (context, userState, child) {
            return _UserProfileContent(
              client: client,
              timelineState: timelineState,
              userState: userState,
              followSuggestions: followSuggestions,
              scrollController: widget.scrollController,
              onAcceptFollow: (fid) => widget.userFeed.acceptFollow(
                sourceFid: fid,
              ),
              onRejectFollow: (fid) => widget.userFeed.rejectFollow(
                sourceFid: fid,
              ),
              onFollow: (targetFeed) async {
                final result = await widget.timelineFeed.follow(
                  targetFid: targetFeed.feed,
                  createNotificationActivity: true,
                );

                // Remove the followed user from suggestions
                result.onSuccess(
                  (_) => _updateFollowSuggestions([
                    ...?followSuggestions?.where((it) => it != targetFeed),
                  ]),
                );
              },
              onUnfollow: (targetFeed) async {
                final result = await widget.timelineFeed.unfollow(
                  targetFid: targetFeed.feed,
                );

                // Add the unfollowed user back to suggestions
                result.onSuccess(
                  (_) => _updateFollowSuggestions(
                    [...?followSuggestions, targetFeed],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _UserProfileContent extends StatelessWidget {
  const _UserProfileContent({
    required this.client,
    required this.timelineState,
    required this.userState,
    required this.followSuggestions,
    required this.scrollController,
    required this.onAcceptFollow,
    required this.onRejectFollow,
    required this.onFollow,
    required this.onUnfollow,
  });

  final StreamFeedsClient client;
  final FeedState timelineState;
  final FeedState userState;
  final List<FeedData>? followSuggestions;
  final ScrollController? scrollController;

  final ValueSetter<FeedId> onAcceptFollow;
  final ValueSetter<FeedId> onRejectFollow;
  final ValueSetter<FeedData> onFollow;
  final ValueSetter<FeedData> onUnfollow;

  @override
  Widget build(BuildContext context) {
    final currentUser = client.user;
    final feedMembers = timelineState.members;

    // We always follow ourselves, so we don't need to show it in the following list
    final following = timelineState.following
        .where((it) => it.targetFeed.id != currentUser.id)
        .toList();
    final followingCount = math.max(
      0,
      (timelineState.feed?.followingCount ?? 0) - 1,
    );
    final followersCount = math.max(
      0,
      (userState.feed?.followerCount ?? 0) - 1,
    );

    final followRequests = userState.followRequests;

    final followIncludesCurrentUser = following
            .any((it) => it.targetFeed.id == currentUser.id) ||
        (followSuggestions?.any((it) => it.feed.id == currentUser.id) ?? false);

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          // Profile Header Section
          ProfileHeader(
            user: currentUser,
            membersCount: timelineState.feed?.memberCount ?? 0,
            followingCount: followingCount,
            followersCount: followersCount,
          ),

          // Members Section
          ProfileSection<FeedMemberData>(
            title: 'Members',
            items: feedMembers,
            emptyMessage: 'No members yet',
            itemBuilder: (member) => MemberListItem(member: member),
          ),

          // Follow Requests Section
          ProfileSection<FollowData>(
            title: 'Follow Requests',
            items: followRequests,
            emptyMessage: 'No pending requests',
            itemBuilder: (followRequest) => FollowRequestListItem(
              followRequest: followRequest,
              onAcceptPressed: () =>
                  onAcceptFollow(followRequest.sourceFeed.feed),
              onRejectPressed: () =>
                  onRejectFollow(followRequest.sourceFeed.feed),
            ),
          ),

          // Following Section
          ProfileSection<FollowData>(
            title: 'Following',
            count: followingCount,
            items: following,
            emptyMessage: 'Not following anyone yet',
            itemBuilder: (follow) => FollowingListItem(
              follow: follow,
              onUnfollowPressed: () {
                onUnfollow(follow.targetFeed);
              },
            ),
          ),

          // Follow Suggestions Section
          ProfileSection<FeedData>(
            title: 'Suggested',
            items: [
              if (!followIncludesCurrentUser && userState.feed != null)
                userState.feed!,
              ...(followSuggestions ?? []),
            ],
            emptyMessage: 'No suggestions available',
            itemBuilder: (suggestion) => SuggestionListItem(
              suggestion: suggestion,
              onFollowPressed: () {
                onFollow(suggestion);
              },
            ),
          ),
        ],
      ),
    );
  }
}

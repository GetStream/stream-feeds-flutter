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

class UserProfileView extends StatefulWidget {
  const UserProfileView({
    super.key,
    required this.feed,
    this.scrollController,
  });

  final Feed feed;
  final ScrollController? scrollController;

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();

  List<FeedData>? followSuggestions;

  @override
  void initState() {
    super.initState();
    _queryFollowSuggestions();
  }

  @override
  void didUpdateWidget(covariant UserProfileView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.feed != widget.feed) _queryFollowSuggestions();
  }

  Future<void> _queryFollowSuggestions() async {
    final result = await widget.feed.queryFollowSuggestions();
    if (mounted) _updateFollowSuggestions(result.getOrNull());
  }

  void _updateFollowSuggestions(List<FeedData>? suggestions) {
    final updatedSuggestions = suggestions?.sorted(_sortFeedsByCreatorName);
    setState(() => followSuggestions = updatedSuggestions);
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: widget.feed.notifier,
      builder: (context, state, child) {
        final feedMembers = state.members;
        final followRequests = state.followRequests;
        final following = state.following;
        final followers = state.followers;
        final currentUser = client.user;

        return SingleChildScrollView(
          controller: widget.scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              // Profile Header Section
              ProfileHeader(
                user: currentUser,
                membersCount: feedMembers.length,
                followingCount: following.length,
                followersCount: followers.length,
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
                  onAcceptPressed: () => widget.feed.acceptFollow(
                    sourceFid: followRequest.sourceFeed.fid,
                  ),
                  onRejectPressed: () => widget.feed.rejectFollow(
                    sourceFid: followRequest.sourceFeed.fid,
                  ),
                ),
              ),

              // Following Section
              ProfileSection<FollowData>(
                title: 'Following',
                items: following,
                emptyMessage: 'Not following anyone yet',
                itemBuilder: (follow) => FollowingListItem(
                  follow: follow,
                  onUnfollowPressed: () async {
                    final result = await widget.feed.unfollow(
                      targetFid: follow.targetFeed.fid,
                    );

                    // Add the unfollowed user back to suggestions
                    result.onSuccess(
                      (_) => _updateFollowSuggestions(
                        [...?followSuggestions, follow.targetFeed],
                      ),
                    );
                  },
                ),
              ),

              // Follow Suggestions Section
              ProfileSection<FeedData>(
                title: 'Suggested',
                items: followSuggestions ?? [],
                emptyMessage: 'No suggestions available',
                itemBuilder: (suggestion) => SuggestionListItem(
                  suggestion: suggestion,
                  onFollowPressed: () async {
                    final result = await widget.feed.follow(
                      targetFid: suggestion.fid,
                    );

                    // Remove the followed user from suggestions
                    result.onSuccess(
                      (_) => _updateFollowSuggestions([
                        ...?followSuggestions?.where((it) => it != suggestion),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

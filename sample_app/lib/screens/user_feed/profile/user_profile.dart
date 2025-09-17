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
    this.scrollController,
  });

  final Feed userFeed;
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
    if (oldWidget.userFeed != widget.userFeed) _queryFollowSuggestions();
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
      stateNotifier: widget.userFeed.notifier,
      builder: (context, state, child) {
        final feedMembers = state.members;
        final followRequests = state.followRequests;
        final following = state.following;
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
                membersCount: state.feed?.memberCount ?? 0,
                followingCount: state.feed?.followingCount ?? 0,
                followersCount: state.feed?.followerCount ?? 0,
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
                  onAcceptPressed: () => widget.userFeed.acceptFollow(
                    sourceFid: followRequest.sourceFeed.fid,
                  ),
                  onRejectPressed: () => widget.userFeed.rejectFollow(
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
                    final result = await widget.userFeed.unfollow(
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
                    final result = await widget.userFeed.follow(
                      targetFid: suggestion.fid,
                      createNotificationActivity: true,
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

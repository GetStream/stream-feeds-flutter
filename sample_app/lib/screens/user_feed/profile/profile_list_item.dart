import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/user_avatar.dart';

class MemberListItem extends StatelessWidget {
  const MemberListItem({super.key, required this.member});

  final FeedMemberData member;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar.listTile(
        user: User(
          id: member.user.id,
          name: member.user.name,
          image: member.user.image,
        ),
      ),
      title: Text(
        member.user.name ?? member.user.id,
        style: context.appTextStyles.body,
      ),
      subtitle: Text(
        '@${member.user.id}',
        style: context.appTextStyles.footnote.copyWith(
          color: context.appColors.textLowEmphasis,
        ),
      ),
      trailing: Chip(
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
        label: Text(member.role, style: context.appTextStyles.footnoteBold),
        backgroundColor: context.appColors.accentInfo,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

class FollowRequestListItem extends StatelessWidget {
  const FollowRequestListItem({
    super.key,
    required this.followRequest,
    required this.onAcceptPressed,
    required this.onRejectPressed,
  });

  final FollowData followRequest;
  final VoidCallback onAcceptPressed;
  final VoidCallback onRejectPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar.listTile(
        user: User(
          id: followRequest.sourceFeed.createdBy.id,
          name: followRequest.sourceFeed.createdBy.name,
          image: followRequest.sourceFeed.createdBy.image,
        ),
      ),
      title: Text(
        followRequest.sourceFeed.createdBy.name ??
            followRequest.sourceFeed.createdBy.id,
        style: context.appTextStyles.body,
      ),
      subtitle: Text(
        maxLines: 1,
        '@${followRequest.sourceFeed.createdBy.id}',
        overflow: TextOverflow.ellipsis,
        style: context.appTextStyles.footnote.copyWith(
          color: context.appColors.textLowEmphasis,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          OutlinedButton(
            onPressed: onRejectPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              foregroundColor: context.appColors.accentError,
              side: BorderSide(color: context.appColors.accentError),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: context.appTextStyles.footnoteBold,
            ),
            child: const Text('Reject'),
          ),
          OutlinedButton(
            onPressed: onAcceptPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              foregroundColor: context.appColors.accentPrimary,
              side: BorderSide(color: context.appColors.accentPrimary),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: context.appTextStyles.footnoteBold,
            ),
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }
}

class FollowingListItem extends StatelessWidget {
  const FollowingListItem({
    super.key,
    required this.follow,
    required this.onUnfollowPressed,
  });

  final FollowData follow;
  final VoidCallback onUnfollowPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar.listTile(
        user: User(
          id: follow.targetFeed.createdBy.id,
          name: follow.targetFeed.createdBy.name,
          image: follow.targetFeed.createdBy.image,
        ),
      ),
      title: Text(
        follow.targetFeed.createdBy.name ?? follow.targetFeed.createdBy.id,
        style: context.appTextStyles.body,
      ),
      subtitle: Text(
        maxLines: 1,
        '@${follow.targetFeed.createdBy.id}',
        overflow: TextOverflow.ellipsis,
        style: context.appTextStyles.footnote.copyWith(
          color: context.appColors.textLowEmphasis,
        ),
      ),
      trailing: OutlinedButton(
        onPressed: onUnfollowPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          foregroundColor: context.appColors.accentError,
          side: BorderSide(color: context.appColors.accentError),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: context.appTextStyles.footnoteBold,
        ),
        child: const Text('Unfollow'),
      ),
    );
  }
}

class SuggestionListItem extends StatelessWidget {
  const SuggestionListItem({
    super.key,
    required this.suggestion,
    required this.onFollowPressed,
  });

  final FeedData suggestion;
  final VoidCallback onFollowPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserAvatar.listTile(
        user: User(
          id: suggestion.createdBy.id,
          name: suggestion.createdBy.name,
          image: suggestion.createdBy.image,
        ),
      ),
      title: Text(
        '${suggestion.createdBy.name ?? suggestion.createdBy.id}${suggestion.groupId == 'user' ? '' : ' (${suggestion.groupId})'}',
        style: context.appTextStyles.body,
      ),
      subtitle: Text(
        maxLines: 1,
        '@${suggestion.createdBy.id}',
        overflow: TextOverflow.ellipsis,
        style: context.appTextStyles.footnote.copyWith(
          color: context.appColors.textLowEmphasis,
        ),
      ),
      trailing: OutlinedButton(
        onPressed: onFollowPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          foregroundColor: context.appColors.accentPrimary,
          side: BorderSide(color: context.appColors.accentPrimary),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: context.appTextStyles.footnoteBold,
        ),
        child: const Text('Follow'),
      ),
    );
  }
}

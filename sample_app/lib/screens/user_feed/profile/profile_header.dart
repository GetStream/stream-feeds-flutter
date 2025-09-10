import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../widgets/user_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.membersCount,
    required this.followingCount,
    required this.followersCount,
  });

  final User user;
  final int membersCount;
  final int followingCount;
  final int followersCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side - Avatar and User Info
        Column(
          children: [
            UserAvatar.large(user: user),
            const SizedBox(height: 8),
            Text(
              user.name,
              textAlign: TextAlign.center,
              style: context.appTextStyles.bodyBold,
            ),
            Text(
              '@${user.id}',
              textAlign: TextAlign.center,
              style: context.appTextStyles.footnote.copyWith(
                color: context.appColors.textLowEmphasis,
              ),
            ),
          ],
        ),
        const SizedBox(width: 32),
        // Right side - Stats Box
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: context.appColors.borders),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntrinsicHeight(
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _StatColumn(
                      count: membersCount,
                      label: 'Members',
                    ),
                  ),
                  VerticalDivider(
                    width: 1,
                    color: context.appColors.borders,
                  ),
                  Expanded(
                    child: _StatColumn(
                      count: followingCount,
                      label: 'Following',
                    ),
                  ),
                  VerticalDivider(
                    width: 1,
                    color: context.appColors.borders,
                  ),
                  Expanded(
                    child: _StatColumn(
                      count: followersCount,
                      label: 'Followers',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.count,
    required this.label,
  });

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          count.toString(),
          style: context.appTextStyles.headlineBold,
        ),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appTextStyles.footnote.copyWith(
            color: context.appColors.textLowEmphasis,
          ),
        ),
      ],
    );
  }
}

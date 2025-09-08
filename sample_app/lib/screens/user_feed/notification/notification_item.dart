import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.activity,
    required this.isUnread,
    this.onTap,
  });

  final AggregatedActivityData activity;
  final bool isUnread;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _buildNotificationIcon(context),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNotificationText(context),
                  const SizedBox(height: 4),
                  Text(
                    activity.updatedAt.displayRelativeTime,
                    style: context.appTextStyles.footnote.copyWith(
                      color: context.appColors.textLowEmphasis,
                    ),
                  ),
                ],
              ),
            ),
            if (isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: context.appColors.accentPrimary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    final notificationType = activity.notificationType;

    final iconData = switch (notificationType) {
      'follow' => Icons.person_add,
      'comment' => Icons.chat_bubble_outline,
      'reaction' => Icons.favorite_outline,
      'comment_reaction' => Icons.thumb_up,
      'mention' => Icons.alternate_email,
      _ => Icons.notifications_outlined,
    };

    final iconColor = switch (notificationType) {
      'reaction' || 'comment_reaction' => context.appColors.accentError,
      _ => context.appColors.accentPrimary,
    };

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
    );
  }

  Widget _buildNotificationText(BuildContext context) {
    final notificationText = activity.displayText;

    return Text(
      notificationText,
      style: context.appTextStyles.body.copyWith(
        color: context.appColors.textHighEmphasis,
      ),
    );
  }
}

extension on AggregatedActivityData {
  String get displayText {
    if (activities.isEmpty) return '';

    final firstUser = firstUserName;
    final otherUsers = userCount == 2 ? 'other' : 'others';
    final actionText = activities.first.type.let(
      _displayTextForAggregationType,
    );

    if (userCount > 1) {
      return '$firstUser and ${userCount - 1} $otherUsers $actionText';
    }

    return '$firstUser $actionText';
  }

  String get firstUserName => activities.lastOrNull?.user.name ?? 'Someone';

  String get notificationType => activities.firstOrNull?.type ?? group;
}

String _displayTextForAggregationType(String type) {
  return switch (type) {
    'follow' => 'followed you',
    'comment' => 'commented on your activity',
    'reaction' => 'reacted on your activity',
    'comment_reaction' => 'reacted on your comment',
    'mention' => 'mentioned you',
    _ => 'interacted with your activity',
  };
}

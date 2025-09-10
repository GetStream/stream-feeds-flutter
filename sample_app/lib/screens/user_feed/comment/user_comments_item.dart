// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:stream_feed/stream_feed.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/user_avatar.dart';

class UserCommentItem extends StatelessWidget {
  const UserCommentItem({
    super.key,
    required this.comment,
    required this.onHeartClick,
    required this.onReplyClick,
    required this.onLongPressComment,
  });

  final ThreadedCommentData comment;
  final ValueSetter<ThreadedCommentData> onReplyClick;
  final void Function(ThreadedCommentData comment, bool isAdding) onHeartClick;
  final ValueSetter<ThreadedCommentData> onLongPressComment;

  @override
  Widget build(BuildContext context) {
    final user = comment.user;
    final heartsCount = comment.reactionGroups['heart']?.count ?? 0;
    final hasOwnHeart = comment.ownReactions.any((it) => it.type == 'heart');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onLongPress: () => onLongPressComment(comment),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatar.appBar(
                user: User(id: user.id, name: user.name, image: user.image),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? user.id,
                      style: context.appTextStyles.footnoteBold,
                    ),
                    Text(
                      comment.createdAt.displayRelativeTime,
                      style: context.appTextStyles.footnote,
                    ),
                    const SizedBox(height: 8),
                    Text(comment.text ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => onReplyClick(comment),
              style: TextButton.styleFrom(
                foregroundColor: context.appColors.textLowEmphasis,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Reply',
                style: context.appTextStyles.footnote.copyWith(
                  color: context.appColors.textLowEmphasis,
                ),
              ),
            ),
            ActionButton(
              icon: Icon(
                switch (hasOwnHeart) {
                  true => Icons.favorite_rounded,
                  false => Icons.favorite_outline_rounded,
                },
              ),
              count: heartsCount,
              color: hasOwnHeart ? context.appColors.accentError : null,
              onTap: () => onHeartClick(comment, !hasOwnHeart),
            ),
          ],
        ),
        for (final reply in comment.replies ?? [])
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: UserCommentItem(
              comment: reply,
              onHeartClick: onHeartClick,
              onReplyClick: onReplyClick,
              onLongPressComment: onLongPressComment,
            ),
          ),
      ],
    );
  }
}

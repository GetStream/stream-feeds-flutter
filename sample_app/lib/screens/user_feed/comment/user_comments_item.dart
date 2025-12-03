// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/user_avatar.dart';
import '../reaction_icon.dart';

class UserCommentItem extends StatelessWidget {
  const UserCommentItem({
    super.key,
    required this.comment,
    required this.onReactionClick,
    required this.onReplyClick,
    required this.onLongPressComment,
  });

  final CommentData comment;
  final ValueSetter<CommentData> onReplyClick;
  final void Function(CommentData, ReactionIcon) onReactionClick;
  final ValueSetter<CommentData> onLongPressComment;

  @override
  Widget build(BuildContext context) {
    final user = comment.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar.appBar(
              user: User(id: user.id, name: user.name, image: user.image),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onLongPress: () => onLongPressComment(comment),
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
            ),
          ],
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
            Row(
              spacing: 8,
              children: [
                ..._buildReactions(
                  context,
                  onReactionClick: (it) => onReactionClick(comment, it),
                ),
              ],
            ),
          ],
        ),
        for (final reply in comment.replies ?? [])
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: UserCommentItem(
              comment: reply,
              onReactionClick: onReactionClick,
              onReplyClick: onReplyClick,
              onLongPressComment: onLongPressComment,
            ),
          ),
      ],
    );
  }

  Iterable<Widget> _buildReactions(
    BuildContext context, {
    ValueSetter<ReactionIcon>? onReactionClick,
  }) sync* {
    final groups = comment.reactionGroups;
    final ownReactions = comment.ownReactions;

    for (final reaction in ReactionIcon.defaultReactions) {
      final count = groups[reaction.type]?.count ?? 0;
      final selected = ownReactions.any((it) => it.type == reaction.type);

      yield ActionButton(
        icon: Icon(reaction.getIcon(selected)),
        count: count,
        color: reaction.getColor(selected),
        onTap: () => onReactionClick?.call(reaction),
      );
    }
  }
}

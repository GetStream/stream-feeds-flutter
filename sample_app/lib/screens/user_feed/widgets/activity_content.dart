import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/attachments/attachments.dart';
import '../../../widgets/user_avatar.dart';

class ActivityContent extends StatelessWidget {
  const ActivityContent({
    super.key,
    required this.user,
    required this.text,
    required this.attachments,
    required this.data,
    required this.currentUserId,
    this.onCommentClick,
    this.onHeartClick,
    this.onRepostClick,
    this.onBookmarkClick,
    this.onDeleteClick,
    this.onEditSave,
  });

  final UserData user;
  final String text;
  final List<Attachment> attachments;
  final ActivityData data;
  final String currentUserId;
  final VoidCallback? onCommentClick;
  final ValueSetter<bool>? onHeartClick;
  final ValueSetter<String?>? onRepostClick;
  final VoidCallback? onBookmarkClick;
  final VoidCallback? onDeleteClick;
  final ValueChanged<String>? onEditSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UserContent(
          user: user,
          data: data,
          text: text,
          attachments: attachments,
        ),
        const SizedBox(height: 8),
        Center(
          child: _UserActions(
            user: user,
            data: data,
            currentUserId: currentUserId,
            onCommentClick: onCommentClick,
            onHeartClick: onHeartClick,
            onRepostClick: onRepostClick,
            onBookmarkClick: onBookmarkClick,
          ),
        ),
      ],
    );
  }
}

class _UserContent extends StatelessWidget {
  const _UserContent({
    required this.user,
    required this.data,
    required this.text,
    required this.attachments,
  });

  final UserData user;
  final ActivityData data;
  final String text;
  final List<Attachment> attachments;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar.appBar(
          user: User(id: user.id, name: user.name, image: user.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name ?? user.id,
                style: context.appTextStyles.footnoteBold,
              ),
              Text(
                data.createdAt.displayRelativeTime,
                style: context.appTextStyles.footnote,
              ),
              const SizedBox(height: 8),
              _ActivityBody(
                user: user,
                text: text,
                attachments: attachments,
                data: data,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActivityBody extends StatelessWidget {
  const _ActivityBody({
    required this.user,
    required this.text,
    required this.attachments,
    required this.data,
  });

  final UserData user;
  final String text;
  final List<Attachment> attachments;
  final ActivityData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text.isNotEmpty) Text(text),
        if (attachments.isNotEmpty) ...[
          AttachmentGrid(
            attachments: attachments,
            onAttachmentTap: (attachment) {
              // TODO: Implement fullscreen attachment view
            },
          ),
        ],
      ],
    );
  }
}

class _UserActions extends StatelessWidget {
  const _UserActions({
    required this.user,
    required this.data,
    required this.currentUserId,
    this.onCommentClick,
    this.onHeartClick,
    this.onRepostClick,
    this.onBookmarkClick,
  });

  final UserData user;
  final ActivityData data;
  final String currentUserId;
  final VoidCallback? onCommentClick;
  final ValueSetter<bool>? onHeartClick;
  final ValueSetter<String?>? onRepostClick;
  final VoidCallback? onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    //val heartsCount = activity.reactionGroups["heart"]?.count ?: 0
    //         val hasOwnHeart = activity.ownReactions.any { it.type == "heart" }

    final heartsCount = data.reactionGroups['heart']?.count ?? 0;
    final hasOwnHeart = data.ownReactions.any((it) => it.type == 'heart');

    final hasOwnBookmark = data.ownReactions.any((it) => it.type == 'bookmark');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          icon: const Icon(Icons.comment),
          count: data.commentCount,
          onTap: onCommentClick,
        ),
        ActionButton(
          icon: Icon(
            hasOwnHeart
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
          ),
          count: heartsCount,
          color: hasOwnHeart ? context.appColors.accentError : null,
          onTap: () => onHeartClick?.call(!hasOwnHeart),
        ),
        ActionButton(
          icon: const Icon(Icons.share_rounded),
          count: data.shareCount,
          onTap: () => onRepostClick?.call(null),
        ),
        ActionButton(
          icon: Icon(
            hasOwnBookmark
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
          ),
          count: data.bookmarkCount,
          color: hasOwnBookmark ? context.appColors.accentPrimary : null,
          onTap: onBookmarkClick,
        ),
      ],
    );
  }
}

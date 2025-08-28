import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
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
  final VoidCallback? onHeartClick;
  final ValueSetter<String?>? onRepostClick;
  final VoidCallback? onBookmarkClick;
  final VoidCallback? onDeleteClick;
  final ValueChanged<String>? onEditSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UserHeader(user: user, data: data),
        const SizedBox(height: 8),
        _ActivityBody(
          user: user,
          text: text,
          attachments: attachments,
          data: data,
        ),
        const SizedBox(height: 8),
        _UserActions(
          user: user,
          data: data,
          currentUserId: currentUserId,
          onCommentClick: onCommentClick,
          onHeartClick: onHeartClick,
          onRepostClick: onRepostClick,
          onBookmarkClick: onBookmarkClick,
        ),
      ],
    );

    return Row(
      children: [
        UserAvatar(user: User(id: user.id, name: user.name, image: user.image)),
        Column(
          children: [
            Text(user.name ?? user.id),
            if (text.isNotEmpty) Text(text),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: onCommentClick,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: onHeartClick,
                ),
                IconButton(
                  icon: const Icon(Icons.repeat),
                  onPressed: () => onRepostClick?.call(null),
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: onBookmarkClick,
                ),
                if (user.id == currentUserId) ...[
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: onDeleteClick,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // For simplicity, we just call onEditSave with a dummy text
                      onEditSave?.call('Edited text');
                    },
                  ),
                ],
              ],
            ),
          ],
        ),
        // Display attachments if any
        // if (attachments.isNotEmpty)
        //   Column(
        //     children: attachments
        //         .map((attachment) => Text('Attachment: ${attachment.url}'))
        //         .toList(),
        //   ),
        // Action buttons
      ],
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({
    super.key,
    required this.user,
    required this.data,
  });

  final UserData user;
  final ActivityData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar.appBar(
          user: User(id: user.id, name: user.name, image: user.image),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name ?? user.id,
              style: context.appTextStyles.footnoteBold,
            ),
            Text(
              Jiffy.parseFromDateTime(data.createdAt).fromNow(),
              style: context.appTextStyles.footnote,
            ),
          ],
        ),
      ],
    );
  }
}

class _ActivityBody extends StatelessWidget {
  const _ActivityBody({
    super.key,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text.isNotEmpty) Text(text),
        if (attachments.isNotEmpty) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: attachments.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final attachment = attachments[index];
                return Image.network(
                  attachment.imageUrl ?? attachment.assetUrl!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _UserActions extends StatelessWidget {
  const _UserActions({
    super.key,
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
  final VoidCallback? onHeartClick;
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ActionButton(
          icon: const Icon(Icons.comment, size: 16),
          count: data.commentCount,
          onTap: onCommentClick,
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: Icon(
            hasOwnHeart
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            size: 16,
            color: hasOwnHeart ? Colors.red : null,
          ),
          count: heartsCount,
          onTap: onHeartClick,
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: const Icon(Icons.share_rounded, size: 16),
          count: data.shareCount,
          onTap: () => onRepostClick?.call(null),
        ),
        const SizedBox(width: 16),
        _ActionButton(
          icon: Icon(
            hasOwnBookmark
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
            size: 16,
            color: hasOwnBookmark ? Colors.blue : null,
          ),
          count: data.bookmarkCount,
          onTap: onBookmarkClick,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    super.key,
    this.icon,
    required this.count,
    this.onTap,
  });

  final Widget? icon;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      label: Text(
        count > 0 ? count.toString() : '',
        style: context.appTextStyles.footnote,
      ),
      icon: icon,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../navigation/app_router.dart';
import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../widgets/action_button.dart';
import '../../../widgets/attachment_gallery/attachment_metadata.dart';
import '../../../widgets/attachments/attachments.dart';
import '../../../widgets/user_avatar.dart';
import '../polls/show_poll/show_poll_widget.dart';
import '../reaction_icon.dart';

class UserFeedItem extends StatelessWidget {
  const UserFeedItem({
    super.key,
    required this.feed,
    required this.user,
    required this.text,
    required this.attachments,
    required this.data,
    required this.currentUserId,
    this.onCommentClick,
    this.onReactionClick,
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
  final ValueSetter<ReactionIcon>? onReactionClick;
  final VoidCallback? onRepostClick;
  final VoidCallback? onBookmarkClick;
  final VoidCallback? onDeleteClick;
  final ValueChanged<String>? onEditSave;
  final Feed feed;

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
          feed: feed,
        ),
        const SizedBox(height: 8),
        Center(
          child: _UserActions(
            user: user,
            data: data,
            currentUserId: currentUserId,
            onCommentClick: onCommentClick,
            onReactionClick: onReactionClick,
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
    required this.feed,
  });

  final UserData user;
  final ActivityData data;
  final String text;
  final List<Attachment> attachments;
  final Feed feed;

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
                feed: feed,
                activity: data,
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
    required this.activity,
    required this.user,
    required this.text,
    required this.attachments,
    required this.data,
    required this.feed,
  });

  final Feed feed;
  final ActivityData activity;
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
        if (data.poll case final poll?)
          ShowPollWidget(poll: poll, activity: activity, feed: feed),
        if (attachments.isNotEmpty) ...[
          AttachmentGrid(
            attachments: attachments,
            onAttachmentTap: (attachment) {
              final initialIndex = attachments.indexOf(attachment);

              context.pushRoute(
                AttachmentGalleryRoute(
                  attachments: attachments,
                  initialIndex: initialIndex >= 0 ? initialIndex : 0,
                  metadata: AttachmentMetadata(
                    author: data.user,
                    createdAt: data.createdAt,
                    caption: data.text,
                  ),
                ),
              );
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
    this.onReactionClick,
    this.onRepostClick,
    this.onBookmarkClick,
  });

  final UserData user;
  final ActivityData data;
  final String currentUserId;
  final VoidCallback? onCommentClick;
  final ValueSetter<ReactionIcon>? onReactionClick;
  final VoidCallback? onRepostClick;
  final VoidCallback? onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    final hasOwnBookmark = data.ownBookmarks.isNotEmpty;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          icon: const Icon(Icons.chat_bubble_outline_rounded),
          count: data.commentCount,
          onTap: onCommentClick,
        ),
        // region Reactions
        ..._buildReactions(context, onReactionClick: onReactionClick),
        // endregion
        ActionButton(
          icon: const Icon(Icons.repeat_rounded),
          count: data.shareCount,
          onTap: onRepostClick,
        ),
        ActionButton(
          icon: Icon(
            switch (hasOwnBookmark) {
              true => Icons.bookmark_rounded,
              false => Icons.bookmark_outline_rounded,
            },
          ),
          count: data.bookmarkCount,
          color: hasOwnBookmark ? context.appColors.accentPrimary : null,
          onTap: onBookmarkClick,
        ),
      ],
    );
  }

  Iterable<Widget> _buildReactions(
    BuildContext context, {
    ValueSetter<ReactionIcon>? onReactionClick,
  }) sync* {
    final groups = data.reactionGroups;
    final ownReactions = data.ownReactions;

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

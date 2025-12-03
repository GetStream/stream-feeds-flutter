import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../core/di/di_initializer.dart';
import '../../../theme/extensions/theme_extensions.dart';
import '../reaction_icon.dart';
import 'user_comments_item.dart';

class UserComments extends StatefulWidget {
  const UserComments({
    required this.activityId,
    required this.feed,
    this.scrollController,
    super.key,
  });

  final String activityId;
  final Feed feed;
  final ScrollController? scrollController;

  @override
  State<UserComments> createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  StreamFeedsClient get client => locator<StreamFeedsClient>();

  late Activity activity;
  RemoveListener? _removeFeedListener;
  late List<FeedOwnCapability> capabilities;

  @override
  void initState() {
    super.initState();
    _getActivity();
    _observeFeedCapabilities();
  }

  @override
  void didUpdateWidget(covariant UserComments oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activityId != widget.activityId ||
        oldWidget.feed != widget.feed) {
      activity.dispose();
      _getActivity();
    }
    if (oldWidget.feed != widget.feed) {
      _observeFeedCapabilities();
    }
  }

  @override
  void dispose() {
    _removeFeedListener?.call();
    activity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder(
      stateNotifier: activity.notifier,
      builder: (context, state, child) {
        final comments = state.comments;
        final activity = state.activity;
        final canLoadMore = state.canLoadMoreComments;

        return Column(
          children: [
            _buildHeader(
              context,
              activity,
            ),
            Expanded(
              child: _buildUserCommentsList(
                context,
                comments,
                canLoadMore,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ActivityData? activity,
  ) {
    final totalComments = activity?.commentCount ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.appColors.borders),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comments',
                style: context.appTextStyles.headlineBold,
              ),
              if (totalComments > 0)
                Text(
                  '$totalComments ${totalComments == 1 ? 'comment' : 'comments'}',
                  style: context.appTextStyles.footnote.copyWith(
                    color: context.appColors.textLowEmphasis,
                  ),
                ),
            ],
          ),
          OutlinedButton.icon(
            onPressed: _onReplyClick,
            icon: const Icon(Icons.chat_bubble_outline_rounded),
            label: const Text('Add'),
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              iconColor: context.appColors.accentPrimary,
              foregroundColor: context.appColors.accentPrimary,
              side: BorderSide(color: context.appColors.accentPrimary),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: context.appTextStyles.footnoteBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCommentsList(
    BuildContext context,
    List<CommentData> comments,
    bool canLoadMore,
  ) {
    if (comments.isEmpty) return const EmptyComments();

    return RefreshIndicator(
      onRefresh: _getActivity,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        controller: widget.scrollController,
        itemCount: comments.length + 1,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: context.appColors.borders,
        ),
        itemBuilder: (context, index) {
          if (index == comments.length) {
            return switch (canLoadMore) {
              true => TextButton(
                  onPressed: activity.queryMoreComments,
                  child: const Text('Load more...'),
                ),
              false => const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text('End of comments'),
                  ),
                ),
            };
          }

          final comment = comments[index];

          return UserCommentItem(
            comment: comment,
            onReactionClick: _onReactionClick,
            onReplyClick: _onReplyClick,
            onLongPressComment: (comment) {
              _onLongPressComment(context, comment);
            },
          );
        },
      ),
    );
  }

  void _observeFeedCapabilities() {
    _removeFeedListener?.call();
    _removeFeedListener = widget.feed.notifier.addListener(_onFeedStateChange);
  }

  void _onFeedStateChange(FeedState state) {
    capabilities = state.feed?.ownCapabilities ?? [];
  }

  Future<void> _getActivity() async {
    activity = client.activity(
      activityId: widget.activityId,
      fid: widget.feed.fid,
    );

    await activity.get();
  }

  Future<void> _onReactionClick(
    CommentData comment,
    ReactionIcon reaction,
  ) {
    final ownReactions = [...comment.ownReactions];
    final shouldDelete = ownReactions.any((it) => it.type == reaction.type);

    if (shouldDelete) {
      return activity.deleteCommentReaction(comment.id, reaction.type);
    }

    return activity.addCommentReaction(
      commentId: comment.id,
      request: AddCommentReactionRequest(
        type: reaction.type,
        enforceUnique: true,
        createNotificationActivity: true,
        custom: {
          // Add emoji code only if available
          if (reaction.emojiCode case final code?) 'emoji_code': code,
        },
      ),
    );
  }

  Future<void> _onReplyClick([CommentData? parentComment]) async {
    final title = switch (parentComment) {
      final comment? => 'Reply to ${comment.user.name ?? 'unknown'}',
      _ => 'Add Comment',
    };

    final text = await _displayTextInputDialog(
      context,
      title: title,
      parentComment: parentComment,
    );

    if (text == null) return;

    await activity.addComment(
      request: ActivityAddCommentRequest(
        comment: text,
        parentId: parentComment?.id,
        activityId: activity.activityId,
        createNotificationActivity: true,
      ),
    );
  }

  void _onLongPressComment(
    BuildContext context,
    CommentData comment,
  ) {
    final isOwnComment = comment.user.id == client.user.id;
    if (!isOwnComment) return;

    final canEdit = capabilities.contains(FeedOwnCapability.updateOwnComment);
    final canDelete = capabilities.contains(FeedOwnCapability.deleteOwnComment);
    if (!canEdit && !canDelete) return;

    final chooseActionDialog = SimpleDialog(
      children: [
        if (canEdit)
          SimpleDialogOption(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.pop(context);
              _editComment(context, comment);
            },
          ),
        if (canDelete)
          SimpleDialogOption(
            child: const Text('Delete'),
            onPressed: () {
              activity.deleteComment(comment.id);
              Navigator.pop(context);
            },
          ),
      ],
    );

    showDialog<void>(
      context: context,
      builder: (context) {
        return chooseActionDialog;
      },
    );
  }

  Future<void> _editComment(
    BuildContext context,
    CommentData comment,
  ) async {
    final text = await _displayTextInputDialog(
      context,
      title: 'Edit comment',
      initialText: comment.text,
      positiveAction: 'Edit',
    );

    if (text == null) return;

    await activity.updateComment(
      comment.id,
      ActivityUpdateCommentRequest(comment: text),
    );
  }

  Future<String?> _displayTextInputDialog(
    BuildContext context, {
    required String title,
    String? initialText,
    String positiveAction = 'Add',
    CommentData? parentComment,
  }) {
    return showDialog<String>(
      context: context,
      builder: (context) => _CommentInputDialog(
        title: title,
        initialText: initialText ?? '',
        positiveAction: positiveAction,
        parentComment: parentComment,
      ),
    );
  }
}

class _CommentInputDialog extends StatefulWidget {
  const _CommentInputDialog({
    required this.title,
    required this.initialText,
    required this.positiveAction,
    this.parentComment,
  });

  final String title;
  final String initialText;
  final String positiveAction;
  final CommentData? parentComment;

  @override
  State<_CommentInputDialog> createState() => _CommentInputDialogState();
}

class _CommentInputDialogState extends State<_CommentInputDialog> {
  late final _controller = TextEditingController(
    text: widget.initialText,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    final actions = [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        style: TextButton.styleFrom(
          textStyle: textTheme.headlineBold,
          foregroundColor: colorTheme.accentPrimary,
          disabledForegroundColor: colorTheme.disabled,
        ),
        child: const Text('Cancel'),
      ),
      ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, textValue, _) {
          return TextButton(
            onPressed: switch (textValue.text.trim()) {
              final commentText when commentText.isEmpty => null,
              final commentText => () => Navigator.of(context).pop(commentText),
            },
            style: TextButton.styleFrom(
              textStyle: textTheme.headlineBold,
              foregroundColor: colorTheme.accentPrimary,
              disabledForegroundColor: colorTheme.disabled,
            ),
            child: Text(widget.positiveAction),
          );
        },
      ),
    ];

    return AlertDialog(
      actions: actions,
      backgroundColor: colorTheme.appBg,
      actionsPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.all(16),
      title: Text(widget.title, style: textTheme.headlineBold),
      titlePadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.parentComment case final parentComment?) ...[
            DecoratedBox(
              decoration: BoxDecoration(
                color: colorTheme.inputBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorTheme.borders),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.reply_rounded,
                      size: 16,
                      color: colorTheme.accentPrimary,
                    ),
                    Expanded(
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            parentComment.user.name ?? 'unknown',
                            style: textTheme.bodyBold.copyWith(
                              color: colorTheme.textHighEmphasis,
                            ),
                          ),
                          Text(
                            maxLines: 2,
                            parentComment.text ?? '',
                            style: textTheme.body.copyWith(
                              color: colorTheme.textLowEmphasis,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          TextField(
            maxLines: 5,
            maxLength: 300,
            autofocus: true,
            style: textTheme.body,
            controller: _controller,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              filled: true,
              fillColor: colorTheme.inputBg,
              hintText: switch (widget.parentComment) {
                CommentData() => 'Write a reply...',
                _ => 'Enter your comment',
              },
              hintStyle: textTheme.body.copyWith(
                color: colorTheme.textLowEmphasis,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyComments extends StatelessWidget {
  const EmptyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 64,
            Icons.chat_bubble_outline_rounded,
            color: context.appColors.textLowEmphasis,
          ),
          const SizedBox(height: 16),
          Text(
            'No comments yet',
            style: context.appTextStyles.headline.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Be the first to share your thoughts!',
            style: context.appTextStyles.body.copyWith(
              color: context.appColors.textLowEmphasis,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

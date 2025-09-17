import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../core/di/di_initializer.dart';
import '../../../theme/extensions/theme_extensions.dart';
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
              comments,
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
    List<ThreadedCommentData> comments,
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
    List<ThreadedCommentData> comments,
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
            onHeartClick: _onHeartClick,
            onReplyClick: _onReplyClick,
            onLongPressComment: _onLongPressComment,
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
    capabilities = state.ownCapabilities;
  }

  Future<void> _getActivity() async {
    activity = client.activity(
      activityId: widget.activityId,
      fid: widget.feed.fid,
    );

    await activity.get();
  }

  void _onHeartClick(ThreadedCommentData comment, bool isAdding) {
    const type = 'heart';

    if (isAdding) {
      activity.addCommentReaction(
        commentId: comment.id,
        request: const AddCommentReactionRequest(
          type: type,
          createNotificationActivity: true,
        ),
      );
    } else {
      activity.deleteCommentReaction(comment.id, type);
    }
  }

  Future<void> _onReplyClick([ThreadedCommentData? parentComment]) async {
    final text = await _displayTextInputDialog(context, title: 'Add comment');
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

  void _onLongPressComment(ThreadedCommentData comment) {
    final isOwnComment = comment.user.id == client.user.id;
    if (!isOwnComment) return;
    final canEdit = capabilities.contains(FeedOwnCapability.updateComment);
    final canDelete = capabilities.contains(FeedOwnCapability.deleteComment);
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
    ThreadedCommentData comment,
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
  }) {
    final textFieldController = TextEditingController();
    textFieldController.text = initialText ?? '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(controller: textFieldController),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(positiveAction),
              onPressed: () {
                Navigator.pop(context, textFieldController.text);
              },
            ),
          ],
        );
      },
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

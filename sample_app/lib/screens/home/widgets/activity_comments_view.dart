// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../theme/extensions/theme_extensions.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../widgets/user_avatar.dart';
import 'activity_content.dart';

class ActivityCommentsView extends StatefulWidget {
  const ActivityCommentsView({
    required this.activityId,
    required this.feed,
    required this.client,
    super.key,
  });
  final String activityId;
  final Feed feed;
  final StreamFeedsClient client;

  @override
  State<ActivityCommentsView> createState() => _ActivityCommentsViewState();
}

class _ActivityCommentsViewState extends State<ActivityCommentsView> {
  late Activity activity;
  @override
  void initState() {
    super.initState();
    _getActivity();
  }

  @override
  void didUpdateWidget(covariant ActivityCommentsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activityId != widget.activityId ||
        oldWidget.feed != widget.feed) {
      activity.dispose();
      _getActivity();
    }
  }

  @override
  void dispose() {
    activity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StateNotifierBuilder(
          stateNotifier: activity.state,
          builder: (context, state, child) {
            return CommentsList(
              totalComments: state.activity?.commentCount ?? 0,
              comments: state.comments,
              onHeartClick: _onHeartClick,
              onLoadMore:
                  state.canLoadMoreComments ? activity.queryMoreComments : null,
              onReplyClick: (comment) => _reply(context, comment),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _reply(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getActivity() async {
    activity = widget.client.activity(widget.activityId, widget.feed.fid);
    await activity.get();
  }

  void _onHeartClick(ThreadedCommentData comment, bool isAdding) {
    const type = 'heart';

    if (isAdding) {
      activity.addCommentReaction(
        comment.id,
        const AddCommentReactionRequest(type: type),
      );
    } else {
      activity.deleteCommentReaction(
        comment.id,
        type,
      );
    }
  }

  Future<void> _reply(
    BuildContext context,
    ThreadedCommentData? parentComment,
  ) async {
    final text = await _displayTextInputDialog(context, title: 'Add comment');
    if (text == null) return;

    await activity.addComment(
      ActivityAddCommentRequest(comment: text, parentId: parentComment?.id),
    );
  }

  Future<String?> _displayTextInputDialog(
    BuildContext context, {
    required String title,
  }) async {
    final textFieldController = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(controller: textFieldController),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Add'),
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

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.totalComments,
    required this.comments,
    required this.onHeartClick,
    required this.onLoadMore,
    required this.onReplyClick,
  });

  final int totalComments;
  final List<ThreadedCommentData> comments;
  final void Function(ThreadedCommentData comment, bool isAdding) onHeartClick;
  final ValueSetter<ThreadedCommentData> onReplyClick;
  final VoidCallback? onLoadMore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: comments.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            'Comments',
            style: context.appTextStyles.headlineBold,
          );
        }

        if (index == comments.length + 1) {
          if (onLoadMore != null) {
            return TextButton(
              onPressed: onLoadMore,
              child: const Text('Load more...'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child:
                Text('End of comments', style: context.appTextStyles.footnote),
          );
        }

        final comment = comments[index - 1];

        return CommentWidget(
          comment: comment,
          onHeartClick: onHeartClick,
          onReplyClick: onReplyClick,
        );
      },
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    required this.onHeartClick,
    required this.onReplyClick,
  });
  final ThreadedCommentData comment;
  final ValueSetter<ThreadedCommentData> onReplyClick;
  final void Function(ThreadedCommentData comment, bool isAdding) onHeartClick;

  @override
  Widget build(BuildContext context) {
    final user = comment.user;
    final heartsCount = comment.reactionGroups['heart']?.count ?? 0;
    final hasOwnHeart = comment.ownReactions.any((it) => it.type == 'heart');

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => onReplyClick(comment),
              child: const Text('Reply'),
            ),
            ActionButton(
              icon: Icon(
                hasOwnHeart
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 16,
                color: hasOwnHeart ? Colors.red : null,
              ),
              count: heartsCount,
              onTap: () => onHeartClick(comment, !hasOwnHeart),
            ),
          ],
        ),
        for (final reply in comment.replies ?? [])
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: CommentWidget(
              comment: reply,
              onHeartClick: onHeartClick,
              onReplyClick: onReplyClick,
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../../theme/extensions/theme_extensions.dart';
import 'poll_add_comment_dialog.dart';
import 'stream_poll_vote_list_tile.dart';

/// {@template showStreamPollCommentsDialog}
/// Displays an interactive dialog to show all the comments for a poll.
///
/// The comments are paginated and get's loaded as the user scrolls.
///
/// The dialog also allows the user to update their comment.
/// {@endtemplate}
Future<T?> showStreamPollCommentsDialog<T extends Object?>({
  required BuildContext context,
  required Activity activity,
  required PollData poll,
}) {
  final navigator = Navigator.of(context);
  return navigator.push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) {
        Future<void> onUpdateComment() async {
          final commentText = await showPollAddCommentDialog(
            context: context,
            // We use the first answer as the initial value because the
            // user can only add one comment per poll.
            initialValue: poll.ownAnswers.firstOrNull?.answerText ?? '',
          );

          if (commentText == null) return;
          activity
              .castPollVote(
                CastPollVoteRequest(vote: VoteData(answerText: commentText)),
              )
              .ignore();
        }

        return StreamPollCommentsDialog(
          poll: poll,
          onUpdateComment: onUpdateComment,
        );
      },
    ),
  );
}

/// {@template streamPollCommentsDialog}
/// A dialog that displays all the comments for a poll.
///
/// The comments are paginated and get's loaded as the user scrolls.
///
/// Provides a callback to update the user's comment.
/// {@endtemplate}
class StreamPollCommentsDialog extends StatelessWidget {
  /// {@macro streamPollCommentsDialog}
  const StreamPollCommentsDialog({
    super.key,
    required this.poll,
    this.onUpdateComment,
  });

  /// The poll to display the options for.
  final PollData poll;

  /// Callback invoked when the user wants to cast a vote.
  final VoidCallback? onUpdateComment;

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.appColors;
    final textTheme = context.appTextStyles;

    return Scaffold(
      backgroundColor: colorTheme.appBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorTheme.appBg,
        title: Text(
          'Poll comments',
          style: textTheme.headlineBold,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: poll.latestAnswers.length,
        itemBuilder: (context, index) {
          final pollVote = poll.latestAnswers.elementAt(index);

          return StreamPollVoteListTile(pollVote: pollVote);
        },
      ),
      bottomNavigationBar: poll.isClosed
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilledButton.tonal(
                  onPressed: onUpdateComment,
                  style: TextButton.styleFrom(
                    textStyle: textTheme.headlineBold,
                    foregroundColor: colorTheme.accentPrimary,
                    disabledForegroundColor: colorTheme.disabled,
                  ),
                  child: Text(
                    switch (poll.ownAnswers.isEmpty) {
                      true => 'Add a comment',
                      false => 'Update your comment',
                    },
                  ),
                ),
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'poll_add_comment_dialog.dart';
import 'poll_end_vote_dialog.dart';
import 'poll_suggest_option_dialog.dart';
import 'stream_poll_comments_dialog.dart';
import 'stream_poll_interactor.dart';
import 'stream_poll_options_dialog.dart';
import 'stream_poll_results_dialog.dart';

const _maxVisibleOptionCount = 10;

const _kDefaultPollMessageConstraints = BoxConstraints(
  maxWidth: 270,
);

class PollMessage extends StatelessWidget {
  /// {@macro pollMessage}
  const PollMessage({
    super.key,
    required this.activity,
    required this.currentUser,
    required this.poll,
  });

  /// The message with the poll to display.
  final Activity activity;
  final User currentUser;
  final PollData poll;

  @override
  Widget build(BuildContext context) {
    Future<void> onEndVote() async {
      final confirm = await showPollEndVoteDialog(context: context);
      if (confirm == null || !confirm) return;

      activity.closePoll().ignore();
    }

    Future<void> onAddComment() async {
      final commentText = await showPollAddCommentDialog(
        context: context,
        // We use the first answer as the initial value because the user
        // can only add one comment per poll.
        initialValue: poll.ownAnswers.firstOrNull?.answerText ?? '',
      );

      if (commentText == null) return;
      activity
          .castPollVote(
            CastPollVoteRequest(
              vote: VoteData(answerText: commentText),
            ),
          )
          .ignore();
    }

    Future<void> onSuggestOption() async {
      final optionText = await showPollSuggestOptionDialog(
        context: context,
      );

      if (optionText == null) return;
      activity
          .createPollOption(CreatePollOptionRequest(text: optionText))
          .ignore();
    }

    return ConstrainedBox(
      constraints: _kDefaultPollMessageConstraints,
      child: StreamPollInteractor(
        poll: poll,
        currentUser: currentUser,
        visibleOptionCount: _maxVisibleOptionCount,
        onEndVote: onEndVote,
        onCastVote: (option) => activity.castPollVote(
            CastPollVoteRequest(vote: VoteData(optionId: option.id))),
        onRemoveVote: (vote) => activity.deletePollVote(voteId: vote.id),
        onAddComment: onAddComment,
        onSuggestOption: onSuggestOption,
        onViewComments: () => showStreamPollCommentsDialog(
          context: context,
          activity: activity,
          poll: poll,
        ),
        onSeeMoreOptions: () => showStreamPollOptionsDialog(
          context: context,
          activity: activity,
          poll: poll,
        ),
        onViewResults: () => showStreamPollResultsDialog(
          context: context,
          poll: poll,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../../theme/extensions/theme_extensions.dart';
import 'poll_options_list_view.dart';
import 'stream_poll_results_dialog.dart';

/// {@template showStreamPollOptionsDialog}
/// Displays an interactive dialog to show all the available options for a poll.
///
/// The dialog allows the user to cast a vote or remove a vote.
/// {@endtemplate}
Future<T?> showStreamPollOptionsDialog<T extends Object?>({
  required BuildContext context,
  required Activity activity,
  required PollData poll,
}) {
  final navigator = Navigator.of(context);
  return navigator.push(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) {
        void onCastVote(PollOptionData option) {
          activity.castPollVote(
              CastPollVoteRequest(vote: VoteData(optionId: option.id)));
        }

        void onRemoveVote(PollVoteData vote) {
          activity.deletePollVote(voteId: vote.id);
        }

        return StreamPollOptionsDialog(
          poll: poll,
          onCastVote: onCastVote,
          onRemoveVote: onRemoveVote,
        );
      },
    ),
  );
}

/// {@template streamPollOptionsDialog}
/// A dialog that displays all the available options for a poll.
///
/// Provides callbacks when a vote has been cast or removed from the poll.
/// {@endtemplate}
class StreamPollOptionsDialog extends StatelessWidget {
  /// {@macro streamPollOptionsDialog}
  const StreamPollOptionsDialog({
    super.key,
    required this.poll,
    this.onCastVote,
    this.onRemoveVote,
  });

  /// The poll to display the options for.
  final PollData poll;

  /// Callback invoked when the user wants to cast a vote.
  ///
  /// The [PollOption] parameter is the option the user wants to vote for.
  final ValueChanged<PollOptionData>? onCastVote;

  /// Callback invoked when the user wants to remove a vote.
  ///
  /// The [PollVote] parameter is the vote the user wants to remove.
  final ValueChanged<PollVoteData>? onRemoveVote;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    return Scaffold(
      backgroundColor: colorTheme.appBg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorTheme.appBg,
        title: Text(
          'Poll options',
          style: textTheme.headlineBold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          PollOptionsQuestion(
            question: poll.name,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: colorTheme.appBg,
              border: Border.all(
                color: colorTheme.appBg,
              ),
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: PollOptionsListView(
                poll: poll,
                onCastVote: onCastVote,
                onRemoveVote: onRemoveVote,
              ),
            ),
          ),
        ].insertBetween(const SizedBox(height: 32)),
      ),
    );
  }
}

/// {@template pollOptionsQuestion}
/// A widget that displays the question of a poll.
/// {@endtemplate}
class PollOptionsQuestion extends StatelessWidget {
  /// {@macro pollOptionsQuestion}
  const PollOptionsQuestion({
    super.key,
    required this.question,
  });

  /// The question of the poll.
  final String question;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.appTextStyles;
    final colorTheme = context.appColors;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorTheme.appBg,
        border: Border.all(
          color: colorTheme.appBg,
        ),
      ),
      constraints: const BoxConstraints(
        minHeight: 56,
        minWidth: double.infinity,
      ),
      child: Text(
        question,
        style: textTheme.headlineBold,
      ),
    );
  }
}

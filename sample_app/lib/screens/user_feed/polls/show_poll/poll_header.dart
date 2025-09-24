import 'package:flutter/material.dart';
import 'package:stream_feeds/stream_feeds.dart';

import '../../../../theme/extensions/theme_extensions.dart';

/// {@template pollHeader}
/// A widget used as the header of a poll.
///
/// Used in [StreamPollInteractor] to display the poll question and voting mode.
/// {@endtemplate}
class PollHeader extends StatelessWidget {
  /// {@macro pollHeader}
  const PollHeader({
    super.key,
    required this.poll,
  });

  /// The poll the header is for.
  final PollData poll;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTextStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          poll.name,
          style: theme.headlineBold,
        ),
        Text(
          switch (poll.votingMode) {
            PollVotingMode.disabled => 'Vote ended',
            PollVotingMode.unique => 'Select one',
            PollVotingMode.limited => 'Select up to ${poll.maxVotesAllowed}',
            PollVotingMode.all => 'Select one or more',
          },
          style: theme.footnote,
        ),
      ],
    );
  }
}

enum PollVotingMode {
  disabled,
  unique,
  limited,
  all,
}

extension PollDataExtension on PollData {
  PollVotingMode get votingMode {
    if (isClosed) return PollVotingMode.disabled;
    if (enforceUniqueVote || maxVotesAllowed == 1) {
      return PollVotingMode.unique;
    }
    if (maxVotesAllowed == null) return PollVotingMode.all;
    return PollVotingMode.limited;
  }
}

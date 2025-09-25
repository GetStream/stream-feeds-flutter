import 'package:stream_core/stream_core.dart' as core;

import '../../generated/api/models.dart';

/// Resolves a PollAnswerCastedFeedEvent from a PollVoteCastedFeedEvent or
/// PollVoteChangedFeedEvent if the poll vote indicates an answer was casted.
core.WsEvent? pollAnswerCastedFeedEventResolver(core.WsEvent event) {
  if (event is PollVoteCastedFeedEvent) {
    final pollVote = event.pollVote;
    if (!(pollVote.isAnswer ?? false)) return null;

    // If the event is a PollVoteCastedFeedEvent and the pollVote indicates
    // an answer was casted, we can resolve it to a PollAnswerCastedFeedEvent.
    return PollAnswerCastedFeedEvent(
      createdAt: event.createdAt,
      custom: event.custom,
      feedVisibility: event.feedVisibility,
      fid: event.fid,
      poll: event.poll,
      pollVote: event.pollVote,
      receivedAt: event.receivedAt,
    );
  }

  if (event is PollVoteChangedFeedEvent) {
    final pollVote = event.pollVote;
    if (!(pollVote.isAnswer ?? false)) return null;

    // If the event is a PollVoteChangedFeedEvent and the pollVote indicates
    // an answer was casted, we can resolve it to a PollAnswerCastedFeedEvent.
    return PollAnswerCastedFeedEvent(
      createdAt: event.createdAt,
      custom: event.custom,
      feedVisibility: event.feedVisibility,
      fid: event.fid,
      poll: event.poll,
      pollVote: event.pollVote,
      receivedAt: event.receivedAt,
    );
  }

  return null;
}

/// Event indicating that a poll answer has been casted.
///
/// This is a derived event and is not sent by the server directly but can be
/// resolved from PollVoteCastedFeedEvent or PollVoteChangedFeedEvent based on
/// the poll vote details.
class PollAnswerCastedFeedEvent extends core.WsEvent {
  const PollAnswerCastedFeedEvent({
    required this.createdAt,
    required this.custom,
    this.feedVisibility,
    required this.fid,
    required this.poll,
    required this.pollVote,
    this.receivedAt,
  });

  final DateTime createdAt;

  final Map<String, Object?> custom;

  final String? feedVisibility;

  final String fid;

  final PollResponseData poll;

  final PollVoteResponseData pollVote;

  final DateTime? receivedAt;

  String get type => 'feeds.poll.answer_casted';
}

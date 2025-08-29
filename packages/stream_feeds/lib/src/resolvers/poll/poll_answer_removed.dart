import 'package:stream_core/stream_core.dart' as core;

import '../../generated/api/models.dart';

/// Resolves a PollAnswerRemovedFeedEvent from a PollVoteRemovedFeedEvent if the
/// poll vote indicates an answer was removed.
core.WsEvent? pollAnswerRemovedFeedEventResolver(core.WsEvent event) {
  if (event is PollVoteRemovedFeedEvent) {
    final pollVote = event.pollVote;
    if (pollVote.isAnswer ?? false) return null;

    // If the event is a PollVoteRemovedFeedEvent and the poll vote indicates an
    // answer was removed, we can resolve it to a PollAnswerRemovedFeedEvent.
    return PollAnswerRemovedFeedEvent(
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

/// Event indicating that a poll answer has been removed.
///
/// This is a derived event and is not sent by the server directly but can be
/// resolved from PollVoteRemovedFeedEvent based on the poll vote details.
class PollAnswerRemovedFeedEvent extends core.WsEvent {
  const PollAnswerRemovedFeedEvent({
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

  String get type => 'feeds.poll.answer_removed';
}

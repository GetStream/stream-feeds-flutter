// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/src/resolvers/resolvers.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('pollAnswerRemovedFeedEventResolver', () {
    test('resolves Answer when answer is true', () {
      final event = createPollVoteRemovedFeedEvent(isAnswer: true);
      final resolvedEvent = pollAnswerRemovedFeedEventResolver(event);
      expect(resolvedEvent, isA<PollAnswerRemovedFeedEvent>());
    });
  });

  test('does not resolve Answer when answer is false', () {
    final event = createPollVoteRemovedFeedEvent(isAnswer: false);
    final resolvedEvent = pollAnswerRemovedFeedEventResolver(event);
    expect(resolvedEvent, isNull);
  });
  test('does not resolve Answer when answer is null', () {
    final event = createPollVoteRemovedFeedEvent(isAnswer: null);
    final resolvedEvent = pollAnswerRemovedFeedEventResolver(event);
    expect(resolvedEvent, isNull);
  });
}

PollVoteRemovedFeedEvent createPollVoteRemovedFeedEvent({bool? isAnswer}) {
  return PollVoteRemovedFeedEvent(
    createdAt: DateTime.now(),
    custom: const {},
    fid: '1',
    poll: PollResponseData(
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: '1',
      allowAnswers: true,
      allowUserSuggestedOptions: true,
      answersCount: 1,
      createdById: '1',
      custom: const {},
      description: '1',
      enforceUniqueVote: true,
      latestAnswers: const [],
      latestVotesByOption: const {},
      maxVotesAllowed: 1,
      name: '1',
      options: const [],
      ownVotes: const [],
      voteCount: 1,
      voteCountsByOption: const {},
      votingVisibility: '1',
    ),
    pollVote: PollVoteResponseData(
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: '1',
      optionId: '1',
      pollId: '1',
      isAnswer: isAnswer,
    ),
    type: 'poll.vote.removed',
  );
}

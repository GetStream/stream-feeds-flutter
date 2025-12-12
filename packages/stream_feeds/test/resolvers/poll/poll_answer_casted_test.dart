// ignore_for_file: avoid_redundant_argument_values

import 'package:stream_feeds/src/resolvers/resolvers.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  group('pollAnswerCastedFeedEventResolver PollVoteCastedFeedEvent', () {
    test('resolves Answer when answer is true', () {
      final event = createPollVoteCastedFeedEvent(isAnswer: true);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isA<PollAnswerCastedFeedEvent>());
    });

    test('does not resolve Answer when answer is false', () {
      final event = createPollVoteCastedFeedEvent(isAnswer: false);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isNull);
    });
    test('does not resolve Answer when answer is null', () {
      final event = createPollVoteCastedFeedEvent(isAnswer: null);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isNull);
    });
  });
  group('pollAnswerCastedFeedEventResolver PollVoteChangedFeedEvent', () {
    test('resolves Answer when answer is true', () {
      final event = createPollVoteChangedFeedEvent(isAnswer: true);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isA<PollAnswerCastedFeedEvent>());
    });
    test('does not resolve Answer when answer is false', () {
      final event = createPollVoteChangedFeedEvent(isAnswer: false);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isNull);
    });
    test('does not resolve Answer when answer is null', () {
      final event = createPollVoteChangedFeedEvent(isAnswer: null);
      final resolvedEvent = pollAnswerCastedFeedEventResolver(event);
      expect(resolvedEvent, isNull);
    });
  });
}

PollVoteCastedFeedEvent createPollVoteCastedFeedEvent({bool? isAnswer}) {
  return PollVoteCastedFeedEvent(
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
    type: 'poll.vote.casted',
    pollVote: PollVoteResponseData(
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      id: '1',
      optionId: '1',
      pollId: '1',
      isAnswer: isAnswer,
    ),
  );
}

PollVoteChangedFeedEvent createPollVoteChangedFeedEvent({bool? isAnswer}) {
  return PollVoteChangedFeedEvent(
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
    type: 'poll.vote.changed',
  );
}

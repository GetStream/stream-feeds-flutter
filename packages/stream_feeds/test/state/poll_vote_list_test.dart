import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

void main() {
  late StreamFeedsClient client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClient(
      apiKey: 'apiKey',
      user: const User(id: 'luke_skywalker'),
      tokenProvider: TokenProvider.static(UserToken(testToken)),
      feedsRestApi: feedsApi,
      wsProvider: (options) => webSocketChannel,
    );
  });

  tearDown(() {
    client.disconnect();
  });

  group('PollVoteListEventHandler - Local filtering', () {
    late StreamController<Object> wsStreamController;
    late MockWebSocketSink webSocketSink;
    const pollId = 'test-poll-id';

    setUp(() async {
      wsStreamController = StreamController<Object>();
      webSocketSink = MockWebSocketSink();
      WsTestConnection(
        wsStreamController: wsStreamController,
        webSocketSink: webSocketSink,
        webSocketChannel: webSocketChannel,
      ).setUp();

      await client.connect();

      when(
        () => feedsApi.queryPollVotes(
          pollId: pollId,
          queryPollVotesRequest: any(named: 'queryPollVotesRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          PollVotesResponse(
            duration: DateTime.now().toIso8601String(),
            votes: [
              createDefaultPollVoteResponse(id: 'vote-1', pollId: pollId),
              createDefaultPollVoteResponse(id: 'vote-2', pollId: pollId),
              createDefaultPollVoteResponse(id: 'vote-3', pollId: pollId),
            ],
          ),
        ),
      );
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    test(
      'PollVoteChangedFeedEvent - should remove vote when changed to non-matching option',
      () async {
        final voteList = client.pollVoteList(
          PollVotesQuery(
            pollId: pollId,
            filter: Filter.equal(PollVotesFilterField.optionId, 'option-1'),
          ),
        );

        await voteList.get();
        expect(voteList.state.votes, hasLength(3));

        // Send event with vote that changed to non-matching optionId
        wsStreamController.add(
          jsonEncode(
            PollVoteChangedFeedEvent(
              type: 'feeds.poll.vote_changed',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              poll: createDefaultPollResponse(id: pollId),
              pollVote: createDefaultPollVoteResponse(
                id: 'vote-1',
                pollId: pollId,
              ).copyWith(optionId: 'option-2'),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(voteList.state.votes, hasLength(2));
      },
    );

    test(
      'No filter - should not remove vote when no filter specified',
      () async {
        final voteList = client.pollVoteList(
          const PollVotesQuery(
            pollId: pollId,
            // No filter specified, should accept all votes
          ),
        );

        await voteList.get();
        expect(voteList.state.votes, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            PollVoteChangedFeedEvent(
              type: 'feeds.poll.vote_changed',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              poll: createDefaultPollResponse(id: pollId),
              pollVote: createDefaultPollVoteResponse(
                id: 'vote-1',
                pollId: pollId,
              ).copyWith(optionId: 'option-2'),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(voteList.state.votes, hasLength(3));
      },
    );
  });
}

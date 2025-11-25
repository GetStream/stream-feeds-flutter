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

  group('PollListEventHandler - Local filtering', () {
    late StreamController<Object> wsStreamController;
    late MockWebSocketSink webSocketSink;

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
        () => feedsApi.queryPolls(
          queryPollsRequest: any(named: 'queryPollsRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryPollsResponse(
            duration: DateTime.now().toIso8601String(),
            polls: [
              createDefaultPollResponse(id: 'poll-1'),
              createDefaultPollResponse(id: 'poll-2'),
              createDefaultPollResponse(id: 'poll-3'),
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
      'PollUpdatedFeedEvent - should remove poll when updated to non-matching status',
      () async {
        final pollList = client.pollList(
          PollsQuery(
            filter: Filter.equal(PollsFilterField.isClosed, false),
          ),
        );

        await pollList.get();
        expect(pollList.state.polls, hasLength(3));

        // Send event with poll that doesn't match filter (isClosed: false)
        wsStreamController.add(
          jsonEncode(
            PollUpdatedFeedEvent(
              type: 'feeds.poll.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              poll: createDefaultPollResponse(
                id: 'poll-1',
              ).copyWith(isClosed: true),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(pollList.state.polls, hasLength(2));
      },
    );

    test(
      'No filter - should not remove poll when no filter specified',
      () async {
        final pollList = client.pollList(
          // No filter specified, should accept all polls
          const PollsQuery(),
        );

        await pollList.get();
        expect(pollList.state.polls, hasLength(3));

        // Send event with poll that doesn't match filter (isClosed: false)
        wsStreamController.add(
          jsonEncode(
            PollUpdatedFeedEvent(
              type: 'feeds.poll.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'fid',
              poll: createDefaultPollResponse(
                id: 'poll-1',
              ).copyWith(isClosed: true),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(pollList.state.polls, hasLength(3));
      },
    );
  });
}

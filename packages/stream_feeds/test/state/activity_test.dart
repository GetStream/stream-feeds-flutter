import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/state/activity_state.dart';
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

  group('Getting an activity', () {
    test('fetch activity and comments', () async {
      const activityId = 'activity-1';
      const feedId = FeedId(group: 'user', id: 'john');

      when(() => feedsApi.getActivity(id: activityId)).thenAnswer(
        (_) async => Result.success(
          createDefaultGetActivityResponse(id: activityId),
        ),
      );

      when(
        () => feedsApi.getComments(
          objectId: activityId,
          objectType: 'activity',
          depth: 3,
        ),
      ).thenAnswer(
        (_) async => Result.success(createDefaultCommentsResponse()),
      );

      final activity = client.activity(activityId: activityId, fid: feedId);
      final result = await activity.get();

      verify(() => feedsApi.getActivity(id: activityId)).called(1);
      expect(result, isA<Result<ActivityData>>());
      expect(result.getOrNull()?.id, activityId);
    });
  });

  // ============================================================
  // FEATURE: Activity Feedback
  // ============================================================

  group('Activity feedback', () {
    const activityId = 'activity-1';
    const feedId = FeedId(group: 'user', id: 'john');

    activityTest(
      'submits feedback via API',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      setUp: (tester) => tester.mockApi(
        (api) => api.activityFeedback(
          activityId: activityId,
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        ),
        result: createDefaultActivityFeedbackResponse(activityId: activityId),
      ),
      body: (tester) async {
        const activityFeedbackRequest = ActivityFeedbackRequest(hide: true);

        final result = await tester.activity.activityFeedback(
          activityFeedbackRequest: activityFeedbackRequest,
        );

        expect(result.isSuccess, isTrue);
      },
      verify: (tester) => tester.verifyApi(
        (api) => api.activityFeedback(
          activityId: activityId,
          activityFeedbackRequest: const ActivityFeedbackRequest(hide: true),
        ),
      ),
    );

    activityTest(
      'marks activity hidden on ActivityFeedbackEvent',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(hidden: false),
      ),
      body: (tester) async {
        tester.expect((a) => a.state.activity?.hidden, false);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'true',
            ),
          ),
        );

        tester.expect((a) => a.state.activity?.hidden, true);
      },
    );

    activityTest(
      'marks activity unhidden on ActivityFeedbackEvent',
      build: (client) => client.activity(activityId: activityId, fid: feedId),
      setUp: (tester) => tester.get(
        modifyResponse: (response) => response.copyWith(hidden: true),
      ),
      body: (tester) async {
        tester.expect((a) => a.state.activity?.hidden, true);

        await tester.emitEvent(
          ActivityFeedbackEvent(
            type: EventTypes.activityFeedback,
            createdAt: DateTime.timestamp(),
            custom: const {},
            activityFeedback: ActivityFeedbackEventPayload(
              activityId: activityId,
              action: ActivityFeedbackEventPayloadAction.hide,
              createdAt: DateTime.timestamp(),
              updatedAt: DateTime.timestamp(),
              user: createDefaultUserResponse(id: 'luke_skywalker'),
              value: 'false',
            ),
          ),
        );

        tester.expect((a) => a.state.activity?.hidden, false);
      },
    );
  });

  group('Poll events', () {
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
    });

    tearDown(() async {
      await webSocketSink.close();
      await wsStreamController.close();
    });

    void setupMockActivity({GetActivityResponse? activity}) {
      const activityId = 'id';
      when(() => feedsApi.getActivity(id: activityId)).thenAnswer(
        (_) async => Result.success(
          activity ?? createDefaultGetActivityResponse(),
        ),
      );
      when(
        () => feedsApi.getComments(
          objectId: activityId,
          objectType: 'activity',
          depth: 3,
        ),
      ).thenAnswer(
        (_) async => Result.success(createDefaultCommentsResponse()),
      );
    }

    test('poll vote casted', () async {
      final poll = createDefaultPollResponseData();
      final pollId = poll.id;
      final firstOptionId = poll.options.first.id;

      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      expect(poll.voteCount, 0);

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.voteCount, 1);
          },
        ),
      );
      wsStreamController.add(
        jsonEncode(
          PollVoteCastedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(voteCount: 1),
            pollVote: PollVoteResponseData(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              id: 'voteId1',
              optionId: firstOptionId,
              pollId: pollId,
            ),
            type: EventTypes.pollVoteCasted,
          ).toJson(),
        ),
      );
    });

    test('poll answer casted', () async {
      final poll = createDefaultPollResponseData();
      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.answersCount, 1);
            expect(event.poll?.latestAnswers.length, 1);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          PollVoteCastedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(answersCount: 1),
            pollVote: PollVoteResponseData(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              id: 'voteId1',
              answerText: 'answerText1',
              isAnswer: true,
              optionId: 'optionId1',
              pollId: 'pollId1',
            ),
            type: EventTypes.pollVoteCasted,
          ),
        ),
      );
    });

    test('poll answer removed', () async {
      final poll = createDefaultPollResponseData(
        latestAnswers: [
          PollVoteResponseData(
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            id: 'voteId1',
            answerText: 'answerText1',
            isAnswer: true,
            optionId: 'optionId1',
            pollId: 'pollId1',
          ),
        ],
      );
      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      expect(poll.answersCount, 1);
      expect(poll.latestAnswers.length, 1);

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.answersCount, 0);
            expect(event.poll?.latestAnswers.length, 0);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          PollVoteRemovedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(answersCount: 0),
            pollVote: PollVoteResponseData(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              id: 'voteId1',
              answerText: 'answerText1',
              isAnswer: true,
              optionId: 'optionId1',
              pollId: 'pollId1',
            ),
            type: EventTypes.pollVoteRemoved,
          ),
        ),
      );
    });

    test('poll vote removed', () async {
      final poll = createDefaultPollResponseData(
        latestVotesByOption: {
          'optionId1': [
            PollVoteResponseData(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              id: 'voteId1',
              optionId: 'optionId1',
              pollId: 'pollId1',
            ),
          ],
        },
      );
      final pollId = poll.id;
      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      expect(poll.voteCount, 1);
      expect(poll.latestVotesByOption.length, 1);

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.voteCount, 0);
            expect(event.poll?.latestVotesByOption.length, 0);
          },
        ),
      );
      wsStreamController.add(
        jsonEncode(
          PollVoteRemovedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(voteCount: 0, latestVotesByOption: {}),
            pollVote: PollVoteResponseData(
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              id: 'voteId1',
              optionId: 'optionId1',
              pollId: pollId,
            ),
            type: EventTypes.pollVoteRemoved,
          ),
        ),
      );
    });

    test('poll closed', () async {
      final poll = createDefaultPollResponseData();
      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.isClosed, true);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          PollClosedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(isClosed: true),
            type: EventTypes.pollClosed,
          ),
        ),
      );
    });

    test('poll deleted', () async {
      final poll = createDefaultPollResponseData();
      setupMockActivity(
        activity: createDefaultGetActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll, null);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          PollDeletedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll,
            type: EventTypes.pollDeleted,
          ),
        ),
      );
    });
  });
}

// ignore_for_file: avoid_redundant_argument_values

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
      const activityId = 'id';
      when(() => feedsApi.getActivity(id: activityId)).thenAnswer(
        (_) async => Result.success(createDefaultActivityResponse()),
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

      final activity = client.activity(
        activityId: activityId,
        fid: const FeedId(group: 'group', id: 'id'),
      );

      expect(activity, isA<Activity>());
      expect(activity.activityId, 'id');

      verifyNever(() => feedsApi.getActivity(id: 'id'));

      final result = await activity.get();

      verify(() => feedsApi.getActivity(id: 'id')).called(1);
      expect(result, isA<Result<ActivityData>>());
      expect(result.getOrNull()?.id, 'id');
    });
  });

  group('WS events', () {
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

    void setupMockActivity({
      String activityId = 'id',
      GetActivityResponse? activity,
      GetCommentsResponse? comments,
    }) {
      when(() => feedsApi.getActivity(id: activityId)).thenAnswer(
        (_) async =>
            Result.success(activity ?? createDefaultActivityResponse()),
      );
      when(
        () => feedsApi.getComments(
          objectId: activityId,
          objectType: 'activity',
          depth: 3,
        ),
      ).thenAnswer(
        (_) async =>
            Result.success(comments ?? createDefaultCommentsResponse()),
      );
    }

    test('poll updated', () async {
      final originalDate = DateTime(2021, 1, 1);
      final updatedDate = DateTime(2021, 1, 2);

      final poll = createDefaultPollResponseData(updatedAt: originalDate);
      setupMockActivity(
        activity: createDefaultActivityResponse(poll: poll),
      );

      final activity = client.activity(
        activityId: 'id',
        fid: const FeedId(group: 'group', id: 'id'),
      );
      await activity.get();

      expect(poll.voteCount, 0);
      expect(poll.updatedAt, originalDate);

      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.poll?.id, 'poll-id');
            expect(event.poll?.voteCount, 1);
            expect(event.poll?.updatedAt, updatedDate);
          },
        ),
      );

      wsStreamController.add(
        jsonEncode(
          PollUpdatedFeedEvent(
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'fid',
            poll: poll.copyWith(voteCount: 1, updatedAt: updatedDate),
            type: EventTypes.pollUpdated,
          ).toJson(),
        ),
      );
    });

    test('poll vote casted', () async {
      final poll = createDefaultPollResponseData();
      final pollId = poll.id;
      final firstOptionId = poll.options.first.id;

      setupMockActivity(
        activity: createDefaultActivityResponse(poll: poll),
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
        activity: createDefaultActivityResponse(poll: poll),
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
        activity: createDefaultActivityResponse(poll: poll),
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
        activity: createDefaultActivityResponse(poll: poll),
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
        activity: createDefaultActivityResponse(poll: poll),
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
        activity: createDefaultActivityResponse(poll: poll),
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

    test('comment added', () async {
      const activityId = 'activity-id';
      const fid = FeedId(group: 'group', id: 'id');
      final comment1 = createDefaultCommentResponse(
        objectId: activityId,
        id: 'comment-id-1',
        text: 'comment-text-1',
      );
      final comment2 = createDefaultCommentResponse(
        objectId: activityId,
        id: 'comment-id-2',
        text: 'comment-text-2',
      );

      final initialComments = createDefaultCommentsResponse(
        comments: [ThreadedCommentResponse.fromJson(comment1.toJson())],
      );

      setupMockActivity(
        activityId: activityId,
        activity: createDefaultActivityResponse(
          id: activityId,
          comments: [comment1],
        ),
        comments: initialComments,
      );

      final activity = client.activity(
        activityId: activityId,
        fid: fid,
      );
      final activityData = await activity.get();
      expect(activityData, isA<Result<ActivityData>>());
      expect(activityData.getOrNull()?.id, activityId);
      expect(activityData.getOrNull()?.comments.length, 1);

      expect(activity.state.activity?.commentCount, 1);
      expect(activity.state.comments.length, 1);

      // The event will trigger twice, first with updated count and then with the new comment.
      var count = 0;
      activity.notifier.stream.listen(
        expectAsync1(
          count: 2,
          (event) {
            count++;
            if (count == 1) {
              expect(event, isA<ActivityState>());
              expect(event.comments.length, 2);
            }
            if (count == 2) {
              expect(event, isA<ActivityState>());
              expect(event.activity?.commentCount, 2);
            }
          },
        ),
      );
      wsStreamController.add(
        jsonEncode(
          CommentAddedEvent(
            type: EventTypes.commentAdded,
            activity: createDefaultActivityResponse().activity,
            createdAt: DateTime.now(),
            custom: const {},
            fid: fid.rawValue,
            comment: comment2,
          ),
        ),
      );
    });

    test('comment updated', () async {
      const activityId = 'activity-id';
      const fid = FeedId(group: 'group', id: 'id');
      final comment = createDefaultCommentResponse(
        objectId: activityId,
        id: 'comment-id',
        text: 'comment-text',
      );

      final initialComments = createDefaultCommentsResponse(
        comments: [ThreadedCommentResponse.fromJson(comment.toJson())],
      );

      setupMockActivity(
        activityId: activityId,
        activity: createDefaultActivityResponse(
          id: activityId,
          comments: [comment],
        ),
        comments: initialComments,
      );

      final activity = client.activity(
        activityId: activityId,
        fid: fid,
      );
      final activityData = await activity.get();
      expect(activityData, isA<Result<ActivityData>>());
      expect(activityData.getOrNull()?.id, activityId);
      expect(activityData.getOrNull()?.comments.length, 1);

      expect(activity.state.activity?.commentCount, 1);
      expect(activity.state.comments.first.text, 'comment-text');

      // The event will trigger twice, first with updated count and then with the new comment.
      activity.notifier.stream.listen(
        expectAsync1(
          (event) {
            expect(event, isA<ActivityState>());
            expect(event.activity?.commentCount, 1);
            expect(event.comments.first.text, 'comment-text-2');
          },
        ),
      );
      wsStreamController.add(
        jsonEncode(
          CommentUpdatedEvent(
            type: EventTypes.commentUpdated,
            createdAt: DateTime.now(),
            custom: const {},
            fid: fid.rawValue,
            comment: comment.copyWith(text: 'comment-text-2'),
          ),
        ),
      );
    });

    test('comment removed', () async {
      const activityId = 'activity-id';
      const fid = FeedId(group: 'group', id: 'id');
      final comment = createDefaultCommentResponse(
        objectId: activityId,
        id: 'comment-id',
        text: 'comment-text',
      );

      final initialComments = createDefaultCommentsResponse(
        comments: [ThreadedCommentResponse.fromJson(comment.toJson())],
      );

      setupMockActivity(
        activityId: activityId,
        activity: createDefaultActivityResponse(
          id: activityId,
          comments: [comment],
        ),
        comments: initialComments,
      );

      final activity = client.activity(
        activityId: activityId,
        fid: fid,
      );
      final activityData = await activity.get();
      expect(activityData, isA<Result<ActivityData>>());
      expect(activityData.getOrNull()?.id, activityId);
      expect(activityData.getOrNull()?.comments.length, 1);

      expect(activity.state.activity?.commentCount, 1);
      expect(activity.state.comments.length, 1);

      // The event will trigger twice, first with updated count and then with the new comment.
      var count = 0;
      activity.notifier.stream.listen(
        expectAsync1(
          count: 2,
          (event) {
            count++;
            if (count == 1) {
              expect(event.comments, isEmpty);
            }
            if (count == 2) {
              expect(event, isA<ActivityState>());
              expect(event.activity?.commentCount, 0);
            }
          },
        ),
      );
      wsStreamController.add(
        jsonEncode(
          CommentDeletedEvent(
            type: EventTypes.commentDeleted,
            createdAt: DateTime.now(),
            custom: const {},
            fid: fid.rawValue,
            comment: comment,
          ),
        ),
      );
    });
  });
}

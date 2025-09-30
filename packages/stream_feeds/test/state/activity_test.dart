// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/state/activity_state.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../mocks.dart';
import '../ws_test_helpers.dart';

void main() {
  late StreamFeedsClientImpl client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClientImpl(
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
        (_) async => const Result.success(defaultCommentsResponse),
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
        (_) async => const Result.success(defaultCommentsResponse),
      );
    }

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
            expect(event.poll?.id, 'id');
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
            type: 'feeds.poll.vote_casted',
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
            expect(event.poll?.id, 'id');
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
            type: 'feeds.poll.vote_casted',
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
            expect(event.poll?.id, 'id');
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
            type: 'feeds.poll.vote_removed',
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
            expect(event.poll?.id, 'id');
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
            type: 'feeds.poll.vote_removed',
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
            expect(event.poll?.id, 'id');
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
            type: 'feeds.poll.closed',
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
            type: 'feeds.poll.deleted',
          ),
        ),
      );
    });
  });
}

const defaultCommentsResponse = GetCommentsResponse(
  comments: [],
  next: null,
  prev: null,
  duration: 'duration',
);

GetActivityResponse createDefaultActivityResponse({PollResponseData? poll}) =>
    GetActivityResponse(
      activity: ActivityResponse(
        id: 'id',
        attachments: const [],
        bookmarkCount: 0,
        commentCount: 0,
        comments: const [],
        createdAt: DateTime(2021, 1, 1),
        custom: const {},
        feeds: const [],
        filterTags: const [],
        interestTags: const [],
        latestReactions: const [],
        mentionedUsers: const [],
        moderation: null,
        notificationContext: null,
        ownBookmarks: const [],
        ownReactions: const [],
        parent: null,
        poll: poll,
        popularity: 0,
        reactionCount: 0,
        reactionGroups: const {},
        score: 0,
        searchData: const {},
        shareCount: 0,
        text: null,
        type: 'type',
        updatedAt: DateTime(2021, 2, 1),
        user: UserResponse(
          id: 'id',
          name: 'name',
          banned: false,
          blockedUserIds: const [],
          createdAt: DateTime(2021, 1, 1),
          custom: const {},
          language: 'language',
          online: false,
          role: 'role',
          teams: const [],
          updatedAt: DateTime(2021, 2, 1),
        ),
        visibility: ActivityResponseVisibility.public,
        visibilityTag: null,
      ),
      duration: 'duration',
    );

PollResponseData createDefaultPollResponseData({
  List<PollVoteResponseData> latestAnswers = const [],
  Map<String, List<PollVoteResponseData>> latestVotesByOption = const {},
}) =>
    PollResponseData(
      id: 'id',
      name: 'name',
      allowAnswers: true,
      allowUserSuggestedOptions: true,
      answersCount: latestAnswers.length,
      createdAt: DateTime.now(),
      createdById: 'id',
      custom: const {},
      description: 'description',
      enforceUniqueVote: true,
      latestAnswers: latestAnswers,
      latestVotesByOption: latestVotesByOption,
      ownVotes: const [],
      updatedAt: DateTime.now(),
      voteCount: latestVotesByOption.values
          .map((e) => e.length)
          .fold(0, (v, e) => v + e),
      voteCountsByOption: latestVotesByOption.map(
        (k, e) => MapEntry(k, e.length),
      ),
      votingVisibility: 'visibility',
      options: const [
        PollOptionResponseData(
          id: 'id1',
          text: 'text1',
          custom: {},
        ),
        PollOptionResponseData(
          id: 'id2',
          text: 'text2',
          custom: {},
        ),
      ],
    );

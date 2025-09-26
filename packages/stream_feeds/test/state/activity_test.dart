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

PollResponseData createDefaultPollResponseData() => PollResponseData(
      id: 'id',
      name: 'name',
      allowAnswers: true,
      allowUserSuggestedOptions: true,
      answersCount: 0,
      createdAt: DateTime.now(),
      createdById: 'id',
      custom: const {},
      description: 'description',
      enforceUniqueVote: true,
      latestAnswers: const [],
      latestVotesByOption: const {},
      ownVotes: const [],
      updatedAt: DateTime.now(),
      voteCount: 0,
      voteCountsByOption: const {},
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

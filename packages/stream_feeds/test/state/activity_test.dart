// ignore_for_file: avoid_redundant_argument_values

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  late StreamFeedsClientImpl client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUp(() {
    feedsApi = MockDefaultApi();
    webSocketChannel = MockWebSocketChannel();

    client = StreamFeedsClientImpl(
      apiKey: 'apiKey',
      user: const User(id: 'userId'),
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
        (_) async => Result.success(defaultActivityResponse),
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
}

const defaultCommentsResponse = GetCommentsResponse(
  comments: [],
  next: null,
  prev: null,
  duration: 'duration',
);

final defaultActivityResponse = GetActivityResponse(
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
    poll: null,
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

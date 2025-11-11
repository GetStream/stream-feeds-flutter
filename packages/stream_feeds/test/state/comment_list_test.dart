// ignore_for_file: avoid_redundant_argument_values

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

  setUpAll(() {
    registerFallbackValue(const QueryCommentsRequest(filter: {}));
  });

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

  group('CommentListEventHandler - Local filtering', () {
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
        () => feedsApi.queryComments(
          queryCommentsRequest: any(named: 'queryCommentsRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryCommentsResponse(
            duration: DateTime.now().toIso8601String(),
            comments: [
              createDefaultCommentResponse(id: 'comment-1', objectId: 'obj-1'),
              createDefaultCommentResponse(id: 'comment-2', objectId: 'obj-1'),
              createDefaultCommentResponse(
                id: 'comment-3',
                objectId: 'obj-1',
                reactionGroups: {
                  'like': ReactionGroupResponse(
                    count: 1,
                    firstReactionAt: DateTime(2025, 1, 1),
                    lastReactionAt: DateTime(2025, 1, 1),
                  ),
                },
              ),
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
      'CommentUpdatedEvent - should remove comment when updated to non-matching status',
      () async {
        final commentList = client.commentList(
          CommentsQuery(
            filter: Filter.equal(CommentsFilterField.status, 'active'),
          ),
        );

        await commentList.get();
        expect(commentList.state.comments, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            CommentUpdatedEvent(
              type: 'feeds.comment.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:source',
              comment: createDefaultCommentResponse(
                id: 'comment-1',
                objectId: 'obj-1',
              ).copyWith(status: 'deleted'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);

        expect(commentList.state.comments, hasLength(2));
      },
    );

    test(
      'No filter - should not remove comment when no filter specified',
      () async {
        final commentList = client.commentList(
          // No filter, all comments should be accepted
          const CommentsQuery(),
        );

        await commentList.get();
        expect(commentList.state.comments, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            CommentUpdatedEvent(
              type: 'feeds.comment.updated',
              createdAt: DateTime.now(),
              custom: const {},
              fid: 'user:source',
              comment: createDefaultCommentResponse(
                id: 'comment-1',
                objectId: 'obj-1',
              ).copyWith(status: 'deleted'),
            ),
          ),
        );

        // Wait for the event to be processed
        await Future<Object?>.delayed(Duration.zero);
        expect(commentList.state.comments, hasLength(3));
      },
    );

    test('comment reaction added', () async {
      final commentList = client.commentList(
        CommentsQuery(
          filter: Filter.equal(CommentsFilterField.status, 'active'),
        ),
      );
      await commentList.get();
      expect(commentList.state.comments, hasLength(3));
      expect(commentList.state.comments[1].reactionCount, 0);
      expect(commentList.state.comments[1].reactionGroups.length, 0);

      wsStreamController.add(
        jsonEncode(
          CommentReactionAddedEvent(
            type: EventTypes.commentReactionAdded,
            activity: createDefaultActivityResponse().activity,
            comment: createDefaultCommentResponse(
              id: 'comment-2',
              objectId: 'obj-1',
            ),
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'user:id',
            reaction: FeedsReactionResponse(
              activityId: 'obj-1',
              commentId: 'comment-2',
              type: 'like',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              user: createDefaultUserResponse(),
            ),
          ),
        ),
      );

      await Future<Object?>.delayed(Duration.zero);

      expect(commentList.state.comments, hasLength(3));
      expect(commentList.state.comments[1].reactionCount, 1);
      expect(commentList.state.comments[1].reactionGroups.length, 1);
      expect(commentList.state.comments[1].reactionGroups['like']?.count, 1);
    });

    test('comment reaction deleted', () async {
      final commentList = client.commentList(
        CommentsQuery(
          filter: Filter.equal(CommentsFilterField.status, 'active'),
        ),
      );
      await commentList.get();
      expect(commentList.state.comments, hasLength(3));
      expect(commentList.state.comments[2].reactionCount, 1);
      expect(commentList.state.comments[2].reactionGroups.length, 1);
      expect(commentList.state.comments[2].reactionGroups['like']?.count, 1);

      wsStreamController.add(
        jsonEncode(
          CommentReactionDeletedEvent(
            type: EventTypes.commentReactionDeleted,
            createdAt: DateTime.now(),
            custom: const {},
            fid: 'user:id',
            comment: createDefaultCommentResponse(
              id: 'comment-3',
              objectId: 'obj-1',
            ),
            reaction: FeedsReactionResponse(
              activityId: 'obj-1',
              commentId: 'comment-3',
              type: 'like',
              createdAt: DateTime(2025, 1, 1),
              updatedAt: DateTime.now(),
              user: createDefaultUserResponse(),
            ),
          ),
        ),
      );

      await Future<Object?>.delayed(Duration.zero);

      expect(commentList.state.comments, hasLength(3));
      expect(commentList.state.comments[2].reactionCount, 0);
      expect(commentList.state.comments[2].reactionGroups.length, 0);
    });
  });
}

import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

class FakeQueryCommentsRequest extends Fake implements QueryCommentsRequest {}

void main() {
  late StreamFeedsClient client;
  late MockDefaultApi feedsApi;
  late MockWebSocketChannel webSocketChannel;

  setUpAll(() {
    registerFallbackValue(FakeQueryCommentsRequest());
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
              createDefaultCommentResponse(id: 'comment-3', objectId: 'obj-1'),
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
  });
}

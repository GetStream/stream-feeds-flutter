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

  group('BookmarkListEventHandler - Local filtering', () {
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
        () => feedsApi.queryBookmarks(
          queryBookmarksRequest: any(named: 'queryBookmarksRequest'),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryBookmarksResponse(
            duration: DateTime.now().toIso8601String(),
            bookmarks: [
              createDefaultBookmarkResponse(
                folderId: 'folder-1',
                activityId: 'activity-1',
              ),
              createDefaultBookmarkResponse(
                folderId: 'folder-1',
                activityId: 'activity-2',
              ),
              createDefaultBookmarkResponse(
                folderId: 'folder-1',
                activityId: 'activity-3',
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
      'BookmarkUpdatedEvent - should remove bookmark when updated to non-matching user',
      () async {
        final bookmarkList = client.bookmarkList(
          BookmarksQuery(
            filter: Filter.equal(BookmarksFilterField.folderId, 'folder-1'),
          ),
        );

        await bookmarkList.get();
        expect(bookmarkList.state.bookmarks, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            BookmarkUpdatedEvent(
              type: 'feeds.bookmark.updated',
              createdAt: DateTime.now(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                folderId: 'folder-2',
                activityId: 'activity-1',
              ),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(bookmarkList.state.bookmarks, hasLength(2));
      },
    );

    test(
      'No filter - should not remove bookmark when no filter specified',
      () async {
        final bookmarkList = client.bookmarkList(
          // No filter, all bookmarks should be accepted
          const BookmarksQuery(),
        );

        await bookmarkList.get();
        expect(bookmarkList.state.bookmarks, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            BookmarkUpdatedEvent(
              type: 'feeds.bookmark.updated',
              createdAt: DateTime.now(),
              custom: const {},
              bookmark: createDefaultBookmarkResponse(
                folderId: 'folder-2',
                activityId: 'activity-1',
              ),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(bookmarkList.state.bookmarks, hasLength(3));
      },
    );
  });
}

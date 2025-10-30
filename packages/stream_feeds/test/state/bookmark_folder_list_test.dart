import 'dart:async';
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/src/client/feeds_client_impl.dart';
import 'package:stream_feeds/src/generated/api/model/bookmark_folder_updated_event.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

import '../test_utils.dart';

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

  group('BookmarkFolderListEventHandler - Local filtering', () {
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
        () => feedsApi.queryBookmarkFolders(
          queryBookmarkFoldersRequest: any(
            named: 'queryBookmarkFoldersRequest',
          ),
        ),
      ).thenAnswer(
        (_) async => Result.success(
          QueryBookmarkFoldersResponse(
            duration: DateTime.now().toIso8601String(),
            bookmarkFolders: [
              createDefaultBookmarkFolderResponse(id: 'folder-1'),
              createDefaultBookmarkFolderResponse(id: 'folder-2'),
              createDefaultBookmarkFolderResponse(id: 'folder-3'),
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
      'BookmarkFolderUpdatedEvent - should remove folder when updated to non-matching name',
      () async {
        final folderList = client.bookmarkFolderList(
          BookmarkFoldersQuery(
            filter: Filter.equal(
              BookmarkFoldersFilterField.folderName,
              'My Folder',
            ),
          ),
        );

        await folderList.get();
        expect(folderList.state.bookmarkFolders, hasLength(3));

        // Send event with folder that has different name (doesn't match filter)
        wsStreamController.add(
          jsonEncode(
            BookmarkFolderUpdatedEvent(
              type: 'feeds.bookmark_folder.updated',
              createdAt: DateTime.now(),
              custom: const {},
              bookmarkFolder: createDefaultBookmarkFolderResponse(
                id: 'folder-1',
                // Doesn't match folder name
              ).copyWith(name: 'Different Folder'),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(folderList.state.bookmarkFolders, hasLength(2));
      },
    );

    test(
      'No filter - should not remove folder when no filter specified',
      () async {
        final folderList = client.bookmarkFolderList(
          // No filter - all folders should be accepted
          const BookmarkFoldersQuery(),
        );

        await folderList.get();
        expect(folderList.state.bookmarkFolders, hasLength(3));

        wsStreamController.add(
          jsonEncode(
            BookmarkFolderUpdatedEvent(
              type: 'feeds.bookmark_folder.updated',
              createdAt: DateTime.now(),
              custom: const {},
              bookmarkFolder: createDefaultBookmarkFolderResponse(
                id: 'folder-1',
              ).copyWith(name: 'Different Folder'),
            ),
          ),
        );

        await Future<Object?>.delayed(Duration.zero);
        expect(folderList.state.bookmarkFolders, hasLength(3));
      },
    );
  });
}

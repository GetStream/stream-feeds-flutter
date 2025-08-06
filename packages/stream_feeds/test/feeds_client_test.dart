import 'dart:convert';

import 'package:stream_core/stream_core.dart';
import 'package:stream_feeds/src/generated/api/api.dart' as api;
import 'package:stream_feeds/src/ws/feeds_ws_event.dart';
import 'package:stream_feeds/stream_feeds.dart';
import 'package:test/test.dart';

void main() {
  group('FeedsClient', () {
    const testApiKey = 'test_api_key';
    const testUser = User(id: 'test_user_id', name: 'test_user_name');
    const testUserToken = 'test_user_token';

    group('constructor', () {
      test('should initialize with required parameters', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.apiKey, equals(testApiKey));
        expect(client.user, equals(testUser));
        expect(client.config, isA<FeedsConfig>());
        expect(client.config.networkMonitor, isNull);
      });

      test('should initialize with optional parameters', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.apiKey, equals(testApiKey));
        expect(client.user, equals(testUser));
        expect(client.config, isA<FeedsConfig>());
      });
    });

    group('feed', () {
      test('should create feed with correct query and client', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        final query = FeedQuery(group: 'test_group', id: 'test_id');
        final feed = client.feed(query: query);

        expect(feed.query, equals(query));
        expect(feed.client, equals(client));
      });

      test('should create multiple feeds with different queries', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        final query1 = FeedQuery(group: 'group1', id: 'id1');
        final query2 = FeedQuery(group: 'group2', id: 'id2');

        final feed1 = client.feed(query: query1);
        final feed2 = client.feed(query: query2);

        expect(feed1.query, equals(query1));
        expect(feed2.query, equals(query2));
        expect(feed1.client, equals(client));
        expect(feed2.client, equals(client));
      });
    });

    group('feedsRepository', () {
      test('should have initialized feedsRepository', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.feedsRepository, isNotNull);
      });
    });

    group('apiClient', () {
      test('should have initialized apiClient', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.apiClient, isNotNull);
      });
    });

    group('webSocketClient', () {
      test('should have initialized webSocketClient', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.webSocketClient, isNotNull);
      });
    });

    group('tokenManager', () {
      test('should have initialized tokenManager with static token', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.tokenManager, isNotNull);
      });
    });

    group('connectionRecoveryHandler', () {
      test('should be null initially', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.connectionRecoveryHandler, isNull);
      });
    });

    group('endpointConfig', () {
      test('should use production endpoint config', () {
        // Test that the endpoint config is accessible
        expect(FeedsClient.endpointConfig, isNotNull);
      });
    });

    group('feedsEvents', () {
      test('should return a stream', () {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        expect(client.feedsEvents, isA<Stream<FeedsWsEvent>>());
      });

      test('Should return a stream of FeedsWsEvent', () async {
        final client = FeedsClient(
          apiKey: testApiKey,
          user: testUser,
          userToken: testUserToken,
        );

        final events = <WsEvent>[];

        final eventsSubscription = client.feedsEvents.listen(events.add);

        // Health check events are kept internal
        client.webSocketClient.webSocketDidReceiveMessage(
          jsonEncode(testHealthCheckEvent.toJson()),
        );

        // Feeds specific events are passed to `feedsEvents`
        client.webSocketClient.webSocketDidReceiveMessage(
          jsonEncode(testCommentAddedEvent.toJson()),
        );

        await Future<void>.delayed(Duration.zero);

        expect(events, hasLength(1));
        expect(events[0], isA<FeedsWsEvent>());
        expect(
          (events[0] as FeedsWsEvent).event,
          isA<api.WSClientEventCommentAddedEvent>(),
        );

        await eventsSubscription.cancel();
      });
    });
  });
}

final testHealthCheckEvent = api.HealthCheckEvent(
  connectionId: 'test-id',
  createdAt: DateTime.now(),
  custom: const {},
  type: 'health.check',
);

final testCommentAddedEvent = api.CommentAddedEvent(
  comment: api.CommentResponse(
    confidenceScore: 0,
    createdAt: DateTime.now(),
    downvoteCount: 0,
    id: 'test-id',
    mentionedUsers: const [],
    objectId: 'test-object-id',
    objectType: 'test-object-type',
    ownReactions: const [],
    reactionCount: 0,
    replyCount: 0,
    score: 0,
    status: 'active',
    updatedAt: DateTime.now(),
    upvoteCount: 0,
    user: testUserResponse,
  ),
  createdAt: DateTime.now(),
  custom: const {},
  fid: 'test-fid',
  type: 'feeds.comment.added',
);

final testUserResponse = api.UserResponse(
  id: 'test-user-id',
  banned: false,
  blockedUserIds: const [],
  createdAt: DateTime.now(),
  custom: const {},
  language: '',
  online: false,
  role: '',
  teams: const [],
  updatedAt: DateTime.now(),
);

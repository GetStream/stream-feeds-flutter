import 'package:stream_feeds/src/generated/api/api.dart' as api;
import 'package:stream_feeds/stream_feeds.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

void main() {
  // ============================================================
  // FEATURE: System Configuration
  // ============================================================

  group('updateSystemEnvironment', () {
    feedsClientTest(
      'should update system environment successfully',
      body: (tester) {
        const environment = SystemEnvironment(
          sdkName: 'my-app',
          sdkIdentifier: 'flutter',
          sdkVersion: '1.0.0',
        );

        // Should not throw
        expect(
          () => tester.client.updateSystemEnvironment(environment),
          returnsNormally,
        );
      },
    );
  });

  // ============================================================
  // FEATURE: Activity Batch Operations
  // ============================================================

  group('upsertActivities', () {
    setUpAll(() {
      registerFallbackValue(
        const api.UpsertActivitiesRequest(activities: []),
      );
    });

    feedsClientTest(
      'should upsert activities successfully',
      body: (tester) async {
        final activities = [
          const api.ActivityRequest(
            feeds: ['user:123'],
            id: '1',
            text: 'Hello World',
            type: 'post',
          ),
          const api.ActivityRequest(
            feeds: ['user:456'],
            id: '2',
            text: 'Another post',
            type: 'post',
          ),
        ];

        final request = api.UpsertActivitiesRequest(activities: activities);

        tester.mockApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
          result: createDefaultUpsertActivitiesResponse(count: 2),
        );

        final result = await tester.client.upsertActivities(
          activities: activities,
        );

        expect(result.isSuccess, isTrue);
        final data = result.getOrThrow();
        expect(data.length, equals(2));

        tester.verifyApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle upsert activities failure',
      body: (tester) async {
        final activities = [
          const api.ActivityRequest(
            feeds: ['user:123'],
            id: '1',
            text: 'Hello',
            type: 'post',
          ),
        ];

        final request = api.UpsertActivitiesRequest(activities: activities);

        tester.mockApiFailure(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
          error: Exception('Failed to upsert activities'),
        );

        final result = await tester.client.upsertActivities(
          activities: activities,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.upsertActivities(upsertActivitiesRequest: request),
        );
      },
    );
  });

  group('deleteActivities', () {
    setUpAll(() {
      registerFallbackValue(
        const api.DeleteActivitiesRequest(ids: []),
      );
    });

    feedsClientTest(
      'should delete activities successfully',
      body: (tester) async {
        final ids = ['activity-1', 'activity-2'];
        final request = api.DeleteActivitiesRequest(
          ids: ids,
          hardDelete: false,
        );

        tester.mockApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
          result: createDefaultDeleteActivitiesResponse(ids: ids),
        );

        final result = await tester.client.deleteActivities(
          ids: ids,
          hardDelete: false,
        );

        expect(result.isSuccess, isTrue);
        final response = result.getOrThrow();
        expect(response.duration, isNotEmpty);

        tester.verifyApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle delete activities failure',
      body: (tester) async {
        final ids = ['activity-1'];
        final request = api.DeleteActivitiesRequest(
          ids: ids,
          hardDelete: true,
        );

        tester.mockApiFailure(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
          error: Exception('Failed to delete activities'),
        );

        final result = await tester.client.deleteActivities(
          ids: ids,
          hardDelete: true,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.deleteActivities(deleteActivitiesRequest: request),
        );
      },
    );
  });

  // ============================================================
  // FEATURE: App Operations
  // ============================================================

  group('getApp', () {
    feedsClientTest(
      'should get app data successfully',
      body: (tester) async {
        tester.mockApi(
          (api) => api.getApp(),
          result: createDefaultGetApplicationResponse(),
        );

        final result = await tester.client.getApp();

        expect(result.isSuccess, isTrue);
        final appData = result.getOrThrow();
        expect(appData.name, isNotEmpty);

        tester.verifyApi((api) => api.getApp());
      },
    );

    feedsClientTest(
      'should handle get app failure',
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.getApp(),
          error: Exception('Failed to get app data'),
        );

        final result = await tester.client.getApp();

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.getApp());
      },
    );
  });

  // ============================================================
  // FEATURE: Device Operations
  // ============================================================

  group('queryDevices', () {
    feedsClientTest(
      'should query devices successfully',
      body: (tester) async {
        tester.mockApi(
          (api) => api.listDevices(),
          result: createDefaultListDevicesResponse(),
        );

        final result = await tester.client.queryDevices();

        expect(result.isSuccess, isTrue);
        final response = result.getOrThrow();
        expect(response.duration, isNotEmpty);

        tester.verifyApi((api) => api.listDevices());
      },
    );

    feedsClientTest(
      'should handle query devices failure',
      body: (tester) async {
        tester.mockApiFailure(
          (api) => api.listDevices(),
          error: Exception('Failed to query devices'),
        );

        final result = await tester.client.queryDevices();

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.listDevices());
      },
    );
  });

  group('createDevice', () {
    setUpAll(() {
      registerFallbackValue(
        const api.CreateDeviceRequest(
          id: 'fallback',
          pushProvider: api.CreateDeviceRequestPushProvider.firebase,
        ),
      );
    });

    feedsClientTest(
      'should create device successfully',
      body: (tester) async {
        const deviceId = 'firebase-token-123';
        const pushProvider = PushNotificationsProvider.firebase;
        const pushProviderName = 'MyApp Firebase';

        const request = api.CreateDeviceRequest(
          id: deviceId,
          pushProvider: api.CreateDeviceRequestPushProvider.firebase,
          pushProviderName: pushProviderName,
        );

        tester.mockApi(
          (api) => api.createDevice(createDeviceRequest: request),
          result: createDefaultCreateDeviceResponse(),
        );

        final result = await tester.client.createDevice(
          id: deviceId,
          pushProvider: pushProvider,
          pushProviderName: pushProviderName,
        );

        expect(result.isSuccess, isTrue);

        tester.verifyApi(
          (api) => api.createDevice(createDeviceRequest: request),
        );
      },
    );

    feedsClientTest(
      'should handle create device failure',
      body: (tester) async {
        const deviceId = 'invalid-token';
        const pushProvider = PushNotificationsProvider.apn;
        const pushProviderName = 'MyApp APN';

        const request = api.CreateDeviceRequest(
          id: deviceId,
          pushProvider: api.CreateDeviceRequestPushProvider.apn,
          pushProviderName: pushProviderName,
        );

        tester.mockApiFailure(
          (api) => api.createDevice(createDeviceRequest: request),
          error: Exception('Failed to create device'),
        );

        final result = await tester.client.createDevice(
          id: deviceId,
          pushProvider: pushProvider,
          pushProviderName: pushProviderName,
        );

        expect(result.isFailure, isTrue);

        tester.verifyApi(
          (api) => api.createDevice(createDeviceRequest: request),
        );
      },
    );
  });

  group('deleteDevice', () {
    feedsClientTest(
      'should delete device successfully',
      body: (tester) async {
        const deviceId = 'firebase-token-123';

        tester.mockApi(
          (api) => api.deleteDevice(id: deviceId),
          result: createDefaultDeleteDeviceResponse(),
        );

        final result = await tester.client.deleteDevice(id: deviceId);

        expect(result.isSuccess, isTrue);

        tester.verifyApi((api) => api.deleteDevice(id: deviceId));
      },
    );

    feedsClientTest(
      'should handle delete device failure',
      body: (tester) async {
        const deviceId = 'invalid-device';

        tester.mockApiFailure(
          (api) => api.deleteDevice(id: deviceId),
          error: Exception('Device not found'),
        );

        final result = await tester.client.deleteDevice(id: deviceId);

        expect(result.isFailure, isTrue);

        tester.verifyApi((api) => api.deleteDevice(id: deviceId));
      },
    );
  });

  // ============================================================
  // FEATURE: CDN Operations
  // ============================================================

  group('deleteFile', () {
    feedsClientTest(
      'should delete file successfully',
      body: (tester) async {
        const fileUrl = 'https://cdn.example.com/files/document.pdf';

        tester.mockCdn(
          (cdn) => cdn.deleteFile(url: fileUrl),
          result: const DurationResponse(duration: '10ms'),
        );

        final result = await tester.client.deleteFile(url: fileUrl);

        expect(result.isSuccess, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteFile(url: fileUrl));
      },
    );

    feedsClientTest(
      'should handle delete file failure',
      body: (tester) async {
        const fileUrl = 'https://cdn.example.com/files/missing.pdf';

        tester.mockCdnFailure(
          (cdn) => cdn.deleteFile(url: fileUrl),
          error: Exception('File not found'),
        );

        final result = await tester.client.deleteFile(url: fileUrl);

        expect(result.isFailure, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteFile(url: fileUrl));
      },
    );
  });

  group('deleteImage', () {
    feedsClientTest(
      'should delete image successfully',
      body: (tester) async {
        const imageUrl = 'https://cdn.example.com/images/photo.jpg';

        tester.mockCdn(
          (cdn) => cdn.deleteImage(url: imageUrl),
          result: const DurationResponse(duration: '10ms'),
        );

        final result = await tester.client.deleteImage(url: imageUrl);

        expect(result.isSuccess, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteImage(url: imageUrl));
      },
    );

    feedsClientTest(
      'should handle delete image failure',
      body: (tester) async {
        const imageUrl = 'https://cdn.example.com/images/missing.jpg';

        tester.mockCdnFailure(
          (cdn) => cdn.deleteImage(url: imageUrl),
          error: Exception('Image not found'),
        );

        final result = await tester.client.deleteImage(url: imageUrl);

        expect(result.isFailure, isTrue);

        tester.verifyCdn((cdn) => cdn.deleteImage(url: imageUrl));
      },
    );
  });
}

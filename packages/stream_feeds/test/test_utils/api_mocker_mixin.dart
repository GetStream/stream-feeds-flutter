import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'mocks.dart';

/// Mixin for test utilities that need to mock and verify API calls.
///
/// Provides a clean interface for mocking API calls and verifying
/// interactions without exposing the underlying API client.
mixin ApiMockerMixin {
  /// The feeds API client used for mocking.
  MockDefaultApi get feedsApi;

  /// Sets up a mock API response for the given API call.
  ///
  /// The API instance is injected into the callback for clean syntax:
  /// ```dart
  /// activityTest(
  ///   'test',
  ///   build: (client) => client.activity(...),
  ///   setUp: (tester) async {
  ///     tester.mockApi(
  ///       (api) => api.activityFeedback(
  ///         activityId: 'activity-1',
  ///         activityFeedbackRequest: request,
  ///       ),
  ///       result: createDefaultActivityFeedbackResponse(),
  ///     );
  ///   },
  /// );
  /// ```
  void mockApi<T>(
    Future<Result<T>> Function(MockDefaultApi api) apiCall, {
    required T result,
  }) {
    return mockApiResult(apiCall, result: Result.success(result));
  }

  /// Sets up a mock API response with a custom Result.
  ///
  /// Use this when you need to return a failure:
  /// ```dart
  /// tester.mockApiResult(
  ///   (api) => api.addActivity(...),
  ///   result: Result.failure(NetworkException('Error')),
  /// );
  /// ```
  void mockApiResult<T>(
    Future<Result<T>> Function(MockDefaultApi api) apiCall, {
    required Result<T> result,
  }) {
    return when(
      () => apiCall(feedsApi),
    ).thenAnswer((_) async => result);
  }

  /// Verifies that an API call was made exactly once.
  ///
  /// The API instance is injected into the callback:
  /// ```dart
  /// activityTest(
  ///   'test',
  ///   build: (client) => client.activity(...),
  ///   body: (tester) async {
  ///     tester.verifyApi(
  ///       (api) => api.activityFeedback(
  ///         activityId: 'activity-1',
  ///         activityFeedbackRequest: request,
  ///       ),
  ///     );
  ///   },
  /// );
  /// ```
  void verifyApi<T>(
    Future<Result<T>> Function(MockDefaultApi api) apiCall,
  ) {
    return verifyApiCalled(apiCall, times: 1);
  }

  /// Verifies that an API call was made a specific number of times.
  ///
  /// Use this when you need to verify multiple calls:
  /// ```dart
  /// tester.verifyApiCalled(
  ///   (api) => api.addActivity(...),
  ///   times: 3,
  /// );
  /// ```
  void verifyApiCalled<T>(
    Future<Result<T>> Function(MockDefaultApi api) apiCall, {
    required int times,
  }) {
    return verify(() => apiCall(feedsApi)).called(times);
  }

  /// Verifies that an API call was never made.
  ///
  /// Use this to ensure an API wasn't called:
  /// ```dart
  /// tester.verifyNeverCalled(
  ///   (api) => api.deleteActivity(activityId: 'activity-1'),
  /// );
  /// ```
  VerificationResult verifyNeverCalled<T>(
    Future<Result<T>> Function(MockDefaultApi api) apiCall,
  ) {
    return verifyNever(() => apiCall(feedsApi));
  }
}

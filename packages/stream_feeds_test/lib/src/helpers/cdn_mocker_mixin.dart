import 'package:mocktail/mocktail.dart';
import 'package:stream_feeds/stream_feeds.dart';

import 'mocks.dart';

/// A mixin that provides utilities for mocking and verifying CDN API calls.
///
/// This mixin helps set up expectations for CDN operations like file/image
/// upload and deletion, and verify that the expected calls were made.
mixin CdnMockerMixin {
  /// The mock CDN API client instance.
  MockCdnApi get cdnApi;

  /// Mocks a CDN API call to return a specific result.
  ///
  /// Use this to set up expectations for CDN operations:
  /// ```dart
  /// mockCdn(
  ///   (cdn) => cdn.deleteFile(url: 'https://example.com/file.pdf'),
  ///   result: const DurationResponse(duration: '10ms'),
  /// );
  /// ```
  void mockCdn<T>(
    Future<Result<T>> Function(CdnApi cdn) call, {
    required T result,
  }) {
    when(() => call(cdnApi)).thenAnswer(
      (_) async => Result.success(result),
    );
  }

  /// Mocks a CDN API call to fail with an error.
  ///
  /// Use this to simulate error scenarios:
  /// ```dart
  /// mockCdnFailure(
  ///   (cdn) => cdn.deleteImage(url: 'https://example.com/image.jpg'),
  ///   error: Exception('Failed to delete'),
  /// );
  /// ```
  void mockCdnFailure<T>(
    Future<Result<T>> Function(CdnApi cdn) call, {
    required Object error,
  }) {
    when(() => call(cdnApi)).thenAnswer(
      (_) async => Result.failure(error),
    );
  }

  /// Verifies that a CDN API call was made.
  ///
  /// Use this after performing operations to verify the expected CDN calls:
  /// ```dart
  /// verifyCdn(
  ///   (cdn) => cdn.deleteFile(url: 'https://example.com/file.pdf'),
  /// );
  /// ```
  void verifyCdn<T>(
    Future<Result<T>> Function(CdnApi cdn) call,
  ) {
    verify(() => call(cdnApi)).called(1);
  }

  /// Verifies that a CDN API call was made a specific number of times.
  ///
  /// ```dart
  /// verifyCdnCalled(
  ///   (cdn) => cdn.uploadImage(file: any(named: 'file')),
  ///   times: 3,
  /// );
  /// ```
  void verifyCdnCalled<T>(
    Future<Result<T>> Function(CdnApi cdn) call, {
    required int times,
  }) {
    verify(() => call(cdnApi)).called(times);
  }

  /// Verifies that a CDN API call was never made.
  ///
  /// ```dart
  /// verifyNeverCalledCdn(
  ///   (cdn) => cdn.deleteFile(url: any(named: 'url')),
  /// );
  /// ```
  void verifyNeverCalledCdn<T>(
    Future<Result<T>> Function(CdnApi cdn) call,
  ) {
    verifyNever(() => call(cdnApi));
  }
}

import 'dart:async';

import '../../stream_feeds.dart' as api;
import '../../stream_feeds.dart';
import '../utils/batcher.dart';

class CapabilitiesRepository {
  CapabilitiesRepository(api.DefaultApi api) : _api = api;

  final api.DefaultApi _api;
  final Map<String, List<FeedOwnCapability>> _capabilities = {};

  late final Batcher<String, Result<Map<String, List<FeedOwnCapability>>>> _fetchBatcher = Batcher(
    action: (feeds) => _fetchWithRetry(feeds: feeds),
  );

  Future<Result<Map<String, List<FeedOwnCapability>>>> fetchCapabilities({
    required List<String> feeds,
  }) async {
    final result = await _api.ownBatch(
      ownBatchRequest: api.OwnBatchRequest(feeds: feeds),
    );

    return result.map((response) {
      final ownCapabilities = <String, List<FeedOwnCapability>>{};
      for (final MapEntry(:key, :value) in response.data.entries) {
        if (value.ownCapabilities case final capabilities?) {
          ownCapabilities[key] = [...capabilities];
        }
      }

      _mergeWithCache(ownCapabilities);
      return ownCapabilities;
    });
  }

  void cacheCapabilitiesForFeeds(List<FeedData> feeds) {
    for (final feed in feeds) {
      cacheCapabilities(feed.id, feed.ownCapabilities);
    }
  }

  void cacheCapabilities(String feed, List<FeedOwnCapability> capabilities) {
    _capabilities[feed] = capabilities;
  }

  Future<List<FeedOwnCapability>?> getCapabilities(String feed) async {
    return _capabilities[feed] ?? (await _fetchBatchedFeedCapabilities(feed)).getOrNull();
  }

  void dispose() {
    _fetchBatcher.dispose();
  }

  Future<Result<Map<String, List<FeedOwnCapability>>>> _fetchWithRetry({
    required List<String> feeds,
    bool isRetry = false,
  }) async {
    final result = await fetchCapabilities(feeds: feeds);
    if (result.shouldRetry() && !isRetry) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return _fetchWithRetry(feeds: feeds, isRetry: true);
    }
    return result;
  }

  Future<Result<List<FeedOwnCapability>>> _fetchBatchedFeedCapabilities(
    String feed,
  ) async {
    final capabilities = await _fetchBatcher.add(feed);
    return capabilities.map((capabilities) => capabilities[feed] ?? []);
  }

  void _mergeWithCache(Map<String, List<FeedOwnCapability>> capabilities) {
    _capabilities.addAll(capabilities);
  }
}

extension on Result<Map<String, List<FeedOwnCapability>>> {
  bool shouldRetry() => switch (this) {
    api.Success() => false,
    api.Failure(:final error) => switch (error) {
      StreamNetworkException(isCancelled: true) => false,
      StreamNetworkException() => true,
      // A rate limit is not retried here: this waits a fixed moment, which is
      // not the wait a rate limit asks for.
      StreamApiException(:final statusCode) => statusCode < 100 || statusCode >= 500,
      _ => false,
    },
  };
}

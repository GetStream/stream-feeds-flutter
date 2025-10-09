import 'dart:async';

import '../../stream_feeds.dart' as api;
import '../../stream_feeds.dart';
import '../utils/batcher.dart';

class CapabilitiesRepository {
  CapabilitiesRepository({required api.DefaultApi api}) : _api = api;

  final api.DefaultApi _api;
  final Map<String, List<FeedOwnCapability>> _capabilities = {};

  late final Batcher<String, Result<Map<String, List<FeedOwnCapability>>>>
      _fetchBatcher = Batcher(
    action: (feeds) => fetchCapabilities(feeds: feeds),
  );

  Future<Result<Map<String, List<FeedOwnCapability>>>> fetchCapabilities({
    required List<String> feeds,
  }) async {
    final result = await _api.ownCapabilitiesBatch(
      ownCapabilitiesBatchRequest: api.OwnCapabilitiesBatchRequest(
        feeds: feeds,
      ),
    );

    return result.map((response) {
      _mergeWithCache(response.capabilities);
      return response.capabilities;
    });
  }

  void addCapabilities(String feed, List<FeedOwnCapability> capabilities) {
    _capabilities[feed] = capabilities;
  }

  Future<List<FeedOwnCapability>?> getCapabilities(String feed) async {
    return _capabilities[feed] ??
        (await _fetchBatchedFeedCapabilities(feed)).getOrNull();
  }

  void dispose() {
    _fetchBatcher.dispose();
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

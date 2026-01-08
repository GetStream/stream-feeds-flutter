import 'package:stream_core/stream_core.dart';

import '../generated/api/api.dart' as api;

/// Repository for managing collections.
///
/// Provides methods for creating, reading, updating, and deleting collections.
/// Collections are data objects that can be attached to activities for managing
/// shared data across multiple activities.
///
/// All methods return [Result] objects for explicit error handling.
class CollectionsRepository {
  /// Creates a new [CollectionsRepository] instance.
  ///
  /// The [api] parameter is required for making API calls to the Stream Feeds service.
  const CollectionsRepository(this._api);

  // The API client used for making requests to the Stream Feeds service.
  final api.DefaultApi _api;

  /// Reads collections by their references.
  ///
  /// By default, users can only read their own collections.
  ///
  /// Returns a [Result] containing [api.ReadCollectionsResponse] or an error.
  Future<Result<api.ReadCollectionsResponse>> readCollections({
    required List<String> refs,
  }) {
    return _api.readCollections(collectionRefs: refs);
  }

  /// Creates new collections in a batch operation.
  ///
  /// Collections are data objects that can be attached to activities for managing
  /// shared data across multiple activities.
  ///
  /// Returns a [Result] containing [api.CreateCollectionsResponse] or an error.
  Future<Result<api.CreateCollectionsResponse>> createCollections({
    required api.CreateCollectionsRequest request,
  }) {
    return _api.createCollections(createCollectionsRequest: request);
  }

  /// Updates existing collections in a batch operation.
  ///
  /// Only the custom data field is updatable. Users can only update their own collections.
  ///
  /// Returns a [Result] containing [api.UpdateCollectionsResponse] or an error.
  Future<Result<api.UpdateCollectionsResponse>> updateCollections({
    required api.UpdateCollectionsRequest request,
  }) {
    return _api.updateCollections(updateCollectionsRequest: request);
  }

  /// Deletes collections in a batch operation.
  ///
  /// Users can only delete their own collections.
  ///
  /// Returns a [Result] containing [api.DeleteCollectionsResponse] or an error.
  Future<Result<api.DeleteCollectionsResponse>> deleteCollections({
    required List<String> refs,
  }) {
    return _api.deleteCollections(collectionRefs: refs);
  }
}

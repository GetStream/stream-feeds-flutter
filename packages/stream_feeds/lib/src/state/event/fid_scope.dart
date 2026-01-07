import '../../models/feed_id.dart';

/// A type-safe wrapper for matching feed identifiers in event handling.
///
/// Wraps a nullable feed ID string to provide clarity and type safety when
/// filtering events by feed. This is needed because feed IDs in WebSocket
/// events are reliable for filtering, but state update events generated
/// internally from API calls cannot always determine the affected feed IDs.
extension type const FidScope._(String? fid) {
  /// Creates a scope that matches only the specific [fid].
  ///
  /// Use this when the feed ID is known and trustworthy, such as from
  /// WebSocket events.
  const FidScope.of(String this.fid);

  /// Creates a scope that matches all feeds.
  ///
  /// Use this for state update events from API calls where the affected
  /// feed IDs cannot be determined.
  static const unknown = FidScope._(null);

  /// Whether this scope matches the given [feedId].
  ///
  /// Returns true when the scope is unknown or strictly matches the feed ID.
  bool matches(FeedId feedId) => fid == null || strictlyMatches(feedId);

  /// Whether this scope strictly matches the given [feedId].
  ///
  /// Returns true only when the feed ID exactly matches this scope's feed ID.
  bool strictlyMatches(FeedId feedId) => fid == feedId.rawValue;
}

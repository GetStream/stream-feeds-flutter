import '../../stream_feeds.dart';

/// A query configuration for retrieving and managing feed data from Stream Feeds.
///
/// [FeedQuery] defines the parameters used to fetch activities, followers, following, and members
/// for a specific feed. It supports filtering, pagination, ranking, and real-time updates.
class FeedQuery {
  /// Creates a new feed query with the specified group and ID.
  FeedQuery({
    required String group,
    required String id,
    this.watch = false,
  }) : fid = FeedId(group: group, id: id);

  /// The unique identifier for the feed.
  final FeedId fid;

  /// If true, subscribes to web-socket events for this feed.
  final bool watch;
}

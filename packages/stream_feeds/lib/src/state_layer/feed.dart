import 'package:stream_core/stream_core.dart';

import '../../stream_feeds.dart';
import '../repositories.dart';
import 'feed_state.dart';

/// A feed represents a collection of activities and provides methods to interact with them.
///
/// The [Feed] class is the primary interface for working with feeds in the Stream Feeds SDK.
/// It provides functionality for:
/// - Creating and managing feed data
/// - Adding, updating, and deleting activities
/// - Managing comments, reactions, and bookmarks
/// - Handling follows and feed memberships
/// - Creating polls and managing poll interactions
/// - Pagination and querying of feed content
///
/// Each feed instance is associated with a specific feed ID and maintains its own state
/// that can be observed for real-time updates. The feed state includes activities,
/// followers, members, and other feed-related data.
class Feed {
  /// Creates a new feed instance with the specified query and client.
  ///
  /// - Parameters:
  ///   - query: The query configuration for the feed
  ///   - client: The client used to interact with the feed
  Feed({
    required this.query,
    required this.client,
  }) : _feedsRepository = client.feedsRepository {
    _feedStateNotifier = FeedStateNotifier(
      client: client,
      fid: query.fid,
      query: query,
      currentUserId: client.user.id,
    );
  }

  final FeedQuery query;
  final FeedsClient client;

  final FeedsRepository _feedsRepository;
  FeedStateNotifier get stateNotifier => _feedStateNotifier;
  late final FeedStateNotifier _feedStateNotifier;

  Future<Result<GetOrCreateFeedData>> getOrCreate() async {
    try {
      final feed = await _feedsRepository.getOrCreateFeed(query);
      _feedStateNotifier.didQueryFeed(feed);
      return Result.success(feed);
    } catch (e) {
      return Result.failure(e);
    }
  }
}

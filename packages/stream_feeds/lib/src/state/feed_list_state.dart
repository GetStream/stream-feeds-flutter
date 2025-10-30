import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:stream_core/stream_core.dart';

import '../models/feed_data.dart';
import '../models/pagination_data.dart';
import '../models/query_configuration.dart';
import 'query/feeds_query.dart';

part 'feed_list_state.freezed.dart';

/// Manages the state of a feed list and handles state updates.
///
/// Provides methods to update the feed list state in response to data changes
/// and real-time events from the Stream Feeds API.
class FeedListStateNotifier extends StateNotifier<FeedListState> {
  FeedListStateNotifier({
    required FeedListState initialState,
  }) : super(initialState);

  QueryConfiguration<FeedData>? _queryConfig;
  List<Sort<FeedData>> get feedsSort {
    return _queryConfig?.sort ?? FeedsSort.defaultSort;
  }

  /// Handles the result of a query for more feeds.
  void onQueryMoreFeeds(
    PaginationResult<FeedData> result,
    QueryConfiguration<FeedData> queryConfig,
  ) {
    _queryConfig = queryConfig;

    // Merge the new feeds with the existing ones (keeping the sort order)
    final updatedFeeds = state.feeds.merge(
      result.items,
      key: (it) => it.fid.rawValue,
      compare: feedsSort.compare,
    );

    state = state.copyWith(
      feeds: updatedFeeds,
      pagination: result.pagination,
    );
  }

  /// Handles updates to a specific feed.
  void onFeedUpdated(FeedData feed) {
    final updatedFeeds = state.feeds.map((it) {
      if (it.fid.rawValue != feed.fid.rawValue) return it;
      return feed;
    }).toList();

    state = state.copyWith(feeds: updatedFeeds);
  }

  /// Handles the removal of a specific feed.
  void onFeedRemoved(String feed) {
    final updatedFeeds = state.feeds.where((it) {
      return it.fid.rawValue != feed;
    }).toList();

    state = state.copyWith(feeds: updatedFeeds);
  }
}

/// An observable state object that manages the current state of a feed list.
///
/// Maintains the current list of feeds and pagination information for
/// efficient loading and navigation through feed collections.
@freezed
class FeedListState with _$FeedListState {
  const FeedListState({
    this.feeds = const [],
    this.pagination,
  });

  /// All the paginated feeds currently loaded.
  ///
  /// This list contains all feeds that have been fetched across multiple
  /// pagination requests. The feeds are automatically sorted according to
  /// the current sorting configuration.
  @override
  final List<FeedData> feeds;

  /// Last pagination information.
  ///
  /// Contains the next and previous cursors for pagination, allowing for
  /// efficient navigation through the complete feed collection.
  @override
  final PaginationData? pagination;

  /// Indicates whether there are more feeds available to load.
  bool get canLoadMore => pagination?.next != null;
}

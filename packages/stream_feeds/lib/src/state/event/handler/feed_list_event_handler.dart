import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feed_data.dart';
import '../../feed_list_state.dart';

import '../../query/feeds_query.dart';
import 'state_event_handler.dart';

class FeedListEventHandler implements StateEventHandler {
  const FeedListEventHandler({
    required this.query,
    required this.state,
  });

  final FeedsQuery query;
  final FeedListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    bool matchesQueryFilter(FeedData feed) {
      final filter = query.filter;
      if (filter == null) return true;
      return filter.matches(feed);
    }

    if (event is api.FeedUpdatedEvent) {
      final feed = event.feed.toModel();
      if (!matchesQueryFilter(feed)) {
        // If the updated feed no longer matches the query filter, remove it
        return state.onFeedRemoved(feed.fid.rawValue);
      }

      return state.onFeedUpdated(feed);
    }

    // Handle other events if needed
  }
}

import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../../models/feed_data.dart';
import '../../../utils/filter.dart';
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
    if (event is api.FeedCreatedEvent) {
      final feed = event.feed.toModel();
      // Check if the new feed matches the query filter
      if (!feed.matches(query.filter)) return;

      return state.onFeedAdded(feed);
    }

    if (event is api.FeedUpdatedEvent) {
      final feed = event.feed.toModel();
      if (!feed.matches(query.filter)) {
        // If the updated feed no longer matches the query filter, remove it
        return state.onFeedRemoved(feed.fid.rawValue);
      }

      return state.onFeedUpdated(feed);
    }

    if (event is api.FeedDeletedEvent) {
      return state.onFeedRemoved(event.fid);
    }

    // Handle other events if needed
  }
}

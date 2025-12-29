import '../../../utils/filter.dart';
import '../../feed_list_state.dart';
import '../../query/feeds_query.dart';
import '../state_event_handler.dart';
import '../state_update_event.dart';

class FeedListEventHandler implements StateEventHandler {
  const FeedListEventHandler({
    required this.query,
    required this.state,
  });

  final FeedsQuery query;
  final FeedListStateNotifier state;

  @override
  void handleEvent(StateUpdateEvent event) {
    if (event is FeedAdded) {
      // Check if the new feed matches the query filter
      if (!event.feed.matches(query.filter)) return;

      return state.onFeedAdded(event.feed);
    }

    if (event is FeedUpdated) {
      if (!event.feed.matches(query.filter)) {
        // If the updated feed no longer matches the query filter, remove it
        return state.onFeedRemoved(event.feed.fid.rawValue);
      }

      return state.onFeedUpdated(event.feed);
    }

    if (event is FeedDeleted) {
      return state.onFeedRemoved(event.fid);
    }

    // Handle other events if needed
  }
}

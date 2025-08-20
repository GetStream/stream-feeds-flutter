import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../models/feed_data.dart';
import '../feed_list_state.dart';

import 'state_event_handler.dart';

class FeedListEventHandler implements StateEventHandler {
  const FeedListEventHandler({
    required this.state,
  });

  final FeedListStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.FeedUpdatedEvent) {
      return state.onFeedUpdated(event.feed.toModel());
    }

    // Handle other events if needed
  }
}

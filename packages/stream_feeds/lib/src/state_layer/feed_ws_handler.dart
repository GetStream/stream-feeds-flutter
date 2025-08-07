import 'dart:async';

import '../generated/api/api.dart';
import '../repositories.dart';
import '../repositories/feeds_data_mappers.dart';
import '../ws/feeds_ws_event.dart';
import 'feed_state.dart';

class FeedWsHandler {
  FeedWsHandler({
    required this.client,
    required this.stateNotifier,
  }) {
    _feedsEventsSubscription = client.feedsEvents.listen(_onEvent);
  }

  String get currentUserId => client.user.id;

  void _onEvent(FeedsWsEvent event) {
    switch (event.apiEvent) {
      case final WSClientEventActivityReactionAddedEvent wsEvent:
        stateNotifier.onReactionAdded(
          wsEvent.activityReactionAddedEvent.reaction.toModel(),
        );
        break;
      case final WSClientEventActivityReactionDeletedEvent wsEvent:
        stateNotifier.onReactionRemoved(
          wsEvent.activityReactionDeletedEvent.reaction.toModel(),
        );
        break;
      default:
        break;
    }
  }

  late final StreamSubscription<FeedsWsEvent> _feedsEventsSubscription;

  void dispose() {
    _feedsEventsSubscription.cancel();
  }

  final RepositoryProvider client;
  final FeedStateNotifier stateNotifier;
}

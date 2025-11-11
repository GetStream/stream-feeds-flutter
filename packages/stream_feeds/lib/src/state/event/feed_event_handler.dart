import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_pin_data.dart';
import '../../models/aggregated_activity_data.dart';
import '../../models/feed_data.dart';
import '../../models/follow_data.dart';
import '../../models/mark_activity_data.dart';
import '../../repository/capabilities_repository.dart';
import '../feed_state.dart';

import '../query/feed_query.dart';
import 'feed_capabilities_mixin.dart';
import 'partial_activity_event_handler.dart';
import 'partial_activity_list_event_handler.dart';
import 'state_event_handler.dart';

class FeedEventHandler with FeedCapabilitiesMixin implements StateEventHandler {
  FeedEventHandler({
    required this.query,
    required this.state,
    required this.capabilitiesRepository,
  });

  final FeedQuery query;
  final FeedStateNotifier state;

  @override
  final CapabilitiesRepository capabilitiesRepository;

  late final PartialActivityListEventHandler _partialActivityListEventHandler =
      PartialActivityListEventHandler(
    state: state,
    capabilitiesRepository: capabilitiesRepository,
    fid: query.fid,
    activityFilter: query.activityFilter,
  );

  late final PartialActivityEventHandler _partialActivityEventHandler =
      PartialActivityEventHandler(
    state: state,
    capabilitiesRepository: capabilitiesRepository,
    fid: query.fid,
  );

  @override
  Future<void> handleEvent(WsEvent event) async {
    if (await _partialActivityListEventHandler.handleEvent(event)) return;
    if (await _partialActivityEventHandler.handleEvent(event)) return;

    final fid = query.fid;

    if (event is api.ActivityPinnedEvent) {
      if (event.fid != fid.rawValue) return;

      state.onActivityPinned(event.pinnedActivity.toModel());
      return;
    }

    if (event is api.ActivityUnpinnedEvent) {
      if (event.fid != fid.rawValue) return;

      state.onActivityUnpinned(event.pinnedActivity.activity.id);
      return;
    }

    if (event is api.ActivityMarkEvent) {
      if (event.fid != fid.rawValue) return;
      state.onActivityMarked(event.toModel());
      return;
    }

    if (event is api.NotificationFeedUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onNotificationFeedUpdated(
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
        event.notificationStatus,
      );
    }

    if (event is api.FeedDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onFeedDeleted();
    }

    if (event is api.FeedUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onFeedUpdated(event.feed.toModel());
    }

    if (event is api.FollowCreatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onFollowAdded(event.follow.toModel());
    }

    if (event is api.FollowDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onFollowRemoved(event.follow.toModel());
    }

    if (event is api.FollowUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onFollowUpdated(event.follow.toModel());
    }

    // Member events are already handled in MemberListEventHandler
    if (event is api.FeedMemberRemovedEvent) return;
    if (event is api.FeedMemberUpdatedEvent) return;

    if (event is api.StoriesFeedUpdatedEvent) {
      if (event.fid != fid.rawValue) return;

      return state.onAggregatedActivitiesUpdated(
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
      );
    }

    // Handle other events if necessary
  }
}

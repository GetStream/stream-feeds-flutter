import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/activity_pin_data.dart';
import '../../models/aggregated_activity_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/comment_data.dart';
import '../../models/feed_data.dart';
import '../../models/feed_id.dart';
import '../../models/feeds_reaction_data.dart';
import '../../models/follow_data.dart';
import '../../models/mark_activity_data.dart';
import '../../repository/capabilities_repository.dart';
import '../feed_state.dart';

import 'feed_capabilities_mixin.dart';
import 'state_event_handler.dart';

class FeedEventHandler with FeedCapabilitiesMixin implements StateEventHandler {
  const FeedEventHandler({
    required this.fid,
    required this.state,
    required this.capabilitiesRepository,
  });

  final FeedId fid;
  final FeedStateNotifier state;
  @override
  final CapabilitiesRepository capabilitiesRepository;

  @override
  Future<void> handleEvent(WsEvent event) async {
    if (event is api.ActivityAddedEvent) {
      if (event.fid != fid.rawValue) return;
      final activity = event.activity.toModel();
      state.onActivityAdded(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is api.ActivityUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      final activity = event.activity.toModel();
      final updatedActivity = await withUpdatedFeedCapabilities(activity);

      return state.onActivityUpdated(updatedActivity ?? activity);
    }

    if (event is api.ActivityDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityRemoved(event.activity.toModel());
    }

    if (event is api.ActivityReactionAddedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onReactionAdded(event.reaction.toModel());
    }

    if (event is api.ActivityReactionDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onReactionRemoved(event.reaction.toModel());
    }

    if (event is api.ActivityPinnedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityPinned(event.pinnedActivity.toModel());
    }

    if (event is api.ActivityUnpinnedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityUnpinned(event.pinnedActivity.activity.id);
    }

    if (event is api.ActivityMarkEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityMarked(event.toModel());
    }

    if (event is api.NotificationFeedUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onNotificationFeedUpdated(
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
        event.notificationStatus,
      );
    }

    if (event is api.BookmarkAddedEvent) {
      if (!event.bookmark.activity.feeds.contains(fid.rawValue)) return;
      return state.onBookmarkAdded(event.bookmark.toModel());
    }

    if (event is api.BookmarkDeletedEvent) {
      if (!event.bookmark.activity.feeds.contains(fid.rawValue)) return;
      return state.onBookmarkRemoved(event.bookmark.toModel());
    }

    if (event is api.CommentAddedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onCommentAdded(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onCommentRemoved(event.comment.toModel());
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

    // Handle other events if necessary
  }
}

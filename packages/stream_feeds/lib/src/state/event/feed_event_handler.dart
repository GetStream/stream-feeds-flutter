import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/activity_pin_data.dart';
import '../../models/aggregated_activity_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/comment_data.dart';
import '../../models/feed_data.dart';
import '../../models/feeds_reaction_data.dart';
import '../../models/follow_data.dart';
import '../../models/mark_activity_data.dart';
import '../../repository/capabilities_repository.dart';
import '../feed_state.dart';

import '../query/feed_query.dart';
import 'feed_capabilities_mixin.dart';
import 'state_event_handler.dart';

class FeedEventHandler with FeedCapabilitiesMixin implements StateEventHandler {
  const FeedEventHandler({
    required this.query,
    required this.state,
    required this.currentUserId,
    required this.capabilitiesRepository,
  });

  final FeedQuery query;
  final FeedStateNotifier state;
  final String currentUserId;

  @override
  final CapabilitiesRepository capabilitiesRepository;

  @override
  Future<void> handleEvent(WsEvent event) async {
    final fid = query.fid;

    bool matchesQueryFilter(ActivityData activity) {
      final filter = query.activityFilter;
      if (filter == null) return true;
      return filter.matches(activity);
    }

    if (event is api.ActivityAddedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) return;

      state.onActivityAdded(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return;
    }

    if (event is api.ActivityUpdatedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the updated activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      return state.onActivityUpdated(updatedActivity ?? activity);
    }

    if (event is api.ActivityDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityRemoved(event.activity.toModel());
    }

    if (event is api.ActivityReactionAddedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the reaction's activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onReactionAdded(event.reaction.toModel());
    }

    if (event is api.ActivityReactionDeletedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the reaction's activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onReactionRemoved(event.reaction.toModel());
    }

    if (event is api.ActivityPinnedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.pinnedActivity.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the pinned activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onActivityPinned(event.pinnedActivity.toModel());
    }

    if (event is api.ActivityUnpinnedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.pinnedActivity.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the unpinned activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

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
      final activity = event.bookmark.activity.toModel();
      if (!activity.feeds.contains(fid.rawValue)) return;

      if (!matchesQueryFilter(activity)) {
        // If the bookmark's activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onBookmarkAdded(event.bookmark.toModel());
    }

    if (event is api.BookmarkDeletedEvent) {
      final activity = event.bookmark.activity.toModel();
      if (!activity.feeds.contains(fid.rawValue)) return;

      if (!matchesQueryFilter(activity)) {
        // If the bookmark's activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onBookmarkRemoved(event.bookmark.toModel());
    }

    if (event is api.CommentAddedEvent) {
      if (event.fid != fid.rawValue) return;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) {
        // If the comment's activity no longer matches the filter, remove it
        return state.onActivityRemoved(activity);
      }

      return state.onCommentAdded(event.comment.toModel());
    }

    if (event is api.CommentDeletedEvent) {
      if (event.fid != fid.rawValue) return;
      // TODO: Match event activity against filter once available in the event
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

    if (event is api.StoriesFeedUpdatedEvent) {
      if (event.fid != fid.rawValue) return;

      return state.onAggregatedActivitiesUpdated(
        event.aggregatedActivities?.map((it) => it.toModel()).toList(),
      );
    }

    if (event is api.ActivityFeedbackEvent) {
      final payload = event.activityFeedback;
      final userId = payload.user.id;

      // Only process events for the current user
      if (userId != currentUserId) return;

      // Only handle hide action for now
      if (payload.action == api.ActivityFeedbackEventPayloadAction.hide) {
        return state.onActivityHidden(
          activityId: payload.activityId,
          hidden: payload.value == 'true',
        );
      }
    }

    // Handle other events if necessary
  }
}

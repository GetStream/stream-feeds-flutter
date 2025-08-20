import 'package:stream_core/stream_core.dart';

import '../../../generated/api/models.dart' as api;
import '../../models/activity_data.dart';
import '../../models/activity_pin_data.dart';
import '../../models/bookmark_data.dart';
import '../../models/comment_data.dart';
import '../../models/feed_data.dart';
import '../../models/feed_id.dart';
import '../../models/feeds_reaction_data.dart';
import '../../models/follow_data.dart';
import '../../models/mark_activity_data.dart';
import '../feed_state.dart';

import 'state_event_handler.dart';

class FeedEventHandler implements StateEventHandler {
  const FeedEventHandler({
    required this.fid,
    required this.state,
  });

  final FeedId fid;
  final FeedStateNotifier state;

  @override
  void handleEvent(WsEvent event) {
    if (event is api.ActivityAddedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityAdded(event.activity.toModel());
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

    if (event is api.ActivityUpdatedEvent) {
      if (event.fid != fid.rawValue) return;
      return state.onActivityUpdated(event.activity.toModel());
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

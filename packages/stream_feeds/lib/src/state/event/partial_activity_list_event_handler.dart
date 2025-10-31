import '../../../stream_feeds.dart';
import '../../../stream_feeds.dart' as api;
import '../../repository/capabilities_repository.dart';
import 'feed_capabilities_mixin.dart';

class PartialActivityListEventHandler with FeedCapabilitiesMixin {
  const PartialActivityListEventHandler({
    required this.state,
    required this.capabilitiesRepository,
    this.fid,
    this.activityFilter,
  });

  final StateWithListOfActivities state;
  final FeedId? fid;
  @override
  final CapabilitiesRepository capabilitiesRepository;
  final ActivitiesFilter? activityFilter;

  bool matchesQueryFilter(ActivityData activity) {
    final filter = activityFilter;
    if (filter == null) return true;
    return filter.matches(activity);
  }

  bool removeActivityIfNotMatchesFilter(ActivityData activity) {
    if (!matchesQueryFilter(activity)) {
      state.onActivityRemoved(activity);
      return true;
    }
    return false;
  }

  Future<bool> handleEvent(WsEvent event) async {
    if (event is api.ActivityAddedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;

      final activity = event.activity.toModel();
      if (!matchesQueryFilter(activity)) return false;

      state.onActivityAdded(activity);

      final updatedActivity = await withUpdatedFeedCapabilities(activity);
      if (updatedActivity != null) state.onActivityUpdated(updatedActivity);

      return true;
    }

    if (event is api.ActivityUpdatedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;
      return removeActivityIfNotMatchesFilter(event.activity.toModel());
    }

    if (event is api.ActivityDeletedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;
      state.onActivityRemoved(event.activity.toModel());
      return true;
    }

    if (event is api.ActivityReactionAddedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;
      return removeActivityIfNotMatchesFilter(event.activity.toModel());
    }

    if (event is api.ActivityReactionDeletedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;
      return removeActivityIfNotMatchesFilter(event.activity.toModel());
    }

    if (event is api.ActivityPinnedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;

      return removeActivityIfNotMatchesFilter(
        event.pinnedActivity.activity.toModel(),
      );
    }

    if (event is api.ActivityUnpinnedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;

      return removeActivityIfNotMatchesFilter(
        event.pinnedActivity.activity.toModel(),
      );
    }

    if (event is api.BookmarkAddedEvent) {
      final activity = event.bookmark.activity.toModel();
      if (fid != null && !activity.feeds.contains(fid!.rawValue)) return false;
      return removeActivityIfNotMatchesFilter(activity);
    }

    if (event is api.BookmarkDeletedEvent) {
      final activity = event.bookmark.activity.toModel();
      if (fid != null && !activity.feeds.contains(fid!.rawValue)) return false;

      return removeActivityIfNotMatchesFilter(activity);
    }

    if (event is api.CommentAddedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;

      final activity = event.activity.toModel();
      return removeActivityIfNotMatchesFilter(activity);
    }

    if (event is api.CommentDeletedEvent) {
      if (fid != null && event.fid != fid!.rawValue) return false;
      // TODO: Match event activity against filter once available in the event
      return false;
    }

    return false;
  }
}

abstract interface class StateWithListOfActivities {
  void onActivityAdded(ActivityData activity);
  void onActivityUpdated(ActivityData activity);
  void onActivityRemoved(ActivityData activity);
}

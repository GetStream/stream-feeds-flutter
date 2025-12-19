## Upcoming
- Added missing state updates for the websocket events.

## 0.5.0
- [BREAKING] Unified `ThreadedCommentData` into `CommentData` to handle both flat and threaded comments.
- [BREAKING] Renamed `ActivitiesFilterField.type` to `ActivitiesFilterField.activityType`.
- [BREAKING] Changed `ActivityData.location` field type from `ActivityLocation?` to `LocationCoordinate?`.
- Add support for `enforceUnique` parameter while adding reactions.
- [BREAKING] Changed default behavior for `ActivityAddedEvent` in feeds: activities from other users
  are now ignored by default. Only activities from the current user matching the feed's filter are
  added. Add `onNewActivity` callback to `feed`, `feedFromId`, or `feedFromQuery` to customize.
- Add location filtering support for activities with `ActivitiesFilterField.near` and `ActivitiesFilterField.withinBounds` filter fields.
- Add new activity filter fields: `ActivitiesFilterField.feed` and `ActivitiesFilterField.interestTags`.
- Export previously missing public APIs: models, state objects, and queries.
- Add `ownFollows` field to `FeedData` to store the follow relationships of the current user in the feed.

## 0.4.0
- [BREAKING] Change `queryFollowSuggestions` return type to `List<FeedSuggestionData>`.
- [BREAKING] Remove `activitySelectorOptions` from `FeedQuery`.
- Add `activityFeedback` method to `Feed` and `Activity` for submitting activity feedback.
- Add `hidden` and `preview` fields to `ActivityData`.
- Update follower and following counts on the feed state when receiving follow websocket events.
- Fix FeedsReactionData id for updating reactions in the feed state.
- Improvement for stories and minor updates to other AggregatedActivity state updates.
- Export all the State classes and Queries used in the SDK.

## 0.3.1
- Update API client with renaming `addReaction` to `addActivityReaction` and `deleteReaction` to `deleteActivityReaction`.
- Update `activity.currentFeed` capabilities when adding or updating activity from websocket events.

## 0.3.0
- [BREAKING] Renamed `AppLifecycleStateProvider` to `LifecycleStateProvider` and `AppLifecycleState` to `LifecycleState`.
- Re-watch websocket events for feeds when the websocket reconnects.

## 0.2.0
- [BREAKING] Update API client code, specifically the FeedOwnCapability enum.
- Fix unknown enums for `List<FeedOwnCapability>` in `GetOrCreateFeedResponse` to be `FeedOwnCapability.unknown`.
- Fix for updating poll votes from web socket events.

## 0.1.0
- Initial release of Feeds V3 SDK for Dart and Flutter.
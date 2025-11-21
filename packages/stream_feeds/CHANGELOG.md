## unreleased
- [BREAKING] Change `queryFollowSuggestions` return type to `List<FeedSuggestionData>`.
- Add `hidden` and `preview` fields to `ActivityData`.
- Update follower and following counts on the feed state when receiving follow websocket events.
- Fix FeedsReactionData id for updating reactions in the feed state.
- Improvement for stories and minor updates to other AggregatedActivity state updates.

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
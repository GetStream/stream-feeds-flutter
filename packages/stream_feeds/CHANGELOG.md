## Upcoming

### 💥 BREAKING CHANGES

- Raised the minimum Dart SDK to `^3.12.0`
- `Ban` removed, replaced by `BanInfoResponse`: `target` is now `user`, `shadow` is optional rather than required, and `channel` is gone
- `PollResponseData.votingVisibility` is now required, so anything constructing one directly must supply it
- `ActivityCommentList.state` returns `ActivityCommentListState` rather than `StateNotifier<ActivityCommentListState>`, matching the other state classes
- Removed the call, recording, streaming and chat types that were never part of the Feeds API
- Every failure now arrives as a `StreamException` subclass — `StreamApiException`, `StreamNetworkException`, `StreamAuthenticationException` or `StreamClientException` — in place of `ClientException`, `HttpClientException` and `StreamApiError`, which are gone. `StreamFeedsException` aliases the base type, so catching it catches all four, and each carries the `cause` it was built from

### ✨ Features

- Guest users (`User.guest(id)`) can now connect, with the same read and write access and the same real-time updates as a regular user; their id is assigned on connect, so read it from `client.user` afterwards
- Added `StreamFeedsClient.dispose`, which releases the client for good; `connect` throws a `StateError` afterwards
- Added a `connectWebSocket` flag to `connect`. Pass `false` for a client that only makes requests: no real-time updates arrive, and a watched query is rejected
- Added `FeedsConfig.logConfig`, which says how much the client reports and where those records go; left out, the client stays silent. Records include the `Authorization` header, so weigh what reads them
- Added `StreamFeedsClient.userList`, a paginated, filterable and sortable query over users, in the same shape as the other list APIs
- Added `isRead` and `isSeen` to `ActivityData` and `AggregatedActivityData`, for notification-feed read/seen state
- Added `friendReactionCount` and `friendReactions` to `ActivityData`, exposing reactions from friends
- Added `metrics` to `ActivityData`, carrying impressions, clicks and similar
- Added `bookmarkCount` and `editedAt` to `CommentData`, and `location` to `FeedData`
- Added `createNotificationActivity`, `skipPush` and `enrichOwnFields` flags to `FeedAddActivityRequest`
- Added `customHeaders` to `FeedsConfig`, sent with every API request. The SDK's own headers win where they overlap, and none of this reaches the WebSocket
- Added `skipEnrichUrl` to `FeedAddActivityRequest`, `ActivityAddCommentRequest` and `ActivityUpdateCommentRequest`, which leaves URLs in the text unenriched
- Added `restrictReplies` to `ActivityData` and `FeedAddActivityRequest`, saying who may comment on an activity: everyone, nobody, or people the author follows
- Added `enrichmentOptions` to `FeedQuery`. Pass `EnrichmentOptions(enrichOwnFollowings: true)` for `ownFollowings` on each activity, which is what tells you whether the current user may comment when `restrictReplies` is `people_i_follow`
- Added a `deleteNotificationActivity` flag to the `deleteActivity`, `deleteComment`, `deleteActivityReaction` and `deleteCommentReaction` methods on `Feed` and `Activity`, which deletes the matching notification activity too
- A restored activity or comment now reappears in feed and list state, through `ActivityRestoredEvent` and `CommentRestoredEvent`

### 🐛 Bug Fixes

- Fixed `connect` failing when called straight after `disconnect`
- Fixed a connection that could not authenticate hanging until it timed out, rather than failing with the reason
- Fixed the `X-Stream-Client` header: the SDK identifier was sent twice, the version was hardcoded, and the OS was left out

### 🔄 Changed

- Attachment uploads for a batch of requests now share one concurrency limit instead of one each, so `Activity.addCommentsBatch` no longer starts several uploads per comment at once; a failure also calls off the uploads still in flight rather than letting them finish work that is about to be discarded
- `disconnect` now only closes the connection, leaving the client reusable with its existing subscriptions intact; releasing it is `dispose`
- An expired token now recovers on its own: the connection comes back with one the `TokenProvider` issued afterwards, without the app doing anything
- `connect` throws a `StateError` when a connection is already established or in progress, and a `StreamFeedsException` carrying the cause when it fails
- Renamed the types below. The old names still compile, with a deprecation warning, and `dart fix --apply` migrates them:

| Old name | New name |
|---|---|
| `FollowPair` | `UnfollowPair` |
| `ActivityLocation` | `Location` |
| `OwnUser` | `OwnUserResponse` |
| `UserMute` | `UserMuteResponse` |
| `Poll` | `PollResponseData` |
| `PollOption` | `PollOptionResponseData` |
| `PollVote` | `PollVoteResponseData` |
| `BanActionRequest` | `BanActionRequestPayload` |
| `BanActionRequestDeleteMessages` | `BanActionRequestPayloadDeleteMessages` |
| `BlockActionRequest` | `BlockActionRequestPayload` |
| `ShadowBlockActionRequest` | `ShadowBlockActionRequestPayload` |
| `CustomActionRequest` | `CustomActionRequestPayload` |
| `DeleteUserRequest` | `DeleteUserRequestPayload` |
| `DeleteActivityRequest` | `DeleteActivityRequestPayload` |
| `DeleteCommentRequest` | `DeleteCommentRequestPayload` |
| `DeleteReactionRequest` | `DeleteReactionRequestPayload` |
| `DeleteMessageRequest` | `DeleteMessageRequestPayload` |
| `MarkReviewedRequest` | `MarkReviewedRequestPayload` |
| `RejectAppealRequest` | `RejectAppealRequestPayload` |
| `RestoreActionRequest` | `RestoreActionRequestPayload` |
| `UnbanActionRequest` | `UnbanActionRequestPayload` |
| `UnblockActionRequest` | `UnblockActionRequestPayload` |

## 0.5.1
- Added missing state updates for the websocket events.
- Add appeal-related methods to moderation client: `appeal`, `getAppeal`, and `queryAppeals`.
- Add `activityCount` field to `FeedData` model to track the number of activities in a feed.
- Add `ownFollowings` field to `FeedData` model to track feeds that the current user is following from this feed.
- Add batch follow and unfollow support.
- Add `updateActivityPartial` method to `Feed` for partially updating activities.
- Add collections API methods: `readCollections`, `createCollections`, `updateCollections`, and `deleteCollections`.
- Add `CollectionData` model and `collections` field to `ActivityData` for enriched collection data.
- Add `collectionRefs` field to `FeedAddActivityRequest` to attach collections to activities.

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
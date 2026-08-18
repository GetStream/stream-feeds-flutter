## Upcoming

### New methods
- Added `userList` to `StreamFeedsClient`, returning a `UserList` state object for querying users. Takes a `UsersQuery` with type-safe `UsersFilterField`/`UsersSortField` filtering and sorting, plus an `includeDeactivatedUsers` option. Users are paginated with `limit`/`offset` (`UserListState.nextOffset` / `canLoadMore`) because the users endpoint returns no page cursors.

### New fields
- Added `isRead` and `isSeen` fields to `ActivityData` and `AggregatedActivityData` for notification-feed read/seen state.
- Added `friendReactionCount` and `friendReactions` fields to `ActivityData` to expose reactions from friends.
- Added `metrics` field to `ActivityData` for server-side activity metrics (impressions, clicks, etc.).
- Added `bookmarkCount` and `editedAt` fields to `CommentData`.
- Added `location` (`LocationCoordinate?`) field to `FeedData`.
- Added `createNotificationActivity`, `skipPush`, and `enrichOwnFields` optional flags to `FeedAddActivityRequest`.

### WebSocket events
- `ActivityRestoredEvent` and `CommentRestoredEvent` are now handled: restored items are upserted back into feed/list state.

### Deprecated — renamed types (backwards-compatible aliases added)
The following generated types were renamed in the underlying API. Deprecated `typedef` aliases
have been added so existing code continues to compile with a deprecation warning. Migrate to
the new names at your earliest convenience.

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

### [BREAKING]

- [BREAKING] `Ban` class removed. Replaced by `BanInfoResponse` which has a different field structure: `target` → `user`, `shadow: bool` (required) → `shadow: bool?` (optional), `channel` field removed.
- [BREAKING] `PollResponseData.votingVisibility` is now a required field (was optional in the old `Poll` class). Code constructing `Poll`/`PollResponseData` directly (e.g. in tests) must supply `votingVisibility`.
- [BREAKING] The following types were removed from the public API. They belonged to video/call/chat functionality not relevant to the Feeds SDK and should not have been exported: `AudioSettingsResponse`, `BackstageSettingsResponse`, `BroadcastSettingsResponse`, `CallIngressResponse`, `CallParticipantResponse`, `CallSessionResponse`, `CallSettingsResponse`, `Channel`, `ChannelConfig`, `ChannelMember`, `ChannelMemberLookup`, `ChannelPushPreferences`, `CompositeRecordingResponse`, `ConfigOverrides`, `DeliveryReceipts`, `DenormalizedChannelFields`, `Device`, `EgressHlsResponse`, `EgressResponse`, `EgressRtmpResponse`, `FrameRecordingResponse`, `FrameRecordingSettingsResponse`, `GeofenceSettingsResponse`, `HlsSettingsResponse`, `IndividualRecordingResponse`, `IndividualRecordingSettingsResponse`, `IngressAudioEncodingResponse`, `IngressSettingsResponse`, `IngressSourceResponse`, `IngressVideoEncodingResponse`, `IngressVideoLayerResponse`, `LimitsSettingsResponse`, `Message`, `MessageReminder`, `ModerationActionConfig`, `NoiseCancellationSettings`, `PrivacySettings`, `RawRecordingResponse`, `RawRecordingSettingsResponse`, `ReadReceipts`, `RecordSettingsResponse`, `RingSettingsResponse`, `RtmpIngress`, `RtmpSettingsResponse`, `ScreensharingSettingsResponse`, `SessionSettingsResponse`, `SharedLocation`, `SpeechSegmentConfig`, `SrtIngress`, `TargetResolution`, `ThumbnailResponse`, `ThumbnailsSettingsResponse`, `TranscriptionSettingsResponse`, `TranslationSettings`, `TypingIndicators`, `UserMutedEvent`, `VideoSettingsResponse`, `WhipIngress`.
- [BREAKING] Changed `ActivityCommentList.state` getter return type from `StateNotifier<ActivityCommentListState>` to `ActivityCommentListState` to be consistent with all other state classes.

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
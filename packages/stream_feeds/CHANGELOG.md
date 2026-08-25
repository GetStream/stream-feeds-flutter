## Upcoming

- [BREAKING] Raised the minimum Dart SDK to `^3.12.0`, which `stream_core` now requires.
- [BREAKING] `Ban` class removed. Replaced by `BanInfoResponse` which has a different field structure: `target` → `user`, `shadow: bool` (required) → `shadow: bool?` (optional), `channel` field removed.
- [BREAKING] `PollResponseData.votingVisibility` is now a required field (was optional in the old `Poll` class). Code constructing `Poll`/`PollResponseData` directly (e.g. in tests) must supply `votingVisibility`.
- [BREAKING] Changed `ActivityCommentList.state` getter return type from `StateNotifier<ActivityCommentListState>` to `ActivityCommentListState` to be consistent with all other state classes.
- [BREAKING] The following types were removed from the public API. They belonged to video/call/chat functionality not relevant to the Feeds SDK and should not have been exported: `AudioSettingsResponse`, `BackstageSettingsResponse`, `BroadcastSettingsResponse`, `CallIngressResponse`, `CallParticipantResponse`, `CallSessionResponse`, `CallSettingsResponse`, `Channel`, `ChannelConfig`, `ChannelMember`, `ChannelMemberLookup`, `ChannelPushPreferences`, `CompositeRecordingResponse`, `ConfigOverrides`, `DeliveryReceipts`, `DenormalizedChannelFields`, `Device`, `EgressHlsResponse`, `EgressResponse`, `EgressRtmpResponse`, `FrameRecordingResponse`, `FrameRecordingSettingsResponse`, `GeofenceSettingsResponse`, `HlsSettingsResponse`, `IndividualRecordingResponse`, `IndividualRecordingSettingsResponse`, `IngressAudioEncodingResponse`, `IngressSettingsResponse`, `IngressSourceResponse`, `IngressVideoEncodingResponse`, `IngressVideoLayerResponse`, `LimitsSettingsResponse`, `Message`, `MessageReminder`, `ModerationActionConfig`, `NoiseCancellationSettings`, `PrivacySettings`, `RawRecordingResponse`, `RawRecordingSettingsResponse`, `ReadReceipts`, `RecordSettingsResponse`, `RingSettingsResponse`, `RtmpIngress`, `RtmpSettingsResponse`, `ScreensharingSettingsResponse`, `SessionSettingsResponse`, `SharedLocation`, `SpeechSegmentConfig`, `SrtIngress`, `TargetResolution`, `ThumbnailResponse`, `ThumbnailsSettingsResponse`, `TranscriptionSettingsResponse`, `TranslationSettings`, `TypingIndicators`, `UserMutedEvent`, `VideoSettingsResponse`, `WhipIngress`.
- Guest users (`User.guest(id)`) now obtain a real JWT during `connect()` instead of falling back to the anonymous token, so they get a full session with WebSocket support. The server assigns the id, so read it from `client.user` afterwards.
- Add `dispose()`, which releases the client for good. `disconnect()` now only closes the connection, leaving the client reusable with its existing subscriptions intact.
- Add a `connectWebSocket` flag to `connect()`. Pass `false` to authenticate without opening a WebSocket, for a client that only makes requests.
- Add `FeedsConfig.logConfig` to say how much the client reports and where those records go. Left out, the client stays silent.
- A token the server refuses as expired now recovers on its own, reconnecting with one the `TokenProvider` issued afterwards.
- `connect()` now throws a `ClientException` when a connection is already established or in progress, and the one it throws on failure carries the underlying cause.
- Add `isRead` and `isSeen` fields to `ActivityData` and `AggregatedActivityData` for notification-feed read/seen state.
- Add `friendReactionCount` and `friendReactions` fields to `ActivityData` to expose reactions from friends.
- Add `metrics` field to `ActivityData` for server-side activity metrics.
- Add `bookmarkCount` and `editedAt` fields to `CommentData`.
- Add `location` field to `FeedData`.
- Add `createNotificationActivity`, `skipPush`, and `enrichOwnFields` flags to `FeedAddActivityRequest`.
- `ActivityRestoredEvent` and `CommentRestoredEvent` are now handled: restored items are upserted back into feed and list state.
- Fixed the HTTP logs carrying the `Authorization` header, which put the user's token in the console of every app that had logging on.
- Fixed `connect()` failing when called straight after `disconnect()`, which reported the pending closure as a failed connection.
- Fixed a failure to send the WebSocket authentication frame being ignored, which left the connection stuck until it timed out.
- Deprecated the generated types renamed in the underlying API. Aliases keep existing code compiling with a deprecation warning:

| Old name | New name |
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
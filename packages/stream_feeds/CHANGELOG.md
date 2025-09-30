## Unreleased
- [BREAKING] Renamed `AppLifecycleStateProvider` to `LifecycleStateProvider` and `AppLifecycleState` to `LifecycleState`.

## 0.2.0
- [BREAKING] Update API client code, specifically the FeedOwnCapability enum.
- Fix unknown enums for `List<FeedOwnCapability>` in `GetOrCreateFeedResponse` to be `FeedOwnCapability.unknown`.
- Fix for updating poll votes from web socket events.

## 0.1.0
- Initial release of Feeds V3 SDK for Dart and Flutter.
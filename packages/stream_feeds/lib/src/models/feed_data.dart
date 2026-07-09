import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';
import 'feed_id.dart';
import 'feed_member_data.dart';
import 'follow_data.dart';
import 'user_data.dart';

part 'feed_data.freezed.dart';

/// A feed in the Stream Feeds system.
///
/// A container for activities that can be followed, have members, and maintain
/// social relationships. Contains feed metadata, social statistics, access
/// control capabilities, and supports real-time updates via WebSocket.
@freezed
class FeedData with _$FeedData {
  /// Creates a new [FeedData] instance.
  const FeedData({
    required this.activityCount,
    required this.createdAt,
    required this.createdBy,
    this.deletedAt,
    required this.description,
    required this.fid,
    this.filterTags = const [],
    required this.followerCount,
    required this.followingCount,
    required this.groupId,
    required this.id,
    this.location,
    required this.memberCount,
    required this.name,
    required this.ownCapabilities,
    this.ownMembership,
    this.ownFollowings,
    this.ownFollows,
    required this.pinCount,
    required this.updatedAt,
    this.visibility,
    this.custom,
  });

  /// The number of activities in the feed.
  @override
  final int activityCount;

  /// The date and time when the feed was created.
  @override
  final DateTime createdAt;

  /// The user who created the feed.
  @override
  final UserData createdBy;

  /// The date and time when the feed was deleted, if applicable.
  @override
  final DateTime? deletedAt;

  /// A description of the feed.
  @override
  final String description;

  /// The unique identifier for the feed.
  @override
  final FeedId fid;

  /// A list of tags used to filter the feed.
  @override
  final List<String> filterTags;

  /// The number of followers for the feed.
  @override
  final int followerCount;

  /// The number of feeds that this feed is following.
  @override
  final int followingCount;

  /// The group identifier for the feed.
  @override
  final String groupId;

  /// The unique identifier for the feed.
  @override
  final String id;

  /// Geographic location associated with the feed, if any.
  @override
  final LocationCoordinate? location;

  /// The number of members in the feed.
  @override
  final int memberCount;

  /// The name of the feed.
  @override
  final String name;

  /// The capabilities that the current user has on the feed.
  @override
  final List<FeedOwnCapability> ownCapabilities;

  /// The membership information of the current user in the feed.
  @override
  final FeedMemberData? ownMembership;

  /// The feeds that the current user is following from this feed.
  @override
  final List<FollowData>? ownFollowings;

  /// The follow relationships of the current user in the feed.
  @override
  final List<FollowData>? ownFollows;

  /// The number of pinned items in the feed.
  @override
  final int pinCount;

  /// The date and time when the feed was last updated.
  @override
  final DateTime updatedAt;

  /// The visibility status of the feed.
  @override
  final String? visibility;

  /// A map of custom attributes associated with the feed.
  @override
  final Map<String, Object?>? custom;
}

/// Extension function to convert a [FeedResponse] to a [FeedData] model.
extension FeedResponseMapper on FeedResponse {
  /// Converts this API feed response to a domain [FeedData] instance.
  ///
  /// Returns a [FeedData] instance containing the feed information
  /// from the API response with proper field mapping and type conversions.
  FeedData toModel() {
    return FeedData(
      activityCount: activityCount,
      createdAt: createdAt,
      createdBy: createdBy.toModel(),
      deletedAt: deletedAt,
      description: description,
      fid: FeedId.fromRawValue(feed),
      filterTags: [...?filterTags],
      followerCount: followerCount,
      followingCount: followingCount,
      groupId: groupId,
      id: id,
      location: location?.let(
        (it) => LocationCoordinate(
          latitude: it.lat,
          longitude: it.lng,
        ),
      ),
      memberCount: memberCount,
      name: name,
      ownCapabilities: ownCapabilities?.map((e) => e.toModel()).toList() ?? const [],
      ownMembership: ownMembership?.toModel(),
      ownFollowings: ownFollowings?.map((f) => f.toModel()).toList(),
      ownFollows: ownFollows?.map((f) => f.toModel()).toList(),
      pinCount: pinCount,
      updatedAt: updatedAt,
      visibility: visibility?.toModel(),
      custom: custom,
    );
  }
}

/// Extension functions for [FeedData] to handle common operations.
/// Extension to map [FeedResponseOwnCapabilities] to the canonical [FeedOwnCapability].
extension FeedResponseOwnCapabilitiesMapper on FeedResponseOwnCapabilities {
  /// Converts this response-specific capability enum to the canonical [FeedOwnCapability].
  FeedOwnCapability toModel() => FeedOwnCapability.values.byName(name);
}

/// Extension to map [FeedResponseVisibility] to its wire-value string.
extension FeedResponseVisibilityMapper on FeedResponseVisibility {
  /// Returns the API wire value string for this visibility.
  String toModel() {
    return switch (this) {
      FeedResponseVisibility.followers => 'followers',
      FeedResponseVisibility.members => 'members',
      FeedResponseVisibility.private => 'private',
      FeedResponseVisibility.public => 'public',
      FeedResponseVisibility.visible => 'visible',
      FeedResponseVisibility.unknown => 'unknown',
    };
  }
}

extension FeedDataMutations on FeedData {
  /// Updates this feed with new data while preserving own data.
  ///
  /// Merges [updated] feed data with this instance. [ownMembership], [ownFollowings], and
  /// [ownFollows] are taken from [updated] only when [hasOwnFields] is `true`; otherwise they're
  /// preserved from this instance. This matters because these `own_*` fields are only reliably
  /// populated when the request that produced [updated] set `enrichOwnFields: true` (or came from
  /// a WS event, which never carries them) — an omitted field there means "not fetched", not
  /// "empty", so blindly taking it would wipe out state we already know to be correct.
  ///
  /// [ownCapabilities] is intentionally excluded from this gating: it's kept in sync through a
  /// separate, always-fresh batch lookup (see `FeedCapabilitiesMixin`), independent of
  /// `enrichOwnFields`.
  ///
  /// Returns a new [FeedData] instance with the merged data.
  FeedData updateWith(FeedData updated, {bool hasOwnFields = false}) {
    return updated.copyWith(
      ownCapabilities: ownCapabilities,
      ownMembership: hasOwnFields ? updated.ownMembership : ownMembership,
      ownFollowings: hasOwnFields ? updated.ownFollowings : ownFollowings,
      ownFollows: hasOwnFields ? updated.ownFollows : ownFollows,
    );
  }
}

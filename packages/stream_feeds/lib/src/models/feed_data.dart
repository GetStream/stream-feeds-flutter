import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'feed_id.dart';
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
    required this.memberCount,
    required this.name,
    required this.ownCapabilities,
    required this.pinCount,
    required this.updatedAt,
    this.visibility,
    this.custom,
  });

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

  /// The number of members in the feed.
  @override
  final int memberCount;

  /// The name of the feed.
  @override
  final String name;

  /// The capabilities that the current user has on the feed.
  @override
  final List<FeedOwnCapability> ownCapabilities;

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
      memberCount: memberCount,
      name: name,
      ownCapabilities: ownCapabilities ?? const [],
      pinCount: pinCount,
      updatedAt: updatedAt,
      visibility: visibility,
      custom: custom,
    );
  }
}

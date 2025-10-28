import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'feed_data.dart';
import 'feed_id.dart';

part 'follow_data.freezed.dart';

/// A follow relationship between feeds.
///
/// Contains source feed, target feed, relationship status, and timing
/// information for feed following functionality.
/// custom attributes. It provides computed properties for easy identification
/// of the relationship type and status.
@freezed
class FollowData with _$FollowData {
  /// Creates a new [FollowData] instance.
  const FollowData({
    required this.createdAt,
    required this.followerRole,
    required this.pushPreference,
    this.requestAcceptedAt,
    this.requestRejectedAt,
    required this.sourceFeed,
    required this.status,
    required this.targetFeed,
    required this.updatedAt,
    this.custom,
  });

  /// The date and time when the follow was created.
  @override
  final DateTime createdAt;

  /// The role of the follower in the follow relationship.
  @override
  final String followerRole;

  /// The push notification preference for the follow.
  @override
  final String pushPreference;

  /// The date and time when the follow request was accepted, if applicable.
  @override
  final DateTime? requestAcceptedAt;

  /// The date and time when the follow request was rejected, if applicable.
  @override
  final DateTime? requestRejectedAt;

  /// The source feed that initiated the follow.
  @override
  final FeedData sourceFeed;

  /// The current status of the follow relationship.
  @override
  final FollowStatus status;

  /// The target feed that is being followed.
  @override
  final FeedData targetFeed;

  /// The date and time when the follow relationship was last updated.
  @override
  final DateTime updatedAt;

  /// A map of custom attributes associated with the follow.
  @override
  final Map<String, Object?>? custom;

  /// Unique identifier for the follow relationship, generated from the source and target feed IDs
  /// and the creation timestamp.
  /// Used for simpler identification of follow relationships.
  String get id {
    final sourceFid = sourceFeed.fid;
    final targetFid = targetFeed.fid;
    final createdAt = this.createdAt.millisecondsSinceEpoch;
    return '$sourceFid-$targetFid-$createdAt';
  }

  /// Indicates whether this is an active follower relationship.
  bool get isFollower => status == FollowStatus.accepted;

  /// Indicates whether this is an active following relationship.
  bool get isFollowing => status == FollowStatus.accepted;

  /// Indicates whether this is a pending follow request.
  bool get isFollowRequest => status == FollowStatus.pending;

  /// Checks if this follow relationship represents being a follower of the specified feed.
  ///
  /// - Parameters:
  ///   - fid: The feed ID to check against.
  /// - Returns: true if this is an accepted follow relationship where the target feed matches the given ID.
  bool isFollowerOf(FeedId feed) => isFollower && targetFeed.fid == feed;

  /// Checks if this follow relationship represents following the specified feed.
  ///
  /// - Parameters:
  ///   - fid: The feed ID to check against.
  /// - Returns: true if this is an accepted follow relationship where the source feed matches the given ID.
  bool isFollowingFeed(FeedId fid) => isFollowing && sourceFeed.fid == fid;
}

/// Extension type representing the status of a follow relationship.
///
/// This extension type provides type-safe representation of common follow
/// statuses while automatically handling any custom status values that might be
/// returned from the API.
///
/// By implementing String, it seamlessly supports both known and unknown status values.
extension type const FollowStatus(String value) implements String {
  /// Represents a follow relationship that has been accepted.
  static const accepted = FollowStatus('accepted');

  /// Represents a follow relationship that is pending approval.
  static const pending = FollowStatus('pending');

  /// Represents a follow relationship that has been rejected.
  static const rejected = FollowStatus('rejected');

  /// Represents an unknown follow status.
  static const unknown = FollowStatus('unknown');
}

/// Extension function to convert a [FollowResponse] to a [FollowData] model.
extension FollowResponseMapper on FollowResponse {
  /// Converts this API follow response to a domain [FollowData] instance.
  ///
  /// Returns a [FollowData] instance containing all the follow relationship
  /// information from the API response, with proper type conversions and
  /// status mapping.
  FollowData toModel() {
    return FollowData(
      createdAt: createdAt,
      followerRole: followerRole,
      pushPreference: pushPreference.name,
      requestAcceptedAt: requestAcceptedAt,
      requestRejectedAt: requestRejectedAt,
      sourceFeed: sourceFeed.toModel(),
      status: status.toModel(),
      targetFeed: targetFeed.toModel(),
      updatedAt: updatedAt,
      custom: custom,
    );
  }
}

/// Extension function to convert a [FollowResponseStatus] to a [FollowStatus] model.
extension FollowResponseStatusMapper on FollowResponseStatus {
  /// Converts this API follow status to a domain [FollowStatus] extension type.
  ///
  /// Uses explicit mapping for type safety and proper handling of unknown values.
  FollowStatus toModel() {
    return switch (this) {
      FollowResponseStatus.accepted => FollowStatus.accepted,
      FollowResponseStatus.pending => FollowStatus.pending,
      FollowResponseStatus.rejected => FollowStatus.rejected,
      FollowResponseStatus.unknown => FollowStatus.unknown,
    };
  }
}

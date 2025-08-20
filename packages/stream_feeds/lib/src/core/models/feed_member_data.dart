import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;
import 'user_data.dart';

part 'feed_member_data.freezed.dart';

/// A member of a feed.
///
/// Contains member information including role, status, timing data,
/// and associated user details for feed membership management.
@freezed
class FeedMemberData with _$FeedMemberData {
  /// Creates a new instance of [FeedMemberData].
  /// Creates a new [FeedMemberData] instance.
  const FeedMemberData({
    required this.createdAt,
    this.inviteAcceptedAt,
    this.inviteRejectedAt,
    required this.role,
    required this.status,
    required this.updatedAt,
    required this.user,
    this.custom,
  });

  /// The date and time when the member was created.
  @override
  final DateTime createdAt;

  /// The date and time when the invite was accepted, if applicable.
  @override
  final DateTime? inviteAcceptedAt;

  /// The date and time when the invite was rejected, if applicable.
  @override
  final DateTime? inviteRejectedAt;

  /// The role of the member in the feed.
  @override
  final String role;

  /// The status of the member in the feed.
  @override
  final FeedMemberStatus status;

  /// The date and time when the member was last updated.
  @override
  final DateTime updatedAt;

  /// The user data associated with the member.
  @override
  final UserData user;

  /// A map of custom attributes associated with the member.
  @override
  final Map<String, Object>? custom;

  /// Unique identifier of the feed member, same as the user's ID.
  String get id => user.id;
}

/// Extension type representing the different status of feed members.
///
/// This extension type provides type-safe representation of common feed member
/// statuses while automatically handling any custom status values that might be
/// returned from the API.
///
/// By implementing String, it seamlessly supports both known and unknown status values.
extension type const FeedMemberStatus(String value) implements String {
  /// Represents a feed member.
  static const member = FeedMemberStatus('member');

  /// Represents a feed whose membership is pending approval.
  static const pending = FeedMemberStatus('pending');

  /// Represents a feed member whose invite has been rejected.
  static const rejected = FeedMemberStatus('rejected');

  /// Represents a feed member with an unknown status.
  static const unknown = FeedMemberStatus('unknown');
}

/// Extension function to convert a [api.FeedMemberResponse] to a [FeedMemberData] model.
extension FeedMemberResponseMapper on api.FeedMemberResponse {
  /// Converts this API feed member response to a domain [FeedMemberData] instance.
  ///
  /// Returns a [FeedMemberData] instance containing all the member information
  /// from the API response with proper type conversions and status mapping.
  FeedMemberData toModel() {
    return FeedMemberData(
      createdAt: createdAt,
      inviteAcceptedAt: inviteAcceptedAt,
      inviteRejectedAt: inviteRejectedAt,
      role: role,
      status: status.toModel(),
      updatedAt: updatedAt,
      user: user.toModel(),
      custom: custom,
    );
  }
}

/// Extension function to convert a [api.FeedMemberResponseStatus] to a [FeedMemberStatus] model.
extension FeedMemberResponseStatusMapper on api.FeedMemberResponseStatus {
  /// Converts this API feed member status to a domain [FeedMemberStatus] extension type.
  ///
  /// Uses explicit mapping for type safety and proper handling of unknown values.
  FeedMemberStatus toModel() {
    return switch (this) {
      api.FeedMemberResponseStatus.member => FeedMemberStatus.member,
      api.FeedMemberResponseStatus.pending => FeedMemberStatus.pending,
      api.FeedMemberResponseStatus.rejected => FeedMemberStatus.rejected,
      api.FeedMemberResponseStatus.unknown => FeedMemberStatus.unknown,
    };
  }
}

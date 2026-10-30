import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'user_data.dart';

part 'feed_member_data.freezed.dart';

/// A member of a feed.
///
/// Contains member information including role, status, timing data,
/// and associated user details for feed membership management.
@freezed
class FeedMemberData with _$FeedMemberData {
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
  final Map<String, Object?>? custom;

  /// Unique identifier of the feed member, same as the user's ID.
  String get id => user.id;
}

/// Reads a [FeedMemberStatus] as the `String` it already is.
extension FeedMemberStatusValue on FeedMemberStatus {
  /// The raw value.
  @Deprecated('FeedMemberStatus is a String; use it directly.')
  String get value => this;
}

/// Extension function to convert a [FeedMemberResponse] to a [FeedMemberData] model.
extension FeedMemberResponseMapper on FeedMemberResponse {
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
      status: status,
      updatedAt: updatedAt,
      user: user.toModel(),
      custom: custom,
    );
  }
}

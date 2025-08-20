import 'package:freezed_annotation/freezed_annotation.dart';

import '../../generated/api/models.dart' as api;

part 'feed_member_request_data.freezed.dart';

/// A member request for adding to a feed.
///
/// Contains user ID, role information, and invitation details for
/// feed membership requests.
@freezed
class FeedMemberRequestData with _$FeedMemberRequestData {
  /// Creates a new instance of [FeedMemberRequestData].
  const FeedMemberRequestData({
    required this.userId,
    this.role,
    this.invite,
    this.custom,
  });

  /// The ID of the user to add as a member.
  @override
  final String userId;

  /// The role to assign to the member. This property defines the permissions
  /// and access level for the member within the feed.
  @override
  final String? role;

  /// Whether to send an invitation to the user. If `true`, an invitation will
  /// be sent; if `false` or `null`, the user will be added directly.
  @override
  final bool? invite;

  /// Custom data associated with the member request. This property allows for
  /// storing additional metadata or custom fields specific to the member.
  @override
  final Map<String, Object>? custom;
}

/// Converts a [api.FeedMemberRequest] to a [FeedMemberRequestData] model.
extension FeedMemberRequestMapper on api.FeedMemberRequest {
  FeedMemberRequestData toModel() {
    return FeedMemberRequestData(
      userId: userId,
      role: role,
      invite: invite,
      custom: custom,
    );
  }
}

/// Converts a [FeedMemberRequestData] to a [api.FeedMemberRequest] request model.
extension FeedMemberRequestDataMapper on FeedMemberRequestData {
  api.FeedMemberRequest toRequest() {
    return api.FeedMemberRequest(
      userId: userId,
      role: role,
      invite: invite,
      custom: custom,
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../generated/api/models.dart' as api;

part 'activity_add_comment_request.freezed.dart';

/// A request for adding a comment to an activity.
///
/// Contains comment content, attachments, mentions, and custom metadata
/// needed to create a new comment on an activity.
@freezed
class ActivityAddCommentRequest with _$ActivityAddCommentRequest {
  /// Creates a new instance of [ActivityAddCommentRequest].
  const ActivityAddCommentRequest({
    required this.comment,
    this.attachments,
    this.createNotificationActivity,
    this.mentionedUserIds,
    this.parentId,
    this.custom,
  });

  /// Optional list of attachments to include with the comment.
  @override
  final List<api.Attachment>? attachments;

  /// The content of the comment to be added.
  @override
  final String comment;

  /// Optional flag to create a notification activity.
  @override
  final bool? createNotificationActivity;

  /// Optional list of user IDs to mention in the comment.
  @override
  final List<String>? mentionedUserIds;

  /// Optional ID of the parent comment if this is a reply.
  @override
  final String? parentId;

  /// Optional custom data to include with the comment.
  @override
  final Map<String, Object>? custom;
}

/// Extension function to convert an [ActivityAddCommentRequest] to an API request.
extension ActivityAddCommentRequestMapper on ActivityAddCommentRequest {
  /// Converts this request to the corresponding API request type.
  ///
  /// Returns an [api.AddCommentRequest] containing all the necessary
  /// information to add a comment to an activity.
  api.AddCommentRequest toRequest({
    required String activityId,
    String activityType = 'activity',
  }) {
    return api.AddCommentRequest(
      comment: comment,
      attachments: attachments,
      createNotificationActivity: createNotificationActivity,
      custom: custom,
      mentionedUserIds: mentionedUserIds,
      objectId: activityId,
      objectType: activityType,
      parentId: parentId,
    );
  }
}

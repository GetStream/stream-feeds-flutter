import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_core/stream_core.dart';

import '../../generated/api/models.dart';
import '../../utils/uploader.dart';

part 'activity_add_comment_request.freezed.dart';

/// A request for adding a comment to an activity.
///
/// Contains comment content, attachments, mentions, and custom metadata
/// needed to create a new comment on an activity.
@freezed
class ActivityAddCommentRequest
    with _$ActivityAddCommentRequest
    implements HasAttachments<ActivityAddCommentRequest> {
  /// Creates a new [ActivityAddCommentRequest] instance.
  const ActivityAddCommentRequest({
    required this.activityId,
    required this.comment,
    this.activityType = 'activity',
    this.attachments,
    this.attachmentUploads,
    this.createNotificationActivity,
    this.mentionedUserIds,
    this.parentId,
    this.custom,
  });

  /// The unique identifier of the activity to comment on.
  @override
  final String activityId;

  /// The type of the activity being commented on.
  @override
  final String activityType;

  /// Optional list of attachments to include with the comment.
  @override
  final List<Attachment>? attachments;

  /// Optional list of stream attachments to be uploaded before adding the
  /// comment to the activity.
  @override
  final List<StreamAttachment>? attachmentUploads;

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
  final Map<String, Object?>? custom;

  /// Creates a copy of this request with updated attachments and uploads.
  @override
  ActivityAddCommentRequest withAttachments({
    List<Attachment>? attachments,
    List<StreamAttachment>? attachmentUploads,
  }) {
    return copyWith(
      attachments: attachments,
      attachmentUploads: attachmentUploads,
    );
  }
}

/// Extension function to convert an [ActivityAddCommentRequest] to an API request.
extension ActivityAddCommentRequestMapper on ActivityAddCommentRequest {
  /// Converts this request to the corresponding API request type.
  ///
  /// Returns an [AddCommentRequest] containing all the necessary
  /// information to add a comment to an activity.
  AddCommentRequest toRequest() {
    return AddCommentRequest(
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

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../stream_feeds.dart' as api;

part 'activity_update_comment_request.freezed.dart';

/// A request for updating a comment to an activity.
@freezed
class ActivityUpdateCommentRequest with _$ActivityUpdateCommentRequest {
  const ActivityUpdateCommentRequest({
    this.comment,
    this.custom,
    this.skipPush,
  });

  @override
  final String? comment;

  @override
  final Map<String, Object?>? custom;

  @override
  final bool? skipPush;
}


extension ActivityUpdateCommentRequestMapper on ActivityUpdateCommentRequest {
  api.UpdateCommentRequest toRequest() => api.UpdateCommentRequest(
        comment: comment,
        custom: custom,
        skipPush: skipPush,
      );
}
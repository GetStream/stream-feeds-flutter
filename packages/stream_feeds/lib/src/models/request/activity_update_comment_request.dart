import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../stream_feeds.dart' as api;

part 'activity_update_comment_request.freezed.dart';

/// A request for updating a comment to an activity.
@freezed
class ActivityUpdateCommentRequest with _$ActivityUpdateCommentRequest {
  const ActivityUpdateCommentRequest({
    this.comment,
    this.custom,
    this.skipEnrichUrl,
    this.skipPush,
  });

  @override
  final String? comment;

  @override
  final Map<String, Object?>? custom;

  /// Whether to skip URL enrichment for this comment.
  ///
  /// When `true`, the backend will not scrape links found in [comment] to
  /// build an Open Graph preview attachment.
  @override
  final bool? skipEnrichUrl;

  @override
  final bool? skipPush;
}

extension ActivityUpdateCommentRequestMapper on ActivityUpdateCommentRequest {
  api.UpdateCommentRequest toRequest() => api.UpdateCommentRequest(
    comment: comment,
    custom: custom,
    skipEnrichUrl: skipEnrichUrl,
    skipPush: skipPush,
  );
}

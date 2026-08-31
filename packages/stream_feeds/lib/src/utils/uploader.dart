import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart' as api;

/// Interface for requests that support attachment uploads.
abstract interface class HasAttachments<T> {
  /// The current attachments in the request.
  List<api.Attachment>? get attachments;

  /// The attachments to be uploaded.
  List<StreamAttachment>? get attachmentUploads;

  /// Creates a copy of this request with updated attachments and uploads.
  T withAttachments({
    List<api.Attachment>? attachments,
    List<StreamAttachment>? attachmentUploads,
  });
}

extension HasAttachmentsExtension on StreamAttachmentUploader {
  /// Processes a request with attachment uploads by uploading files and merging with existing attachments.
  ///
  /// Uploads all [StreamAttachment] items from the request and merges them with existing
  /// attachments. Returns an updated request with all attachments ready for API submission.
  ///
  /// Returns a [Result] containing the updated request or an error.
  Future<Result<T>> processRequest<T extends HasAttachments<T>>(
    T request, {
    int maxConcurrent = 5,
    bool eagerError = true,
  }) async {
    final processed = await processRequestsBatch(
      [request],
      maxConcurrent: maxConcurrent,
      eagerError: eagerError,
    );

    return processed.map((requests) => requests.single);
  }

  /// Processes multiple requests with attachment uploads in parallel.
  ///
  /// Uploads every request's attachments as one batch, so [maxConcurrent]
  /// bounds the uploads across all of them rather than within each one, and
  /// merges each request's own attachments back into it.
  ///
  /// When [eagerError] is true the first upload to fail becomes the result's
  /// and the rest are called off; when false every attachment is attempted and
  /// the ones that did not make it stay queued on their own request.
  ///
  /// Throws an [ArgumentError] if two requests share an attachment id, which
  /// one batch could not tell apart.
  Future<Result<List<T>>> processRequestsBatch<T extends HasAttachments<T>>(
    List<T> requests, {
    int maxConcurrent = 5,
    bool eagerError = true,
  }) async {
    final attachmentsToUpload = [
      for (final request in requests) ...?request.attachmentUploads,
    ];

    if (attachmentsToUpload.isEmpty) return Result.success(requests);

    final batch = uploadBatch(
      attachmentsToUpload,
      maxConcurrent: maxConcurrent,
      eagerError: eagerError,
    );

    return switch (await batch.result) {
      BatchUploadCompleted(:final items) => Result.success(_distribute(requests, items)),
      BatchUploadStoppedOnError(:final error) => Result.failure(error, error.stackTrace),
      BatchUploadCancelled() => const Result.failure(
        StreamNetworkException(message: 'The attachment uploads were cancelled', isCancelled: true),
      ),
    };
  }
}

// Each request with its share of the batch folded in.
//
// The map is built once and looked up per request, so this stays linear in the
// number of attachments however many requests share the batch.
List<T> _distribute<T extends HasAttachments<T>>(
  List<T> requests,
  List<BatchUploadItemResult> items,
) {
  final succeeded = items.map((it) => it.result.getOrNull()).nonNulls;
  final uploaded = {for (final it in succeeded) it.id: _toApiAttachment(it)};

  return [for (final request in requests) _withUploaded(request, uploaded)];
}

// An uploaded attachment as the api model a request carries.
//
// Both urls get the same one whatever the attachment is, and `type` is what
// tells them apart. The Swift SDK maps it the same way; Android instead fills
// `imageUrl` for images only.
api.Attachment _toApiAttachment(
  UploadedAttachment attachment,
) => api.Attachment(
  type: attachment.type,
  custom: {...?attachment.custom},
  assetUrl: attachment.remoteUrl,
  imageUrl: attachment.remoteUrl,
  thumbUrl: attachment.thumbnailUrl,
);

// One request's share of [uploaded] merged in beside the attachments it already
// had and taken off its upload queue. Whatever did not make it stays queued for
// a later attempt.
T _withUploaded<T extends HasAttachments<T>>(
  T request,
  Map<String, api.Attachment> uploaded,
) {
  final queued = request.attachmentUploads;
  if (queued == null || queued.isEmpty) return request;

  final merged = queued.map((it) => uploaded[it.id]).nonNulls;
  final stillQueued = queued.where((it) => !uploaded.containsKey(it.id));

  // Merge uploaded attachments with existing ones, avoiding duplicates
  final current = request.attachments ?? [];
  final updated = current.merge(
    merged,
    key: (it) => (it.type, it.assetUrl, it.imageUrl),
  );

  return request.withAttachments(
    attachments: updated.takeIf((it) => it.isNotEmpty),
    attachmentUploads: stillQueued.toList(),
  );
}

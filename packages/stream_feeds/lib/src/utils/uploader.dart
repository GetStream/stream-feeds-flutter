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
    OnBatchUploadProgress? onProgress,
    int maxConcurrent = 5,
    bool eagerError = true,
  }) async {
    final attachmentsToUpload = request.attachmentUploads;
    // If there are no attachments to upload, return the original request.
    if (attachmentsToUpload == null || attachmentsToUpload.isEmpty) {
      return Result.success(request);
    }

    final uploadResult = await _uploadAll(
      attachmentsToUpload,
      onProgress: onProgress,
      maxConcurrent: maxConcurrent,
      eagerError: eagerError,
    );

    return uploadResult.map((attachments) {
      final uploadedAttachments = <String, api.Attachment>{
        for (final uploaded in attachments)
          uploaded.id: api.Attachment(
            type: uploaded.type,
            custom: {...?uploaded.custom},
            assetUrl: uploaded.remoteUrl,
            imageUrl: uploaded.remoteUrl,
            thumbUrl: uploaded.thumbnailUrl,
          ),
      };

      // Merge uploaded attachments with existing ones, avoiding duplicates
      final current = request.attachments ?? [];
      final updatedAttachments = current.merge(
        uploadedAttachments.values,
        key: (it) => (it.type, it.assetUrl, it.imageUrl),
      );

      // Remove processed uploads from the upload queue using ID-based filtering
      final uploadedIds = uploadedAttachments.keys.toSet();
      final updatedAttachmentUploads = attachmentsToUpload.where(
        (upload) => !uploadedIds.contains(upload.id),
      );

      return request.withAttachments(
        attachments: updatedAttachments.takeIf((it) => it.isNotEmpty),
        attachmentUploads: updatedAttachmentUploads.toList(),
      );
    });
  }

  /// Processes multiple requests with attachment uploads in parallel.
  ///
  /// Processes each request individually using [processRequest] and returns
  /// a list of updated requests with all attachments ready for API submission.
  ///
  /// Returns a [Result] containing the list of updated requests or an error.
  Future<Result<List<T>>> processRequestsBatch<T extends HasAttachments<T>>(
    List<T> requests, {
    OnBatchUploadProgress? onProgress,
    int maxConcurrent = 5,
    bool eagerError = true,
  }) {
    return runSafely(() async {
      final batch = requests.map(
        (request) => processRequest(
          request,
          onProgress: onProgress,
          maxConcurrent: maxConcurrent,
          eagerError: eagerError,
        ),
      );

      final processed = await batch.wait;

      final successfulRequests = <T?>[];
      for (final result in processed) {
        // If eagerError is enabled, throw on first failure
        if (result.exceptionOrNull() case final error? when eagerError) {
          final stackTrace = result.stackTraceOrNull();
          Error.throwWithStackTrace(error, stackTrace ?? StackTrace.current);
        }

        successfulRequests.add(result.getOrNull());
      }

      return successfulRequests.nonNulls.toList();
    });
  }

  // Uploads multiple attachments in parallel with progress tracking.
  //
  // Processes [attachments] in batches with configurable concurrency and progress
  // reporting. Returns a [Result] containing the list of uploaded attachments.
  //
  // Returns a [Result] containing a list of [UploadedAttachment] or an error.
  Future<Result<List<UploadedAttachment>>> _uploadAll(
    Iterable<StreamAttachment> attachments, {
    OnBatchUploadProgress? onProgress,
    int maxConcurrent = 5,
    bool eagerError = true,
  }) {
    return runSafely(() async {
      final batch = uploadBatch(
        attachments,
        onProgress: onProgress,
        maxConcurrent: maxConcurrent,
        eagerError: eagerError,
      );

      final batchResult = await batch.toList();
      final uploadedAttachments = batchResult.map((it) => it.getOrNull());

      return uploadedAttachments.nonNulls.toList();
    });
  }
}

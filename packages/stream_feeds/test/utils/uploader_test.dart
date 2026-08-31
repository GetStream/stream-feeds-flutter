import 'dart:async';

import 'package:stream_core/stream_core.dart';
import 'package:stream_feeds/src/generated/api/models.dart' as api;
import 'package:stream_feeds/src/utils/uploader.dart';
import 'package:stream_feeds_test/stream_feeds_test.dart';

class _TestRequest implements HasAttachments<_TestRequest> {
  const _TestRequest({this.attachments, this.attachmentUploads});

  @override
  final List<api.Attachment>? attachments;

  @override
  final List<StreamAttachment>? attachmentUploads;

  @override
  _TestRequest withAttachments({
    List<api.Attachment>? attachments,
    List<StreamAttachment>? attachmentUploads,
  }) => _TestRequest(attachments: attachments, attachmentUploads: attachmentUploads);
}

/// A CDN whose outcome per file is scripted by [outcomes].
class _FakeCdn implements CdnClient {
  _FakeCdn(this.outcomes);

  final Map<AttachmentFile, Result<UploadedFile>> outcomes;

  Future<Result<UploadedFile>> _upload(AttachmentFile file) async => outcomes[file]!;

  @override
  Future<Result<UploadedFile>> uploadFile(
    AttachmentFile file, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) => _upload(file);

  @override
  Future<Result<UploadedFile>> uploadImage(
    AttachmentFile image, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) => _upload(image);

  @override
  Future<Result<void>> deleteFile(String url, {CancelToken? cancelToken}) async => const Result.success(null);

  @override
  Future<Result<void>> deleteImage(String url, {CancelToken? cancelToken}) async => const Result.success(null);
}

/// A CDN that parks every upload until the test answers it, so how many are on
/// the wire at once is observable.
class _GatedCdn implements CdnClient {
  final _pending = <AttachmentFile, Completer<Result<UploadedFile>>>{};

  /// How many uploads are on the wire right now.
  int get inFlight => _pending.values.where((it) => !it.isCompleted).length;

  /// Answers the upload of [file] with [outcome].
  void answer(AttachmentFile file, Result<UploadedFile> outcome) => _pending[file]!.complete(outcome);

  Future<Result<UploadedFile>> _upload(AttachmentFile file) =>
      (_pending[file] ??= Completer<Result<UploadedFile>>()).future;

  @override
  Future<Result<UploadedFile>> uploadFile(
    AttachmentFile file, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) => _upload(file);

  @override
  Future<Result<UploadedFile>> uploadImage(
    AttachmentFile image, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) => _upload(image);

  @override
  Future<Result<void>> deleteFile(String url, {CancelToken? cancelToken}) async => const Result.success(null);

  @override
  Future<Result<void>> deleteImage(String url, {CancelToken? cancelToken}) async => const Result.success(null);
}

StreamAttachment _attachment(String id, AttachmentFile file) => StreamAttachment(
  id: id,
  type: AttachmentType.file,
  file: file,
);

const _refused = StreamApiException(message: 'too large', statusCode: 413, code: StreamErrorCode.payloadTooBig);

void main() {
  final fileA = AttachmentFile.fromData(Uint8List(0));
  final fileB = AttachmentFile.fromData(Uint8List(0));

  const uploadedA = UploadedFile(fileUrl: 'https://cdn/a', thumbUrl: 'https://cdn/a-thumb');
  const uploadedB = UploadedFile(fileUrl: 'https://cdn/b');

  group('processRequest', () {
    test('returns the request untouched when there is nothing to upload', () async {
      final uploader = StreamAttachmentUploader(cdn: _FakeCdn({}));
      const request = _TestRequest(attachmentUploads: []);

      final result = await uploader.processRequest(request);

      expect(result.getOrNull(), same(request));
    });

    test('merges every uploaded attachment and empties the upload queue', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.success(uploadedB)}),
      );
      final request = _TestRequest(
        attachmentUploads: [_attachment('a', fileA), _attachment('b', fileB)],
      );

      final processed = await uploader.processRequest(request);

      final updated = processed.getOrNull()!;
      expect(
        updated.attachments?.map((it) => it.assetUrl),
        unorderedEquals(['https://cdn/a', 'https://cdn/b']),
      );
      expect(
        updated.attachments?.map((it) => it.thumbUrl),
        unorderedEquals(['https://cdn/a-thumb', null]),
      );
      expect(updated.attachmentUploads, isEmpty);
    });

    test('keeps existing attachments and does not duplicate an already merged upload', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA)}),
      );
      const existing = api.Attachment(custom: {}, assetUrl: 'https://cdn/existing');
      const alreadyMerged = api.Attachment(
        custom: {},
        type: 'file',
        assetUrl: 'https://cdn/a',
        imageUrl: 'https://cdn/a',
      );
      final request = _TestRequest(
        attachments: const [existing, alreadyMerged],
        attachmentUploads: [_attachment('a', fileA)],
      );

      final processed = await uploader.processRequest(request);

      expect(
        processed.getOrNull()!.attachments?.map((it) => it.assetUrl),
        unorderedEquals(['https://cdn/existing', 'https://cdn/a']),
      );
    });

    test("fails as one when an upload fails, carrying the upload's own error", () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.failure(_refused)}),
      );
      final request = _TestRequest(
        attachmentUploads: [_attachment('a', fileA), _attachment('b', fileB)],
      );

      final processed = await uploader.processRequest(request);

      expect(processed.exceptionOrNull(), same(_refused));
    });

    test('without eagerError, keeps the failed upload queued for a later attempt', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.failure(_refused)}),
      );
      final request = _TestRequest(
        attachmentUploads: [_attachment('a', fileA), _attachment('b', fileB)],
      );

      final processed = await uploader.processRequest(request, eagerError: false);

      final updated = processed.getOrNull()!;
      expect(updated.attachments?.map((it) => it.assetUrl), ['https://cdn/a']);
      expect(updated.attachmentUploads?.map((it) => it.id), ['b']);
    });
  });

  group('processRequestsBatch', () {
    test('gives each request only its own uploaded attachments', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.success(uploadedB)}),
      );
      final first = _TestRequest(attachmentUploads: [_attachment('a', fileA)]);
      final second = _TestRequest(attachmentUploads: [_attachment('b', fileB)]);

      final processed = await uploader.processRequestsBatch([first, second]);
      final requests = processed.getOrNull()!;

      expect(requests.first.attachments?.map((it) => it.assetUrl), ['https://cdn/a']);
      expect(requests.last.attachments?.map((it) => it.assetUrl), ['https://cdn/b']);
      expect(requests.every((it) => it.attachmentUploads!.isEmpty), isTrue);
    });

    test('leaves a request whose upload failed queued without touching the others', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.failure(_refused)}),
      );
      final ok = _TestRequest(attachmentUploads: [_attachment('a', fileA)]);
      final failed = _TestRequest(attachmentUploads: [_attachment('b', fileB)]);

      final processed = await uploader.processRequestsBatch([ok, failed], eagerError: false);
      final requests = processed.getOrNull()!;

      expect(requests.first.attachments?.map((it) => it.assetUrl), ['https://cdn/a']);
      expect(requests.first.attachmentUploads, isEmpty);
      expect(requests.last.attachments, isNull);
      expect(requests.last.attachmentUploads?.map((it) => it.id), ['b']);
    });

    test('returns the requests in the order they were given', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.success(uploadedB)}),
      );
      final withB = _TestRequest(attachmentUploads: [_attachment('b', fileB)]);
      final withA = _TestRequest(attachmentUploads: [_attachment('a', fileA)]);

      final processed = await uploader.processRequestsBatch([withB, withA]);
      final requests = processed.getOrNull()!;

      expect(requests.first.attachments?.map((it) => it.assetUrl), ['https://cdn/b']);
      expect(requests.last.attachments?.map((it) => it.assetUrl), ['https://cdn/a']);
    });

    test('leaves a request with nothing to upload exactly as it was', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA)}),
      );
      const nothingToUpload = _TestRequest();
      final withUpload = _TestRequest(attachmentUploads: [_attachment('a', fileA)]);

      final processed = await uploader.processRequestsBatch([nothingToUpload, withUpload]);
      final requests = processed.getOrNull()!;

      expect(requests.first, same(nothingToUpload), reason: 'nothing about it changed');
      expect(requests.last.attachments?.map((it) => it.assetUrl), ['https://cdn/a']);
    });

    test('bounds the uploads across every request, not within each one', () async {
      final cdn = _GatedCdn();
      final uploader = StreamAttachmentUploader(cdn: cdn);
      final files = [for (var i = 0; i < 4; i++) AttachmentFile.fromData(Uint8List(0))];
      final requests = <_TestRequest>[];
      for (var i = 0; i < files.length; i++) {
        requests.add(_TestRequest(attachmentUploads: [_attachment('a$i', files[i])]));
      }

      final pending = uploader.processRequestsBatch(requests, maxConcurrent: 2);
      await pumpEventQueue();

      expect(cdn.inFlight, 2, reason: 'four requests of one attachment each, two uploads at a time');

      cdn.answer(files[0], const Result.success(uploadedA));
      await pumpEventQueue();

      expect(cdn.inFlight, 2, reason: 'a freed slot takes exactly one more');

      for (final file in files.skip(1)) {
        cdn.answer(file, const Result.success(uploadedA));
        await pumpEventQueue();
      }

      expect((await pending).getOrNull(), hasLength(4));
    });

    test('refuses two requests that share an attachment id', () async {
      final uploader = StreamAttachmentUploader(cdn: _FakeCdn({}));
      final shared = _attachment('same', fileA);

      await expectLater(
        uploader.processRequestsBatch([
          _TestRequest(attachmentUploads: [shared]),
          _TestRequest(attachmentUploads: [shared]),
        ]),
        throwsArgumentError,
        reason: 'one batch could not tell them apart',
      );
    });

    test('succeeds with nothing when there are no requests', () async {
      final uploader = StreamAttachmentUploader(cdn: _FakeCdn({}));

      final processed = await uploader.processRequestsBatch<_TestRequest>([]);

      expect(processed.getOrNull(), isEmpty);
    });

    test('processes every request when all uploads succeed', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.success(uploadedB)}),
      );
      final requests = [
        _TestRequest(attachmentUploads: [_attachment('a', fileA)]),
        _TestRequest(attachmentUploads: [_attachment('b', fileB)]),
      ];

      final processed = await uploader.processRequestsBatch(requests);

      expect(processed.getOrNull(), hasLength(2));
    });

    test('fails as one when any request fails', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.failure(_refused)}),
      );
      final requests = [
        _TestRequest(attachmentUploads: [_attachment('a', fileA)]),
        _TestRequest(attachmentUploads: [_attachment('b', fileB)]),
      ];

      final processed = await uploader.processRequestsBatch(requests);

      expect(processed.exceptionOrNull(), same(_refused));
    });

    test('without eagerError, keeps every request, the failed upload staying queued in its own', () async {
      final uploader = StreamAttachmentUploader(
        cdn: _FakeCdn({fileA: const Result.success(uploadedA), fileB: const Result.failure(_refused)}),
      );
      final requests = [
        _TestRequest(attachmentUploads: [_attachment('a', fileA)]),
        _TestRequest(attachmentUploads: [_attachment('b', fileB)]),
      ];

      final processed = await uploader.processRequestsBatch(requests, eagerError: false);

      final kept = processed.getOrNull()!;
      expect(kept, hasLength(2));
      expect(kept.first.attachmentUploads, isEmpty);
      expect(kept.last.attachmentUploads?.map((it) => it.id), ['b']);
    });
  });
}

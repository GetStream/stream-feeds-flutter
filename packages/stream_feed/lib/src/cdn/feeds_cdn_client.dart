import 'package:stream_core/stream_core.dart';

import 'cdn_api.dart';

class FeedsCdnClient implements CdnClient {
  const FeedsCdnClient(this._api);

  final CdnApi _api;

  @override
  Future<Result<UploadedFile>> uploadFile(
    AttachmentFile file, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) async {
    final multipartFile = await file.toMultipartFile();

    final result = await _api.uploadFile(
      file: [multipartFile],
      onUploadProgress: onProgress,
      cancelToken: cancelToken,
    );

    return result.map(
      (response) => UploadedFile(
        fileUrl: response.file,
        thumbUrl: response.thumbUrl,
      ),
    );
  }

  @override
  Future<Result<UploadedFile>> uploadImage(
    AttachmentFile image, {
    ProgressCallback? onProgress,
    CancelToken? cancelToken,
  }) async {
    final multipartFile = await image.toMultipartFile();

    final result = await _api.uploadImage(
      file: [multipartFile],
      onUploadProgress: onProgress,
      cancelToken: cancelToken,
    );

    return result.map(
      (response) => UploadedFile(
        fileUrl: response.file,
        thumbUrl: response.thumbUrl,
      ),
    );
  }

  @override
  Future<Result<void>> deleteFile(
    String url, {
    CancelToken? cancelToken,
  }) async {
    final result = await _api.deleteFile(
      url: url,
      cancelToken: cancelToken,
    );

    return result;
  }

  @override
  Future<Result<void>> deleteImage(
    String url, {
    CancelToken? cancelToken,
  }) async {
    final result = await _api.deleteImage(
      url: url,
      cancelToken: cancelToken,
    );

    return result;
  }
}

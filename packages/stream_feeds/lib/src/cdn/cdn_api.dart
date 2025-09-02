import 'package:retrofit/retrofit.dart';
import 'package:stream_core/stream_core.dart';

import '../generated/api/models.dart';

part 'cdn_api.g.dart';

@RestApi(callAdapter: _ResultCallAdapter)
abstract interface class CdnApi {
  factory CdnApi(
    Dio dio, {
    String? baseUrl,
  }) = _CdnApi;

  @MultiPart()
  @POST('/api/v2/uploads/file')
  Future<Result<FileUploadResponse>> uploadFile({
    // TODO: change to single file upload once upgrade to retrofit ^4.7.0
    @Part(name: 'file') required List<MultipartFile> file,
    @SendProgress() ProgressCallback? onUploadProgress,
    @CancelRequest() CancelToken? cancelToken,
  });

  @MultiPart()
  @POST('/api/v2/uploads/image')
  Future<Result<ImageUploadResponse>> uploadImage({
    // TODO: change to single file upload once upgrade to retrofit ^4.7.0
    @Part(name: 'file') required List<MultipartFile> file,
    @SendProgress() ProgressCallback? onUploadProgress,
    @CancelRequest() CancelToken? cancelToken,
  });

  @DELETE('/api/v2/uploads/file')
  Future<Result<DurationResponse>> deleteFile({
    @Query('url') String? url,
    @CancelRequest() CancelToken? cancelToken,
  });

  @DELETE('/api/v2/uploads/image')
  Future<Result<DurationResponse>> deleteImage({
    @Query('url') String? url,
    @CancelRequest() CancelToken? cancelToken,
  });
}

class _ResultCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) => runSafely(call);
}

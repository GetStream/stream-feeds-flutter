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
  Future<Result<FileUploadResponse>> sendFile({
    // TODO: change to single file upload once upgrade to retrofit ^4.7.0
    @Part(name: 'file') required List<MultipartFile> file,
    @SendProgress() ProgressCallback? onSendProgress,
  });

  @MultiPart()
  @POST('/api/v2/uploads/image')
  Future<Result<FileUploadResponse>> sendImage({
    // TODO: change to single file upload once upgrade to retrofit ^4.7.0
    @Part(name: 'file') required List<MultipartFile> file,
    @SendProgress() ProgressCallback? onSendProgress,
  });
}

class _ResultCallAdapter<T> extends CallAdapter<Future<T>, Future<Result<T>>> {
  @override
  Future<Result<T>> adapt(Future<T> Function() call) => runSafely(call);
}

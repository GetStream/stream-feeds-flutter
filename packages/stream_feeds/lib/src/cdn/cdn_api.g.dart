// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cdn_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _CdnApi implements CdnApi {
  _CdnApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<FileUploadResponse> _uploadFile({
    required List<MultipartFile> file,
    void Function(int, int)? onUploadProgress,
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(file.map((i) => MapEntry('file', i)));
    final _options = _setStreamType<Result<FileUploadResponse>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/api/v2/uploads/file',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
            onSendProgress: onUploadProgress,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late FileUploadResponse _value;
    try {
      _value = FileUploadResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<FileUploadResponse>> uploadFile({
    required List<MultipartFile> file,
    void Function(int, int)? onUploadProgress,
    CancelToken? cancelToken,
  }) {
    return _ResultCallAdapter<FileUploadResponse>().adapt(
      () => _uploadFile(
        file: file,
        onUploadProgress: onUploadProgress,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<ImageUploadResponse> _uploadImage({
    required List<MultipartFile> file,
    void Function(int, int)? onUploadProgress,
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.addAll(file.map((i) => MapEntry('file', i)));
    final _options = _setStreamType<Result<ImageUploadResponse>>(
      Options(
        method: 'POST',
        headers: _headers,
        extra: _extra,
        contentType: 'multipart/form-data',
      )
          .compose(
            _dio.options,
            '/api/v2/uploads/image',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
            onSendProgress: onUploadProgress,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ImageUploadResponse _value;
    try {
      _value = ImageUploadResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<ImageUploadResponse>> uploadImage({
    required List<MultipartFile> file,
    void Function(int, int)? onUploadProgress,
    CancelToken? cancelToken,
  }) {
    return _ResultCallAdapter<ImageUploadResponse>().adapt(
      () => _uploadImage(
        file: file,
        onUploadProgress: onUploadProgress,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<DurationResponse> _deleteFile({
    String? url,
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/file',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteFile({
    String? url,
    CancelToken? cancelToken,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteFile(url: url, cancelToken: cancelToken),
    );
  }

  Future<DurationResponse> _deleteImage({
    String? url,
    CancelToken? cancelToken,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<DurationResponse>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v2/uploads/image',
            queryParameters: queryParameters,
            data: _data,
            cancelToken: cancelToken,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DurationResponse _value;
    try {
      _value = DurationResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<Result<DurationResponse>> deleteImage({
    String? url,
    CancelToken? cancelToken,
  }) {
    return _ResultCallAdapter<DurationResponse>().adapt(
      () => _deleteImage(url: url, cancelToken: cancelToken),
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

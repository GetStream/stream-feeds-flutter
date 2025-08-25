import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';

part 'file_upload_config_data.freezed.dart';

/// File upload configuration settings.
///
/// Contains allowed and blocked file types, size limits, and upload
/// policies for the Stream Feeds system.
@freezed
class FileUploadConfigData with _$FileUploadConfigData {
  /// Creates a new [FileUploadConfigData] instance.
  const FileUploadConfigData({
    required this.allowedFileExtensions,
    required this.allowedMimeTypes,
    required this.blockedFileExtensions,
    required this.blockedMimeTypes,
    required this.sizeLimit,
  });

  /// List of allowed file extensions.
  @override
  final List<String> allowedFileExtensions;

  /// List of allowed MIME types.
  @override
  final List<String> allowedMimeTypes;

  /// List of blocked file extensions.
  @override
  final List<String> blockedFileExtensions;

  /// List of blocked MIME types.
  @override
  final List<String> blockedMimeTypes;

  /// Maximum allowed file size in bytes.
  @override
  final int sizeLimit;
}

/// Extension to convert API file upload config to domain model.
extension FileUploadConfigMapper on FileUploadConfig {
  /// Converts [FileUploadConfig] to [FileUploadConfigData].
  FileUploadConfigData toModel() {
    return FileUploadConfigData(
      allowedFileExtensions: allowedFileExtensions,
      allowedMimeTypes: allowedMimeTypes,
      sizeLimit: sizeLimit,
      blockedFileExtensions: blockedFileExtensions,
      blockedMimeTypes: blockedMimeTypes,
    );
  }
}

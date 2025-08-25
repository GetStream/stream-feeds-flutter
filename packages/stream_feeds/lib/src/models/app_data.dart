import 'package:freezed_annotation/freezed_annotation.dart';

import '../generated/api/models.dart';
import 'file_upload_config_data.dart';

part 'app_data.freezed.dart';

/// Application configuration data.
///
/// Contains settings and configuration options for the Stream Feeds application
/// including URL enrichment, translation, and file upload configurations.
@freezed
class AppData with _$AppData {
  /// Creates a new [AppData] instance.
  const AppData({
    required this.asyncUrlEnrichEnabled,
    required this.autoTranslationEnabled,
    required this.fileUploadConfig,
    required this.imageUploadConfig,
    required this.name,
  });

  /// Whether async URL enrichment is enabled.
  @override
  final bool asyncUrlEnrichEnabled;

  /// Whether auto translation is enabled.
  @override
  final bool autoTranslationEnabled;

  /// Configuration for file uploads.
  @override
  final FileUploadConfigData fileUploadConfig;

  /// Configuration for image uploads.
  @override
  final FileUploadConfigData imageUploadConfig;

  /// Name of the application.
  @override
  final String name;
}

/// Extension to convert API response to domain model.
extension AppResponseFieldsMapper on AppResponseFields {
  /// Converts [AppResponseFields] to [AppData].
  AppData toModel() {
    return AppData(
      asyncUrlEnrichEnabled: asyncUrlEnrichEnabled,
      autoTranslationEnabled: autoTranslationEnabled,
      fileUploadConfig: fileUploadConfig.toModel(),
      imageUploadConfig: imageUploadConfig.toModel(),
      name: name,
    );
  }
}

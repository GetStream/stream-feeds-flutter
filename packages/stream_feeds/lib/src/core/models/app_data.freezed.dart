// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppData {
  bool get asyncUrlEnrichEnabled;
  bool get autoTranslationEnabled;
  FileUploadConfigData get fileUploadConfig;
  FileUploadConfigData get imageUploadConfig;
  String get name;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppDataCopyWith<AppData> get copyWith =>
      _$AppDataCopyWithImpl<AppData>(this as AppData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppData &&
            (identical(other.asyncUrlEnrichEnabled, asyncUrlEnrichEnabled) ||
                other.asyncUrlEnrichEnabled == asyncUrlEnrichEnabled) &&
            (identical(other.autoTranslationEnabled, autoTranslationEnabled) ||
                other.autoTranslationEnabled == autoTranslationEnabled) &&
            (identical(other.fileUploadConfig, fileUploadConfig) ||
                other.fileUploadConfig == fileUploadConfig) &&
            (identical(other.imageUploadConfig, imageUploadConfig) ||
                other.imageUploadConfig == imageUploadConfig) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, asyncUrlEnrichEnabled,
      autoTranslationEnabled, fileUploadConfig, imageUploadConfig, name);

  @override
  String toString() {
    return 'AppData(asyncUrlEnrichEnabled: $asyncUrlEnrichEnabled, autoTranslationEnabled: $autoTranslationEnabled, fileUploadConfig: $fileUploadConfig, imageUploadConfig: $imageUploadConfig, name: $name)';
  }
}

/// @nodoc
abstract mixin class $AppDataCopyWith<$Res> {
  factory $AppDataCopyWith(AppData value, $Res Function(AppData) _then) =
      _$AppDataCopyWithImpl;
  @useResult
  $Res call(
      {bool asyncUrlEnrichEnabled,
      bool autoTranslationEnabled,
      FileUploadConfigData fileUploadConfig,
      FileUploadConfigData imageUploadConfig,
      String name});
}

/// @nodoc
class _$AppDataCopyWithImpl<$Res> implements $AppDataCopyWith<$Res> {
  _$AppDataCopyWithImpl(this._self, this._then);

  final AppData _self;
  final $Res Function(AppData) _then;

  /// Create a copy of AppData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncUrlEnrichEnabled = null,
    Object? autoTranslationEnabled = null,
    Object? fileUploadConfig = null,
    Object? imageUploadConfig = null,
    Object? name = null,
  }) {
    return _then(AppData(
      asyncUrlEnrichEnabled: null == asyncUrlEnrichEnabled
          ? _self.asyncUrlEnrichEnabled
          : asyncUrlEnrichEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoTranslationEnabled: null == autoTranslationEnabled
          ? _self.autoTranslationEnabled
          : autoTranslationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUploadConfig: null == fileUploadConfig
          ? _self.fileUploadConfig
          : fileUploadConfig // ignore: cast_nullable_to_non_nullable
              as FileUploadConfigData,
      imageUploadConfig: null == imageUploadConfig
          ? _self.imageUploadConfig
          : imageUploadConfig // ignore: cast_nullable_to_non_nullable
              as FileUploadConfigData,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

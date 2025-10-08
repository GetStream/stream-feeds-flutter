// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_response_fields.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppResponseFields {
  bool get asyncUrlEnrichEnabled;
  bool get autoTranslationEnabled;
  FileUploadConfig get fileUploadConfig;
  FileUploadConfig get imageUploadConfig;
  String get name;
  String get region;
  String get shard;

  /// Create a copy of AppResponseFields
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppResponseFieldsCopyWith<AppResponseFields> get copyWith =>
      _$AppResponseFieldsCopyWithImpl<AppResponseFields>(
          this as AppResponseFields, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppResponseFields &&
            (identical(other.asyncUrlEnrichEnabled, asyncUrlEnrichEnabled) ||
                other.asyncUrlEnrichEnabled == asyncUrlEnrichEnabled) &&
            (identical(other.autoTranslationEnabled, autoTranslationEnabled) ||
                other.autoTranslationEnabled == autoTranslationEnabled) &&
            (identical(other.fileUploadConfig, fileUploadConfig) ||
                other.fileUploadConfig == fileUploadConfig) &&
            (identical(other.imageUploadConfig, imageUploadConfig) ||
                other.imageUploadConfig == imageUploadConfig) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.shard, shard) || other.shard == shard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      asyncUrlEnrichEnabled,
      autoTranslationEnabled,
      fileUploadConfig,
      imageUploadConfig,
      name,
      region,
      shard);

  @override
  String toString() {
    return 'AppResponseFields(asyncUrlEnrichEnabled: $asyncUrlEnrichEnabled, autoTranslationEnabled: $autoTranslationEnabled, fileUploadConfig: $fileUploadConfig, imageUploadConfig: $imageUploadConfig, name: $name, region: $region, shard: $shard)';
  }
}

/// @nodoc
abstract mixin class $AppResponseFieldsCopyWith<$Res> {
  factory $AppResponseFieldsCopyWith(
          AppResponseFields value, $Res Function(AppResponseFields) _then) =
      _$AppResponseFieldsCopyWithImpl;
  @useResult
  $Res call(
      {bool asyncUrlEnrichEnabled,
      bool autoTranslationEnabled,
      FileUploadConfig fileUploadConfig,
      FileUploadConfig imageUploadConfig,
      String name,
      String region,
      String shard});
}

/// @nodoc
class _$AppResponseFieldsCopyWithImpl<$Res>
    implements $AppResponseFieldsCopyWith<$Res> {
  _$AppResponseFieldsCopyWithImpl(this._self, this._then);

  final AppResponseFields _self;
  final $Res Function(AppResponseFields) _then;

  /// Create a copy of AppResponseFields
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncUrlEnrichEnabled = null,
    Object? autoTranslationEnabled = null,
    Object? fileUploadConfig = null,
    Object? imageUploadConfig = null,
    Object? name = null,
    Object? region = null,
    Object? shard = null,
  }) {
    return _then(AppResponseFields(
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
              as FileUploadConfig,
      imageUploadConfig: null == imageUploadConfig
          ? _self.imageUploadConfig
          : imageUploadConfig // ignore: cast_nullable_to_non_nullable
              as FileUploadConfig,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      shard: null == shard
          ? _self.shard
          : shard // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

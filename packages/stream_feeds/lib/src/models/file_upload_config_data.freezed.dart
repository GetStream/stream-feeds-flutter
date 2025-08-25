// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileUploadConfigData {
  List<String> get allowedFileExtensions;
  List<String> get allowedMimeTypes;
  List<String> get blockedFileExtensions;
  List<String> get blockedMimeTypes;
  int get sizeLimit;

  /// Create a copy of FileUploadConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileUploadConfigDataCopyWith<FileUploadConfigData> get copyWith =>
      _$FileUploadConfigDataCopyWithImpl<FileUploadConfigData>(
          this as FileUploadConfigData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileUploadConfigData &&
            const DeepCollectionEquality()
                .equals(other.allowedFileExtensions, allowedFileExtensions) &&
            const DeepCollectionEquality()
                .equals(other.allowedMimeTypes, allowedMimeTypes) &&
            const DeepCollectionEquality()
                .equals(other.blockedFileExtensions, blockedFileExtensions) &&
            const DeepCollectionEquality()
                .equals(other.blockedMimeTypes, blockedMimeTypes) &&
            (identical(other.sizeLimit, sizeLimit) ||
                other.sizeLimit == sizeLimit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allowedFileExtensions),
      const DeepCollectionEquality().hash(allowedMimeTypes),
      const DeepCollectionEquality().hash(blockedFileExtensions),
      const DeepCollectionEquality().hash(blockedMimeTypes),
      sizeLimit);

  @override
  String toString() {
    return 'FileUploadConfigData(allowedFileExtensions: $allowedFileExtensions, allowedMimeTypes: $allowedMimeTypes, blockedFileExtensions: $blockedFileExtensions, blockedMimeTypes: $blockedMimeTypes, sizeLimit: $sizeLimit)';
  }
}

/// @nodoc
abstract mixin class $FileUploadConfigDataCopyWith<$Res> {
  factory $FileUploadConfigDataCopyWith(FileUploadConfigData value,
          $Res Function(FileUploadConfigData) _then) =
      _$FileUploadConfigDataCopyWithImpl;
  @useResult
  $Res call(
      {List<String> allowedFileExtensions,
      List<String> allowedMimeTypes,
      List<String> blockedFileExtensions,
      List<String> blockedMimeTypes,
      int sizeLimit});
}

/// @nodoc
class _$FileUploadConfigDataCopyWithImpl<$Res>
    implements $FileUploadConfigDataCopyWith<$Res> {
  _$FileUploadConfigDataCopyWithImpl(this._self, this._then);

  final FileUploadConfigData _self;
  final $Res Function(FileUploadConfigData) _then;

  /// Create a copy of FileUploadConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowedFileExtensions = null,
    Object? allowedMimeTypes = null,
    Object? blockedFileExtensions = null,
    Object? blockedMimeTypes = null,
    Object? sizeLimit = null,
  }) {
    return _then(FileUploadConfigData(
      allowedFileExtensions: null == allowedFileExtensions
          ? _self.allowedFileExtensions
          : allowedFileExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allowedMimeTypes: null == allowedMimeTypes
          ? _self.allowedMimeTypes
          : allowedMimeTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedFileExtensions: null == blockedFileExtensions
          ? _self.blockedFileExtensions
          : blockedFileExtensions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockedMimeTypes: null == blockedMimeTypes
          ? _self.blockedMimeTypes
          : blockedMimeTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sizeLimit: null == sizeLimit
          ? _self.sizeLimit
          : sizeLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

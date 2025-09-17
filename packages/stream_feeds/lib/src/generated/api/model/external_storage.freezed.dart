// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'external_storage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExternalStorage {
  String? get absAccountName;
  String? get absClientId;
  String? get absClientSecret;
  String? get absTenantId;
  String? get bucket;
  String? get gcsCredentials;
  String? get path;
  String? get s3ApiKey;
  String? get s3CustomEndpoint;
  String? get s3Region;
  String? get s3SecretKey;
  String? get storageName;
  int? get storageType;

  /// Create a copy of ExternalStorage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExternalStorageCopyWith<ExternalStorage> get copyWith =>
      _$ExternalStorageCopyWithImpl<ExternalStorage>(
          this as ExternalStorage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExternalStorage &&
            (identical(other.absAccountName, absAccountName) ||
                other.absAccountName == absAccountName) &&
            (identical(other.absClientId, absClientId) ||
                other.absClientId == absClientId) &&
            (identical(other.absClientSecret, absClientSecret) ||
                other.absClientSecret == absClientSecret) &&
            (identical(other.absTenantId, absTenantId) ||
                other.absTenantId == absTenantId) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.gcsCredentials, gcsCredentials) ||
                other.gcsCredentials == gcsCredentials) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.s3ApiKey, s3ApiKey) ||
                other.s3ApiKey == s3ApiKey) &&
            (identical(other.s3CustomEndpoint, s3CustomEndpoint) ||
                other.s3CustomEndpoint == s3CustomEndpoint) &&
            (identical(other.s3Region, s3Region) ||
                other.s3Region == s3Region) &&
            (identical(other.s3SecretKey, s3SecretKey) ||
                other.s3SecretKey == s3SecretKey) &&
            (identical(other.storageName, storageName) ||
                other.storageName == storageName) &&
            (identical(other.storageType, storageType) ||
                other.storageType == storageType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      absAccountName,
      absClientId,
      absClientSecret,
      absTenantId,
      bucket,
      gcsCredentials,
      path,
      s3ApiKey,
      s3CustomEndpoint,
      s3Region,
      s3SecretKey,
      storageName,
      storageType);

  @override
  String toString() {
    return 'ExternalStorage(absAccountName: $absAccountName, absClientId: $absClientId, absClientSecret: $absClientSecret, absTenantId: $absTenantId, bucket: $bucket, gcsCredentials: $gcsCredentials, path: $path, s3ApiKey: $s3ApiKey, s3CustomEndpoint: $s3CustomEndpoint, s3Region: $s3Region, s3SecretKey: $s3SecretKey, storageName: $storageName, storageType: $storageType)';
  }
}

/// @nodoc
abstract mixin class $ExternalStorageCopyWith<$Res> {
  factory $ExternalStorageCopyWith(
          ExternalStorage value, $Res Function(ExternalStorage) _then) =
      _$ExternalStorageCopyWithImpl;
  @useResult
  $Res call(
      {String? absAccountName,
      String? absClientId,
      String? absClientSecret,
      String? absTenantId,
      String? bucket,
      String? gcsCredentials,
      String? path,
      String? s3ApiKey,
      String? s3CustomEndpoint,
      String? s3Region,
      String? s3SecretKey,
      String? storageName,
      int? storageType});
}

/// @nodoc
class _$ExternalStorageCopyWithImpl<$Res>
    implements $ExternalStorageCopyWith<$Res> {
  _$ExternalStorageCopyWithImpl(this._self, this._then);

  final ExternalStorage _self;
  final $Res Function(ExternalStorage) _then;

  /// Create a copy of ExternalStorage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absAccountName = freezed,
    Object? absClientId = freezed,
    Object? absClientSecret = freezed,
    Object? absTenantId = freezed,
    Object? bucket = freezed,
    Object? gcsCredentials = freezed,
    Object? path = freezed,
    Object? s3ApiKey = freezed,
    Object? s3CustomEndpoint = freezed,
    Object? s3Region = freezed,
    Object? s3SecretKey = freezed,
    Object? storageName = freezed,
    Object? storageType = freezed,
  }) {
    return _then(ExternalStorage(
      absAccountName: freezed == absAccountName
          ? _self.absAccountName
          : absAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      absClientId: freezed == absClientId
          ? _self.absClientId
          : absClientId // ignore: cast_nullable_to_non_nullable
              as String?,
      absClientSecret: freezed == absClientSecret
          ? _self.absClientSecret
          : absClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      absTenantId: freezed == absTenantId
          ? _self.absTenantId
          : absTenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      bucket: freezed == bucket
          ? _self.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String?,
      gcsCredentials: freezed == gcsCredentials
          ? _self.gcsCredentials
          : gcsCredentials // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      s3ApiKey: freezed == s3ApiKey
          ? _self.s3ApiKey
          : s3ApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      s3CustomEndpoint: freezed == s3CustomEndpoint
          ? _self.s3CustomEndpoint
          : s3CustomEndpoint // ignore: cast_nullable_to_non_nullable
              as String?,
      s3Region: freezed == s3Region
          ? _self.s3Region
          : s3Region // ignore: cast_nullable_to_non_nullable
              as String?,
      s3SecretKey: freezed == s3SecretKey
          ? _self.s3SecretKey
          : s3SecretKey // ignore: cast_nullable_to_non_nullable
              as String?,
      storageName: freezed == storageName
          ? _self.storageName
          : storageName // ignore: cast_nullable_to_non_nullable
              as String?,
      storageType: freezed == storageType
          ? _self.storageType
          : storageType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quality {
  int? get bitdepth;
  int? get framerate;
  int? get height;
  String? get name;
  int? get videoBitrate;
  int? get width;

  /// Create a copy of Quality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QualityCopyWith<Quality> get copyWith =>
      _$QualityCopyWithImpl<Quality>(this as Quality, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quality &&
            (identical(other.bitdepth, bitdepth) ||
                other.bitdepth == bitdepth) &&
            (identical(other.framerate, framerate) ||
                other.framerate == framerate) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.videoBitrate, videoBitrate) ||
                other.videoBitrate == videoBitrate) &&
            (identical(other.width, width) || other.width == width));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bitdepth, framerate, height, name, videoBitrate, width);

  @override
  String toString() {
    return 'Quality(bitdepth: $bitdepth, framerate: $framerate, height: $height, name: $name, videoBitrate: $videoBitrate, width: $width)';
  }
}

/// @nodoc
abstract mixin class $QualityCopyWith<$Res> {
  factory $QualityCopyWith(Quality value, $Res Function(Quality) _then) =
      _$QualityCopyWithImpl;
  @useResult
  $Res call(
      {int? bitdepth,
      int? framerate,
      int? height,
      String? name,
      int? videoBitrate,
      int? width});
}

/// @nodoc
class _$QualityCopyWithImpl<$Res> implements $QualityCopyWith<$Res> {
  _$QualityCopyWithImpl(this._self, this._then);

  final Quality _self;
  final $Res Function(Quality) _then;

  /// Create a copy of Quality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitdepth = freezed,
    Object? framerate = freezed,
    Object? height = freezed,
    Object? name = freezed,
    Object? videoBitrate = freezed,
    Object? width = freezed,
  }) {
    return _then(Quality(
      bitdepth: freezed == bitdepth
          ? _self.bitdepth
          : bitdepth // ignore: cast_nullable_to_non_nullable
              as int?,
      framerate: freezed == framerate
          ? _self.framerate
          : framerate // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      videoBitrate: freezed == videoBitrate
          ? _self.videoBitrate
          : videoBitrate // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

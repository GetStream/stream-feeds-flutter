// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_orientation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoOrientation {
  int? get orientation;

  /// Create a copy of VideoOrientation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoOrientationCopyWith<VideoOrientation> get copyWith =>
      _$VideoOrientationCopyWithImpl<VideoOrientation>(
          this as VideoOrientation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoOrientation &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orientation);

  @override
  String toString() {
    return 'VideoOrientation(orientation: $orientation)';
  }
}

/// @nodoc
abstract mixin class $VideoOrientationCopyWith<$Res> {
  factory $VideoOrientationCopyWith(
          VideoOrientation value, $Res Function(VideoOrientation) _then) =
      _$VideoOrientationCopyWithImpl;
  @useResult
  $Res call({int? orientation});
}

/// @nodoc
class _$VideoOrientationCopyWithImpl<$Res>
    implements $VideoOrientationCopyWith<$Res> {
  _$VideoOrientationCopyWithImpl(this._self, this._then);

  final VideoOrientation _self;
  final $Res Function(VideoOrientation) _then;

  /// Create a copy of VideoOrientation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orientation = freezed,
  }) {
    return _then(VideoOrientation(
      orientation: freezed == orientation
          ? _self.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtmp_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RTMPLocation {
  String get name;
  String get streamKey;
  String get streamUrl;

  /// Create a copy of RTMPLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RTMPLocationCopyWith<RTMPLocation> get copyWith =>
      _$RTMPLocationCopyWithImpl<RTMPLocation>(
          this as RTMPLocation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RTMPLocation &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.streamKey, streamKey) ||
                other.streamKey == streamKey) &&
            (identical(other.streamUrl, streamUrl) ||
                other.streamUrl == streamUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, streamKey, streamUrl);

  @override
  String toString() {
    return 'RTMPLocation(name: $name, streamKey: $streamKey, streamUrl: $streamUrl)';
  }
}

/// @nodoc
abstract mixin class $RTMPLocationCopyWith<$Res> {
  factory $RTMPLocationCopyWith(
          RTMPLocation value, $Res Function(RTMPLocation) _then) =
      _$RTMPLocationCopyWithImpl;
  @useResult
  $Res call({String name, String streamKey, String streamUrl});
}

/// @nodoc
class _$RTMPLocationCopyWithImpl<$Res> implements $RTMPLocationCopyWith<$Res> {
  _$RTMPLocationCopyWithImpl(this._self, this._then);

  final RTMPLocation _self;
  final $Res Function(RTMPLocation) _then;

  /// Create a copy of RTMPLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? streamKey = null,
    Object? streamUrl = null,
  }) {
    return _then(RTMPLocation(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      streamKey: null == streamKey
          ? _self.streamKey
          : streamKey // ignore: cast_nullable_to_non_nullable
              as String,
      streamUrl: null == streamUrl
          ? _self.streamUrl
          : streamUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

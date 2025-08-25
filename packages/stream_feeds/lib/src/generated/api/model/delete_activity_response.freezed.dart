// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteActivityResponse {
  String get duration;

  /// Create a copy of DeleteActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteActivityResponseCopyWith<DeleteActivityResponse> get copyWith =>
      _$DeleteActivityResponseCopyWithImpl<DeleteActivityResponse>(
          this as DeleteActivityResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteActivityResponse &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration);

  @override
  String toString() {
    return 'DeleteActivityResponse(duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivityResponseCopyWith<$Res> {
  factory $DeleteActivityResponseCopyWith(DeleteActivityResponse value,
          $Res Function(DeleteActivityResponse) _then) =
      _$DeleteActivityResponseCopyWithImpl;
  @useResult
  $Res call({String duration});
}

/// @nodoc
class _$DeleteActivityResponseCopyWithImpl<$Res>
    implements $DeleteActivityResponseCopyWith<$Res> {
  _$DeleteActivityResponseCopyWithImpl(this._self, this._then);

  final DeleteActivityResponse _self;
  final $Res Function(DeleteActivityResponse) _then;

  /// Create a copy of DeleteActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
  }) {
    return _then(DeleteActivityResponse(
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

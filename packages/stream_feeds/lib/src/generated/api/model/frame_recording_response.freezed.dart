// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'frame_recording_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FrameRecordingResponse {
  String get status;

  /// Create a copy of FrameRecordingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FrameRecordingResponseCopyWith<FrameRecordingResponse> get copyWith =>
      _$FrameRecordingResponseCopyWithImpl<FrameRecordingResponse>(
          this as FrameRecordingResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FrameRecordingResponse &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'FrameRecordingResponse(status: $status)';
  }
}

/// @nodoc
abstract mixin class $FrameRecordingResponseCopyWith<$Res> {
  factory $FrameRecordingResponseCopyWith(FrameRecordingResponse value,
          $Res Function(FrameRecordingResponse) _then) =
      _$FrameRecordingResponseCopyWithImpl;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$FrameRecordingResponseCopyWithImpl<$Res>
    implements $FrameRecordingResponseCopyWith<$Res> {
  _$FrameRecordingResponseCopyWithImpl(this._self, this._then);

  final FrameRecordingResponse _self;
  final $Res Function(FrameRecordingResponse) _then;

  /// Create a copy of FrameRecordingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(FrameRecordingResponse(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

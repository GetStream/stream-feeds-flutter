// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egress_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EgressResponse {
  bool get broadcasting;
  FrameRecordingResponse? get frameRecording;
  EgressHLSResponse? get hls;
  List<EgressRTMPResponse> get rtmps;

  /// Create a copy of EgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EgressResponseCopyWith<EgressResponse> get copyWith =>
      _$EgressResponseCopyWithImpl<EgressResponse>(
          this as EgressResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EgressResponse &&
            (identical(other.broadcasting, broadcasting) ||
                other.broadcasting == broadcasting) &&
            (identical(other.frameRecording, frameRecording) ||
                other.frameRecording == frameRecording) &&
            (identical(other.hls, hls) || other.hls == hls) &&
            const DeepCollectionEquality().equals(other.rtmps, rtmps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, broadcasting, frameRecording,
      hls, const DeepCollectionEquality().hash(rtmps));

  @override
  String toString() {
    return 'EgressResponse(broadcasting: $broadcasting, frameRecording: $frameRecording, hls: $hls, rtmps: $rtmps)';
  }
}

/// @nodoc
abstract mixin class $EgressResponseCopyWith<$Res> {
  factory $EgressResponseCopyWith(
          EgressResponse value, $Res Function(EgressResponse) _then) =
      _$EgressResponseCopyWithImpl;
  @useResult
  $Res call(
      {bool broadcasting,
      FrameRecordingResponse? frameRecording,
      EgressHLSResponse? hls,
      List<EgressRTMPResponse> rtmps});
}

/// @nodoc
class _$EgressResponseCopyWithImpl<$Res>
    implements $EgressResponseCopyWith<$Res> {
  _$EgressResponseCopyWithImpl(this._self, this._then);

  final EgressResponse _self;
  final $Res Function(EgressResponse) _then;

  /// Create a copy of EgressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? broadcasting = null,
    Object? frameRecording = freezed,
    Object? hls = freezed,
    Object? rtmps = null,
  }) {
    return _then(EgressResponse(
      broadcasting: null == broadcasting
          ? _self.broadcasting
          : broadcasting // ignore: cast_nullable_to_non_nullable
              as bool,
      frameRecording: freezed == frameRecording
          ? _self.frameRecording
          : frameRecording // ignore: cast_nullable_to_non_nullable
              as FrameRecordingResponse?,
      hls: freezed == hls
          ? _self.hls
          : hls // ignore: cast_nullable_to_non_nullable
              as EgressHLSResponse?,
      rtmps: null == rtmps
          ? _self.rtmps
          : rtmps // ignore: cast_nullable_to_non_nullable
              as List<EgressRTMPResponse>,
    ));
  }
}

// dart format on

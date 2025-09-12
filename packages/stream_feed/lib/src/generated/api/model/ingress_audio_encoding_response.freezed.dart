// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingress_audio_encoding_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngressAudioEncodingResponse {
  int get bitrate;
  int get channels;
  bool get enableDtx;

  /// Create a copy of IngressAudioEncodingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngressAudioEncodingResponseCopyWith<IngressAudioEncodingResponse>
      get copyWith => _$IngressAudioEncodingResponseCopyWithImpl<
              IngressAudioEncodingResponse>(
          this as IngressAudioEncodingResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngressAudioEncodingResponse &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.channels, channels) ||
                other.channels == channels) &&
            (identical(other.enableDtx, enableDtx) ||
                other.enableDtx == enableDtx));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bitrate, channels, enableDtx);

  @override
  String toString() {
    return 'IngressAudioEncodingResponse(bitrate: $bitrate, channels: $channels, enableDtx: $enableDtx)';
  }
}

/// @nodoc
abstract mixin class $IngressAudioEncodingResponseCopyWith<$Res> {
  factory $IngressAudioEncodingResponseCopyWith(
          IngressAudioEncodingResponse value,
          $Res Function(IngressAudioEncodingResponse) _then) =
      _$IngressAudioEncodingResponseCopyWithImpl;
  @useResult
  $Res call({int bitrate, int channels, bool enableDtx});
}

/// @nodoc
class _$IngressAudioEncodingResponseCopyWithImpl<$Res>
    implements $IngressAudioEncodingResponseCopyWith<$Res> {
  _$IngressAudioEncodingResponseCopyWithImpl(this._self, this._then);

  final IngressAudioEncodingResponse _self;
  final $Res Function(IngressAudioEncodingResponse) _then;

  /// Create a copy of IngressAudioEncodingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
    Object? channels = null,
    Object? enableDtx = null,
  }) {
    return _then(IngressAudioEncodingResponse(
      bitrate: null == bitrate
          ? _self.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      channels: null == channels
          ? _self.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as int,
      enableDtx: null == enableDtx
          ? _self.enableDtx
          : enableDtx // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

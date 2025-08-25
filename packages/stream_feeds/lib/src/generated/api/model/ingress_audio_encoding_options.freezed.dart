// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingress_audio_encoding_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngressAudioEncodingOptions {
  int get bitrate;
  IngressAudioEncodingOptionsChannels get channels;
  bool get enableDtx;

  /// Create a copy of IngressAudioEncodingOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngressAudioEncodingOptionsCopyWith<IngressAudioEncodingOptions>
      get copyWith => _$IngressAudioEncodingOptionsCopyWithImpl<
              IngressAudioEncodingOptions>(
          this as IngressAudioEncodingOptions, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngressAudioEncodingOptions &&
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
    return 'IngressAudioEncodingOptions(bitrate: $bitrate, channels: $channels, enableDtx: $enableDtx)';
  }
}

/// @nodoc
abstract mixin class $IngressAudioEncodingOptionsCopyWith<$Res> {
  factory $IngressAudioEncodingOptionsCopyWith(
          IngressAudioEncodingOptions value,
          $Res Function(IngressAudioEncodingOptions) _then) =
      _$IngressAudioEncodingOptionsCopyWithImpl;
  @useResult
  $Res call(
      {int bitrate,
      IngressAudioEncodingOptionsChannels channels,
      bool enableDtx});
}

/// @nodoc
class _$IngressAudioEncodingOptionsCopyWithImpl<$Res>
    implements $IngressAudioEncodingOptionsCopyWith<$Res> {
  _$IngressAudioEncodingOptionsCopyWithImpl(this._self, this._then);

  final IngressAudioEncodingOptions _self;
  final $Res Function(IngressAudioEncodingOptions) _then;

  /// Create a copy of IngressAudioEncodingOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
    Object? channels = null,
    Object? enableDtx = null,
  }) {
    return _then(IngressAudioEncodingOptions(
      bitrate: null == bitrate
          ? _self.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      channels: null == channels
          ? _self.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as IngressAudioEncodingOptionsChannels,
      enableDtx: null == enableDtx
          ? _self.enableDtx
          : enableDtx // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingress_video_layer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngressVideoLayer {
  int get bitrate;
  IngressVideoLayerCodec get codec;
  int get frameRate;
  int get maxDimension;
  int get minDimension;

  /// Create a copy of IngressVideoLayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngressVideoLayerCopyWith<IngressVideoLayer> get copyWith =>
      _$IngressVideoLayerCopyWithImpl<IngressVideoLayer>(
          this as IngressVideoLayer, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngressVideoLayer &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.frameRate, frameRate) ||
                other.frameRate == frameRate) &&
            (identical(other.maxDimension, maxDimension) ||
                other.maxDimension == maxDimension) &&
            (identical(other.minDimension, minDimension) ||
                other.minDimension == minDimension));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bitrate, codec, frameRate, maxDimension, minDimension);

  @override
  String toString() {
    return 'IngressVideoLayer(bitrate: $bitrate, codec: $codec, frameRate: $frameRate, maxDimension: $maxDimension, minDimension: $minDimension)';
  }
}

/// @nodoc
abstract mixin class $IngressVideoLayerCopyWith<$Res> {
  factory $IngressVideoLayerCopyWith(
          IngressVideoLayer value, $Res Function(IngressVideoLayer) _then) =
      _$IngressVideoLayerCopyWithImpl;
  @useResult
  $Res call(
      {int bitrate,
      IngressVideoLayerCodec codec,
      int frameRate,
      int maxDimension,
      int minDimension});
}

/// @nodoc
class _$IngressVideoLayerCopyWithImpl<$Res>
    implements $IngressVideoLayerCopyWith<$Res> {
  _$IngressVideoLayerCopyWithImpl(this._self, this._then);

  final IngressVideoLayer _self;
  final $Res Function(IngressVideoLayer) _then;

  /// Create a copy of IngressVideoLayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bitrate = null,
    Object? codec = null,
    Object? frameRate = null,
    Object? maxDimension = null,
    Object? minDimension = null,
  }) {
    return _then(IngressVideoLayer(
      bitrate: null == bitrate
          ? _self.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      codec: null == codec
          ? _self.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as IngressVideoLayerCodec,
      frameRate: null == frameRate
          ? _self.frameRate
          : frameRate // ignore: cast_nullable_to_non_nullable
              as int,
      maxDimension: null == maxDimension
          ? _self.maxDimension
          : maxDimension // ignore: cast_nullable_to_non_nullable
              as int,
      minDimension: null == minDimension
          ? _self.minDimension
          : minDimension // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on

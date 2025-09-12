// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingress_video_encoding_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngressVideoEncodingOptions {
  List<IngressVideoLayer> get layers;

  /// Create a copy of IngressVideoEncodingOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngressVideoEncodingOptionsCopyWith<IngressVideoEncodingOptions>
      get copyWith => _$IngressVideoEncodingOptionsCopyWithImpl<
              IngressVideoEncodingOptions>(
          this as IngressVideoEncodingOptions, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngressVideoEncodingOptions &&
            const DeepCollectionEquality().equals(other.layers, layers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(layers));

  @override
  String toString() {
    return 'IngressVideoEncodingOptions(layers: $layers)';
  }
}

/// @nodoc
abstract mixin class $IngressVideoEncodingOptionsCopyWith<$Res> {
  factory $IngressVideoEncodingOptionsCopyWith(
          IngressVideoEncodingOptions value,
          $Res Function(IngressVideoEncodingOptions) _then) =
      _$IngressVideoEncodingOptionsCopyWithImpl;
  @useResult
  $Res call({List<IngressVideoLayer> layers});
}

/// @nodoc
class _$IngressVideoEncodingOptionsCopyWithImpl<$Res>
    implements $IngressVideoEncodingOptionsCopyWith<$Res> {
  _$IngressVideoEncodingOptionsCopyWithImpl(this._self, this._then);

  final IngressVideoEncodingOptions _self;
  final $Res Function(IngressVideoEncodingOptions) _then;

  /// Create a copy of IngressVideoEncodingOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layers = null,
  }) {
    return _then(IngressVideoEncodingOptions(
      layers: null == layers
          ? _self.layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<IngressVideoLayer>,
    ));
  }
}

// dart format on

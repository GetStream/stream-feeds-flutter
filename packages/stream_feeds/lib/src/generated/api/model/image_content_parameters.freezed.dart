// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_content_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageContentParameters {
  List<String>? get harmLabels;

  /// Create a copy of ImageContentParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageContentParametersCopyWith<ImageContentParameters> get copyWith =>
      _$ImageContentParametersCopyWithImpl<ImageContentParameters>(
          this as ImageContentParameters, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageContentParameters &&
            const DeepCollectionEquality()
                .equals(other.harmLabels, harmLabels));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(harmLabels));

  @override
  String toString() {
    return 'ImageContentParameters(harmLabels: $harmLabels)';
  }
}

/// @nodoc
abstract mixin class $ImageContentParametersCopyWith<$Res> {
  factory $ImageContentParametersCopyWith(ImageContentParameters value,
          $Res Function(ImageContentParameters) _then) =
      _$ImageContentParametersCopyWithImpl;
  @useResult
  $Res call({List<String>? harmLabels});
}

/// @nodoc
class _$ImageContentParametersCopyWithImpl<$Res>
    implements $ImageContentParametersCopyWith<$Res> {
  _$ImageContentParametersCopyWithImpl(this._self, this._then);

  final ImageContentParameters _self;
  final $Res Function(ImageContentParameters) _then;

  /// Create a copy of ImageContentParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? harmLabels = freezed,
  }) {
    return _then(ImageContentParameters(
      harmLabels: freezed == harmLabels
          ? _self.harmLabels
          : harmLabels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on

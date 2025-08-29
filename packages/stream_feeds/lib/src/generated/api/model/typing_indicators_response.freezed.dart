// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_indicators_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypingIndicatorsResponse {
  bool get enabled;

  /// Create a copy of TypingIndicatorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TypingIndicatorsResponseCopyWith<TypingIndicatorsResponse> get copyWith =>
      _$TypingIndicatorsResponseCopyWithImpl<TypingIndicatorsResponse>(
          this as TypingIndicatorsResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TypingIndicatorsResponse &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'TypingIndicatorsResponse(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $TypingIndicatorsResponseCopyWith<$Res> {
  factory $TypingIndicatorsResponseCopyWith(TypingIndicatorsResponse value,
          $Res Function(TypingIndicatorsResponse) _then) =
      _$TypingIndicatorsResponseCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$TypingIndicatorsResponseCopyWithImpl<$Res>
    implements $TypingIndicatorsResponseCopyWith<$Res> {
  _$TypingIndicatorsResponseCopyWithImpl(this._self, this._then);

  final TypingIndicatorsResponse _self;
  final $Res Function(TypingIndicatorsResponse) _then;

  /// Create a copy of TypingIndicatorsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
  }) {
    return _then(TypingIndicatorsResponse(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shadow_block_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShadowBlockActionRequest {
  String? get reason;

  /// Create a copy of ShadowBlockActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShadowBlockActionRequestCopyWith<ShadowBlockActionRequest> get copyWith =>
      _$ShadowBlockActionRequestCopyWithImpl<ShadowBlockActionRequest>(
          this as ShadowBlockActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShadowBlockActionRequest &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'ShadowBlockActionRequest(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $ShadowBlockActionRequestCopyWith<$Res> {
  factory $ShadowBlockActionRequestCopyWith(ShadowBlockActionRequest value,
          $Res Function(ShadowBlockActionRequest) _then) =
      _$ShadowBlockActionRequestCopyWithImpl;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class _$ShadowBlockActionRequestCopyWithImpl<$Res>
    implements $ShadowBlockActionRequestCopyWith<$Res> {
  _$ShadowBlockActionRequestCopyWithImpl(this._self, this._then);

  final ShadowBlockActionRequest _self;
  final $Res Function(ShadowBlockActionRequest) _then;

  /// Create a copy of ShadowBlockActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(ShadowBlockActionRequest(
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restore_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RestoreActionRequest {
  String? get decisionReason;

  /// Create a copy of RestoreActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RestoreActionRequestCopyWith<RestoreActionRequest> get copyWith =>
      _$RestoreActionRequestCopyWithImpl<RestoreActionRequest>(
          this as RestoreActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RestoreActionRequest &&
            (identical(other.decisionReason, decisionReason) ||
                other.decisionReason == decisionReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, decisionReason);

  @override
  String toString() {
    return 'RestoreActionRequest(decisionReason: $decisionReason)';
  }
}

/// @nodoc
abstract mixin class $RestoreActionRequestCopyWith<$Res> {
  factory $RestoreActionRequestCopyWith(RestoreActionRequest value,
          $Res Function(RestoreActionRequest) _then) =
      _$RestoreActionRequestCopyWithImpl;
  @useResult
  $Res call({String? decisionReason});
}

/// @nodoc
class _$RestoreActionRequestCopyWithImpl<$Res>
    implements $RestoreActionRequestCopyWith<$Res> {
  _$RestoreActionRequestCopyWithImpl(this._self, this._then);

  final RestoreActionRequest _self;
  final $Res Function(RestoreActionRequest) _then;

  /// Create a copy of RestoreActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionReason = freezed,
  }) {
    return _then(RestoreActionRequest(
      decisionReason: freezed == decisionReason
          ? _self.decisionReason
          : decisionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

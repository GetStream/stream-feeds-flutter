// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unban_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnbanActionRequest {
  String? get decisionReason;

  /// Create a copy of UnbanActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnbanActionRequestCopyWith<UnbanActionRequest> get copyWith =>
      _$UnbanActionRequestCopyWithImpl<UnbanActionRequest>(
          this as UnbanActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnbanActionRequest &&
            (identical(other.decisionReason, decisionReason) ||
                other.decisionReason == decisionReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, decisionReason);

  @override
  String toString() {
    return 'UnbanActionRequest(decisionReason: $decisionReason)';
  }
}

/// @nodoc
abstract mixin class $UnbanActionRequestCopyWith<$Res> {
  factory $UnbanActionRequestCopyWith(
          UnbanActionRequest value, $Res Function(UnbanActionRequest) _then) =
      _$UnbanActionRequestCopyWithImpl;
  @useResult
  $Res call({String? decisionReason});
}

/// @nodoc
class _$UnbanActionRequestCopyWithImpl<$Res>
    implements $UnbanActionRequestCopyWith<$Res> {
  _$UnbanActionRequestCopyWithImpl(this._self, this._then);

  final UnbanActionRequest _self;
  final $Res Function(UnbanActionRequest) _then;

  /// Create a copy of UnbanActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionReason = freezed,
  }) {
    return _then(UnbanActionRequest(
      decisionReason: freezed == decisionReason
          ? _self.decisionReason
          : decisionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unblock_action_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnblockActionRequest {
  String? get decisionReason;

  /// Create a copy of UnblockActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnblockActionRequestCopyWith<UnblockActionRequest> get copyWith =>
      _$UnblockActionRequestCopyWithImpl<UnblockActionRequest>(
          this as UnblockActionRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnblockActionRequest &&
            (identical(other.decisionReason, decisionReason) ||
                other.decisionReason == decisionReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, decisionReason);

  @override
  String toString() {
    return 'UnblockActionRequest(decisionReason: $decisionReason)';
  }
}

/// @nodoc
abstract mixin class $UnblockActionRequestCopyWith<$Res> {
  factory $UnblockActionRequestCopyWith(UnblockActionRequest value,
          $Res Function(UnblockActionRequest) _then) =
      _$UnblockActionRequestCopyWithImpl;
  @useResult
  $Res call({String? decisionReason});
}

/// @nodoc
class _$UnblockActionRequestCopyWithImpl<$Res>
    implements $UnblockActionRequestCopyWith<$Res> {
  _$UnblockActionRequestCopyWithImpl(this._self, this._then);

  final UnblockActionRequest _self;
  final $Res Function(UnblockActionRequest) _then;

  /// Create a copy of UnblockActionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionReason = freezed,
  }) {
    return _then(UnblockActionRequest(
      decisionReason: freezed == decisionReason
          ? _self.decisionReason
          : decisionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_appeal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RejectAppealRequest {
  String get decisionReason;

  /// Create a copy of RejectAppealRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RejectAppealRequestCopyWith<RejectAppealRequest> get copyWith =>
      _$RejectAppealRequestCopyWithImpl<RejectAppealRequest>(
          this as RejectAppealRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RejectAppealRequest &&
            (identical(other.decisionReason, decisionReason) ||
                other.decisionReason == decisionReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, decisionReason);

  @override
  String toString() {
    return 'RejectAppealRequest(decisionReason: $decisionReason)';
  }
}

/// @nodoc
abstract mixin class $RejectAppealRequestCopyWith<$Res> {
  factory $RejectAppealRequestCopyWith(
          RejectAppealRequest value, $Res Function(RejectAppealRequest) _then) =
      _$RejectAppealRequestCopyWithImpl;
  @useResult
  $Res call({String decisionReason});
}

/// @nodoc
class _$RejectAppealRequestCopyWithImpl<$Res>
    implements $RejectAppealRequestCopyWith<$Res> {
  _$RejectAppealRequestCopyWithImpl(this._self, this._then);

  final RejectAppealRequest _self;
  final $Res Function(RejectAppealRequest) _then;

  /// Create a copy of RejectAppealRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? decisionReason = null,
  }) {
    return _then(RejectAppealRequest(
      decisionReason: null == decisionReason
          ? _self.decisionReason
          : decisionReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

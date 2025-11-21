// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteActivityRequest {
  bool? get hardDelete;
  String? get reason;

  /// Create a copy of DeleteActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteActivityRequestCopyWith<DeleteActivityRequest> get copyWith =>
      _$DeleteActivityRequestCopyWithImpl<DeleteActivityRequest>(
          this as DeleteActivityRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteActivityRequest &&
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hardDelete, reason);

  @override
  String toString() {
    return 'DeleteActivityRequest(hardDelete: $hardDelete, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $DeleteActivityRequestCopyWith<$Res> {
  factory $DeleteActivityRequestCopyWith(DeleteActivityRequest value,
          $Res Function(DeleteActivityRequest) _then) =
      _$DeleteActivityRequestCopyWithImpl;
  @useResult
  $Res call({bool? hardDelete, String? reason});
}

/// @nodoc
class _$DeleteActivityRequestCopyWithImpl<$Res>
    implements $DeleteActivityRequestCopyWith<$Res> {
  _$DeleteActivityRequestCopyWithImpl(this._self, this._then);

  final DeleteActivityRequest _self;
  final $Res Function(DeleteActivityRequest) _then;

  /// Create a copy of DeleteActivityRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hardDelete = freezed,
    Object? reason = freezed,
  }) {
    return _then(DeleteActivityRequest(
      hardDelete: freezed == hardDelete
          ? _self.hardDelete
          : hardDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
      reason: freezed == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

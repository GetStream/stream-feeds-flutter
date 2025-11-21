// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCommentRequest {
  bool? get hardDelete;
  String? get reason;

  /// Create a copy of DeleteCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCommentRequestCopyWith<DeleteCommentRequest> get copyWith =>
      _$DeleteCommentRequestCopyWithImpl<DeleteCommentRequest>(
          this as DeleteCommentRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCommentRequest &&
            (identical(other.hardDelete, hardDelete) ||
                other.hardDelete == hardDelete) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hardDelete, reason);

  @override
  String toString() {
    return 'DeleteCommentRequest(hardDelete: $hardDelete, reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $DeleteCommentRequestCopyWith<$Res> {
  factory $DeleteCommentRequestCopyWith(DeleteCommentRequest value,
          $Res Function(DeleteCommentRequest) _then) =
      _$DeleteCommentRequestCopyWithImpl;
  @useResult
  $Res call({bool? hardDelete, String? reason});
}

/// @nodoc
class _$DeleteCommentRequestCopyWithImpl<$Res>
    implements $DeleteCommentRequestCopyWith<$Res> {
  _$DeleteCommentRequestCopyWithImpl(this._self, this._then);

  final DeleteCommentRequest _self;
  final $Res Function(DeleteCommentRequest) _then;

  /// Create a copy of DeleteCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hardDelete = freezed,
    Object? reason = freezed,
  }) {
    return _then(DeleteCommentRequest(
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

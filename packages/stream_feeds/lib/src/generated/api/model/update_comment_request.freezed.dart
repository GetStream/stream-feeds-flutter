// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentRequest {
  String? get comment;
  Map<String, Object?>? get custom;
  bool? get skipPush;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentRequestCopyWith<UpdateCommentRequest> get copyWith =>
      _$UpdateCommentRequestCopyWithImpl<UpdateCommentRequest>(
          this as UpdateCommentRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentRequest &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.skipPush, skipPush) ||
                other.skipPush == skipPush));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment,
      const DeepCollectionEquality().hash(custom), skipPush);

  @override
  String toString() {
    return 'UpdateCommentRequest(comment: $comment, custom: $custom, skipPush: $skipPush)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentRequestCopyWith<$Res> {
  factory $UpdateCommentRequestCopyWith(UpdateCommentRequest value,
          $Res Function(UpdateCommentRequest) _then) =
      _$UpdateCommentRequestCopyWithImpl;
  @useResult
  $Res call({String? comment, Map<String, Object?>? custom, bool? skipPush});
}

/// @nodoc
class _$UpdateCommentRequestCopyWithImpl<$Res>
    implements $UpdateCommentRequestCopyWith<$Res> {
  _$UpdateCommentRequestCopyWithImpl(this._self, this._then);

  final UpdateCommentRequest _self;
  final $Res Function(UpdateCommentRequest) _then;

  /// Create a copy of UpdateCommentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = freezed,
    Object? custom = freezed,
    Object? skipPush = freezed,
  }) {
    return _then(UpdateCommentRequest(
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      skipPush: freezed == skipPush
          ? _self.skipPush
          : skipPush // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

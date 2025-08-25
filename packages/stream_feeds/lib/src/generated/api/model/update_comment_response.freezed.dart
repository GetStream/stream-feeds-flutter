// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentResponse {
  CommentResponse get comment;
  String get duration;

  /// Create a copy of UpdateCommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentResponseCopyWith<UpdateCommentResponse> get copyWith =>
      _$UpdateCommentResponseCopyWithImpl<UpdateCommentResponse>(
          this as UpdateCommentResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentResponse &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment, duration);

  @override
  String toString() {
    return 'UpdateCommentResponse(comment: $comment, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentResponseCopyWith<$Res> {
  factory $UpdateCommentResponseCopyWith(UpdateCommentResponse value,
          $Res Function(UpdateCommentResponse) _then) =
      _$UpdateCommentResponseCopyWithImpl;
  @useResult
  $Res call({CommentResponse comment, String duration});
}

/// @nodoc
class _$UpdateCommentResponseCopyWithImpl<$Res>
    implements $UpdateCommentResponseCopyWith<$Res> {
  _$UpdateCommentResponseCopyWithImpl(this._self, this._then);

  final UpdateCommentResponse _self;
  final $Res Function(UpdateCommentResponse) _then;

  /// Create a copy of UpdateCommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? duration = null,
  }) {
    return _then(UpdateCommentResponse(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

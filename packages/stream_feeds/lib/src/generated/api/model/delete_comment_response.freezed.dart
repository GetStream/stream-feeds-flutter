// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCommentResponse {
  ActivityResponse get activity;
  CommentResponse get comment;
  String get duration;

  /// Create a copy of DeleteCommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCommentResponseCopyWith<DeleteCommentResponse> get copyWith =>
      _$DeleteCommentResponseCopyWithImpl<DeleteCommentResponse>(
          this as DeleteCommentResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCommentResponse &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, comment, duration);

  @override
  String toString() {
    return 'DeleteCommentResponse(activity: $activity, comment: $comment, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $DeleteCommentResponseCopyWith<$Res> {
  factory $DeleteCommentResponseCopyWith(DeleteCommentResponse value,
          $Res Function(DeleteCommentResponse) _then) =
      _$DeleteCommentResponseCopyWithImpl;
  @useResult
  $Res call(
      {ActivityResponse activity, CommentResponse comment, String duration});
}

/// @nodoc
class _$DeleteCommentResponseCopyWithImpl<$Res>
    implements $DeleteCommentResponseCopyWith<$Res> {
  _$DeleteCommentResponseCopyWithImpl(this._self, this._then);

  final DeleteCommentResponse _self;
  final $Res Function(DeleteCommentResponse) _then;

  /// Create a copy of DeleteCommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? comment = null,
    Object? duration = null,
  }) {
    return _then(DeleteCommentResponse(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityResponse,
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

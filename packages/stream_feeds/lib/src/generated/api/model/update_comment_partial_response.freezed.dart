// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_comment_partial_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateCommentPartialResponse {
  CommentResponse get comment;
  String get duration;

  /// Create a copy of UpdateCommentPartialResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCommentPartialResponseCopyWith<UpdateCommentPartialResponse>
      get copyWith => _$UpdateCommentPartialResponseCopyWithImpl<
              UpdateCommentPartialResponse>(
          this as UpdateCommentPartialResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCommentPartialResponse &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment, duration);

  @override
  String toString() {
    return 'UpdateCommentPartialResponse(comment: $comment, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $UpdateCommentPartialResponseCopyWith<$Res> {
  factory $UpdateCommentPartialResponseCopyWith(
          UpdateCommentPartialResponse value,
          $Res Function(UpdateCommentPartialResponse) _then) =
      _$UpdateCommentPartialResponseCopyWithImpl;
  @useResult
  $Res call({CommentResponse comment, String duration});
}

/// @nodoc
class _$UpdateCommentPartialResponseCopyWithImpl<$Res>
    implements $UpdateCommentPartialResponseCopyWith<$Res> {
  _$UpdateCommentPartialResponseCopyWithImpl(this._self, this._then);

  final UpdateCommentPartialResponse _self;
  final $Res Function(UpdateCommentPartialResponse) _then;

  /// Create a copy of UpdateCommentPartialResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? duration = null,
  }) {
    return _then(UpdateCommentPartialResponse(
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

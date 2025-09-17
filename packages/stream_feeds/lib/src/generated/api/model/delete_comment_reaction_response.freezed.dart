// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_comment_reaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteCommentReactionResponse {
  CommentResponse get comment;
  String get duration;
  FeedsReactionResponse get reaction;

  /// Create a copy of DeleteCommentReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteCommentReactionResponseCopyWith<DeleteCommentReactionResponse>
      get copyWith => _$DeleteCommentReactionResponseCopyWithImpl<
              DeleteCommentReactionResponse>(
          this as DeleteCommentReactionResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteCommentReactionResponse &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment, duration, reaction);

  @override
  String toString() {
    return 'DeleteCommentReactionResponse(comment: $comment, duration: $duration, reaction: $reaction)';
  }
}

/// @nodoc
abstract mixin class $DeleteCommentReactionResponseCopyWith<$Res> {
  factory $DeleteCommentReactionResponseCopyWith(
          DeleteCommentReactionResponse value,
          $Res Function(DeleteCommentReactionResponse) _then) =
      _$DeleteCommentReactionResponseCopyWithImpl;
  @useResult
  $Res call(
      {CommentResponse comment,
      String duration,
      FeedsReactionResponse reaction});
}

/// @nodoc
class _$DeleteCommentReactionResponseCopyWithImpl<$Res>
    implements $DeleteCommentReactionResponseCopyWith<$Res> {
  _$DeleteCommentReactionResponseCopyWithImpl(this._self, this._then);

  final DeleteCommentReactionResponse _self;
  final $Res Function(DeleteCommentReactionResponse) _then;

  /// Create a copy of DeleteCommentReactionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? duration = null,
    Object? reaction = null,
  }) {
    return _then(DeleteCommentReactionResponse(
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentResponse,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _self.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as FeedsReactionResponse,
    ));
  }
}

// dart format on

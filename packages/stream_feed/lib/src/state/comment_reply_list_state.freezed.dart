// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_reply_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentReplyListState {
  List<ThreadedCommentData> get replies;
  PaginationData? get pagination;

  /// Create a copy of CommentReplyListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReplyListStateCopyWith<CommentReplyListState> get copyWith =>
      _$CommentReplyListStateCopyWithImpl<CommentReplyListState>(
          this as CommentReplyListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReplyListState &&
            const DeepCollectionEquality().equals(other.replies, replies) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(replies), pagination);

  @override
  String toString() {
    return 'CommentReplyListState(replies: $replies, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $CommentReplyListStateCopyWith<$Res> {
  factory $CommentReplyListStateCopyWith(CommentReplyListState value,
          $Res Function(CommentReplyListState) _then) =
      _$CommentReplyListStateCopyWithImpl;
  @useResult
  $Res call({List<ThreadedCommentData> replies, PaginationData? pagination});
}

/// @nodoc
class _$CommentReplyListStateCopyWithImpl<$Res>
    implements $CommentReplyListStateCopyWith<$Res> {
  _$CommentReplyListStateCopyWithImpl(this._self, this._then);

  final CommentReplyListState _self;
  final $Res Function(CommentReplyListState) _then;

  /// Create a copy of CommentReplyListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replies = null,
    Object? pagination = freezed,
  }) {
    return _then(CommentReplyListState(
      replies: null == replies
          ? _self.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ThreadedCommentData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

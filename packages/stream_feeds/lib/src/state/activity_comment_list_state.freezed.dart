// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_comment_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityCommentListState {
  List<ThreadedCommentData> get comments;
  PaginationData? get pagination;

  /// Create a copy of ActivityCommentListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityCommentListStateCopyWith<ActivityCommentListState> get copyWith =>
      _$ActivityCommentListStateCopyWithImpl<ActivityCommentListState>(
          this as ActivityCommentListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityCommentListState &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(comments), pagination);

  @override
  String toString() {
    return 'ActivityCommentListState(comments: $comments, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $ActivityCommentListStateCopyWith<$Res> {
  factory $ActivityCommentListStateCopyWith(ActivityCommentListState value,
          $Res Function(ActivityCommentListState) _then) =
      _$ActivityCommentListStateCopyWithImpl;
  @useResult
  $Res call({List<ThreadedCommentData> comments, PaginationData? pagination});
}

/// @nodoc
class _$ActivityCommentListStateCopyWithImpl<$Res>
    implements $ActivityCommentListStateCopyWith<$Res> {
  _$ActivityCommentListStateCopyWithImpl(this._self, this._then);

  final ActivityCommentListState _self;
  final $Res Function(ActivityCommentListState) _then;

  /// Create a copy of ActivityCommentListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? pagination = freezed,
  }) {
    return _then(ActivityCommentListState(
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ThreadedCommentData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

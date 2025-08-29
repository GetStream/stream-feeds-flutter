// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityState {
  ActivityData? get activity;
  List<ThreadedCommentData> get comments;
  PaginationData? get commentsPagination;
  PollData? get poll;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityStateCopyWith<ActivityState> get copyWith =>
      _$ActivityStateCopyWithImpl<ActivityState>(
          this as ActivityState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityState &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.commentsPagination, commentsPagination) ||
                other.commentsPagination == commentsPagination) &&
            (identical(other.poll, poll) || other.poll == poll));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity,
      const DeepCollectionEquality().hash(comments), commentsPagination, poll);

  @override
  String toString() {
    return 'ActivityState(activity: $activity, comments: $comments, commentsPagination: $commentsPagination, poll: $poll)';
  }
}

/// @nodoc
abstract mixin class $ActivityStateCopyWith<$Res> {
  factory $ActivityStateCopyWith(
          ActivityState value, $Res Function(ActivityState) _then) =
      _$ActivityStateCopyWithImpl;
  @useResult
  $Res call(
      {ActivityData? activity,
      List<ThreadedCommentData> comments,
      PaginationData? commentsPagination,
      PollData? poll});
}

/// @nodoc
class _$ActivityStateCopyWithImpl<$Res>
    implements $ActivityStateCopyWith<$Res> {
  _$ActivityStateCopyWithImpl(this._self, this._then);

  final ActivityState _self;
  final $Res Function(ActivityState) _then;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = freezed,
    Object? comments = null,
    Object? commentsPagination = freezed,
    Object? poll = freezed,
  }) {
    return _then(ActivityState(
      activity: freezed == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityData?,
      comments: null == comments
          ? _self.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ThreadedCommentData>,
      commentsPagination: freezed == commentsPagination
          ? _self.commentsPagination
          : commentsPagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
      poll: freezed == poll
          ? _self.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollData?,
    ));
  }
}

// dart format on

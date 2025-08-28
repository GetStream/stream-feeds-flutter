// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_vote_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollVoteListState {
  List<PollVoteData> get votes;
  PaginationData? get pagination;

  /// Create a copy of PollVoteListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollVoteListStateCopyWith<PollVoteListState> get copyWith =>
      _$PollVoteListStateCopyWithImpl<PollVoteListState>(
          this as PollVoteListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollVoteListState &&
            const DeepCollectionEquality().equals(other.votes, votes) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(votes), pagination);

  @override
  String toString() {
    return 'PollVoteListState(votes: $votes, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $PollVoteListStateCopyWith<$Res> {
  factory $PollVoteListStateCopyWith(
          PollVoteListState value, $Res Function(PollVoteListState) _then) =
      _$PollVoteListStateCopyWithImpl;
  @useResult
  $Res call({List<PollVoteData> votes, PaginationData? pagination});
}

/// @nodoc
class _$PollVoteListStateCopyWithImpl<$Res>
    implements $PollVoteListStateCopyWith<$Res> {
  _$PollVoteListStateCopyWithImpl(this._self, this._then);

  final PollVoteListState _self;
  final $Res Function(PollVoteListState) _then;

  /// Create a copy of PollVoteListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? votes = null,
    Object? pagination = freezed,
  }) {
    return _then(PollVoteListState(
      votes: null == votes
          ? _self.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<PollVoteData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

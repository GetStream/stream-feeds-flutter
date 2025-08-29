// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PollListState {
  List<PollData> get polls;
  PaginationData? get pagination;

  /// Create a copy of PollListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PollListStateCopyWith<PollListState> get copyWith =>
      _$PollListStateCopyWithImpl<PollListState>(
          this as PollListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PollListState &&
            const DeepCollectionEquality().equals(other.polls, polls) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(polls), pagination);

  @override
  String toString() {
    return 'PollListState(polls: $polls, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $PollListStateCopyWith<$Res> {
  factory $PollListStateCopyWith(
          PollListState value, $Res Function(PollListState) _then) =
      _$PollListStateCopyWithImpl;
  @useResult
  $Res call({List<PollData> polls, PaginationData? pagination});
}

/// @nodoc
class _$PollListStateCopyWithImpl<$Res>
    implements $PollListStateCopyWith<$Res> {
  _$PollListStateCopyWithImpl(this._self, this._then);

  final PollListState _self;
  final $Res Function(PollListState) _then;

  /// Create a copy of PollListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polls = null,
    Object? pagination = freezed,
  }) {
    return _then(PollListState(
      polls: null == polls
          ? _self.polls
          : polls // ignore: cast_nullable_to_non_nullable
              as List<PollData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

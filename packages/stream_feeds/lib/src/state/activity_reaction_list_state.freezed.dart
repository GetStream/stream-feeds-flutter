// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_reaction_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityReactionListState {
  ActivityReactionsQuery get query;
  List<FeedsReactionData> get reactions;
  PaginationData? get pagination;

  /// Create a copy of ActivityReactionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityReactionListStateCopyWith<ActivityReactionListState> get copyWith =>
      _$ActivityReactionListStateCopyWithImpl<ActivityReactionListState>(
          this as ActivityReactionListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityReactionListState &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query,
      const DeepCollectionEquality().hash(reactions), pagination);

  @override
  String toString() {
    return 'ActivityReactionListState(query: $query, reactions: $reactions, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $ActivityReactionListStateCopyWith<$Res> {
  factory $ActivityReactionListStateCopyWith(ActivityReactionListState value,
          $Res Function(ActivityReactionListState) _then) =
      _$ActivityReactionListStateCopyWithImpl;
  @useResult
  $Res call(
      {ActivityReactionsQuery query,
      List<FeedsReactionData> reactions,
      PaginationData? pagination});
}

/// @nodoc
class _$ActivityReactionListStateCopyWithImpl<$Res>
    implements $ActivityReactionListStateCopyWith<$Res> {
  _$ActivityReactionListStateCopyWithImpl(this._self, this._then);

  final ActivityReactionListState _self;
  final $Res Function(ActivityReactionListState) _then;

  /// Create a copy of ActivityReactionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? reactions = null,
    Object? pagination = freezed,
  }) {
    return _then(ActivityReactionListState(
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as ActivityReactionsQuery,
      reactions: null == reactions
          ? _self.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<FeedsReactionData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

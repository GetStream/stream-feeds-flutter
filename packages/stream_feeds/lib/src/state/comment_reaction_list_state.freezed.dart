// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_reaction_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentReactionListState {
  List<FeedsReactionData> get reactions;
  PaginationData? get pagination;

  /// Create a copy of CommentReactionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentReactionListStateCopyWith<CommentReactionListState> get copyWith =>
      _$CommentReactionListStateCopyWithImpl<CommentReactionListState>(
          this as CommentReactionListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommentReactionListState &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(reactions), pagination);

  @override
  String toString() {
    return 'CommentReactionListState(reactions: $reactions, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $CommentReactionListStateCopyWith<$Res> {
  factory $CommentReactionListStateCopyWith(CommentReactionListState value,
          $Res Function(CommentReactionListState) _then) =
      _$CommentReactionListStateCopyWithImpl;
  @useResult
  $Res call({List<FeedsReactionData> reactions, PaginationData? pagination});
}

/// @nodoc
class _$CommentReactionListStateCopyWithImpl<$Res>
    implements $CommentReactionListStateCopyWith<$Res> {
  _$CommentReactionListStateCopyWithImpl(this._self, this._then);

  final CommentReactionListState _self;
  final $Res Function(CommentReactionListState) _then;

  /// Create a copy of CommentReactionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reactions = null,
    Object? pagination = freezed,
  }) {
    return _then(CommentReactionListState(
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

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowListState {
  List<FollowData> get follows;
  PaginationData? get pagination;

  /// Create a copy of FollowListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowListStateCopyWith<FollowListState> get copyWith =>
      _$FollowListStateCopyWithImpl<FollowListState>(
          this as FollowListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowListState &&
            const DeepCollectionEquality().equals(other.follows, follows) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(follows), pagination);

  @override
  String toString() {
    return 'FollowListState(follows: $follows, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $FollowListStateCopyWith<$Res> {
  factory $FollowListStateCopyWith(
          FollowListState value, $Res Function(FollowListState) _then) =
      _$FollowListStateCopyWithImpl;
  @useResult
  $Res call({List<FollowData> follows, PaginationData? pagination});
}

/// @nodoc
class _$FollowListStateCopyWithImpl<$Res>
    implements $FollowListStateCopyWith<$Res> {
  _$FollowListStateCopyWithImpl(this._self, this._then);

  final FollowListState _self;
  final $Res Function(FollowListState) _then;

  /// Create a copy of FollowListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? follows = null,
    Object? pagination = freezed,
  }) {
    return _then(FollowListState(
      follows: null == follows
          ? _self.follows
          : follows // ignore: cast_nullable_to_non_nullable
              as List<FollowData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

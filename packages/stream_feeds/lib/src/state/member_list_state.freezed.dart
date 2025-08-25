// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberListState {
  List<FeedMemberData> get members;
  PaginationData? get pagination;

  /// Create a copy of MemberListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberListStateCopyWith<MemberListState> get copyWith =>
      _$MemberListStateCopyWithImpl<MemberListState>(
          this as MemberListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberListState &&
            const DeepCollectionEquality().equals(other.members, members) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(members), pagination);

  @override
  String toString() {
    return 'MemberListState(members: $members, pagination: $pagination)';
  }
}

/// @nodoc
abstract mixin class $MemberListStateCopyWith<$Res> {
  factory $MemberListStateCopyWith(
          MemberListState value, $Res Function(MemberListState) _then) =
      _$MemberListStateCopyWithImpl;
  @useResult
  $Res call({List<FeedMemberData> members, PaginationData? pagination});
}

/// @nodoc
class _$MemberListStateCopyWithImpl<$Res>
    implements $MemberListStateCopyWith<$Res> {
  _$MemberListStateCopyWithImpl(this._self, this._then);

  final MemberListState _self;
  final $Res Function(MemberListState) _then;

  /// Create a copy of MemberListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? members = null,
    Object? pagination = freezed,
  }) {
    return _then(MemberListState(
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberData>,
      pagination: freezed == pagination
          ? _self.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationData?,
    ));
  }
}

// dart format on

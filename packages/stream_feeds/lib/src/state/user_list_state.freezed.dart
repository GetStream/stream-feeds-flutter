// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserListState {
  List<UserData> get users;
  int? get nextOffset;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserListStateCopyWith<UserListState> get copyWith => _$UserListStateCopyWithImpl<UserListState>(
    this as UserListState,
    _$identity,
  );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserListState &&
            const DeepCollectionEquality().equals(other.users, users) &&
            (identical(other.nextOffset, nextOffset) || other.nextOffset == nextOffset));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(users),
    nextOffset,
  );

  @override
  String toString() {
    return 'UserListState(users: $users, nextOffset: $nextOffset)';
  }
}

/// @nodoc
abstract mixin class $UserListStateCopyWith<$Res> {
  factory $UserListStateCopyWith(
    UserListState value,
    $Res Function(UserListState) _then,
  ) = _$UserListStateCopyWithImpl;
  @useResult
  $Res call({List<UserData> users, int? nextOffset});
}

/// @nodoc
class _$UserListStateCopyWithImpl<$Res> implements $UserListStateCopyWith<$Res> {
  _$UserListStateCopyWithImpl(this._self, this._then);

  final UserListState _self;
  final $Res Function(UserListState) _then;

  /// Create a copy of UserListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? users = null, Object? nextOffset = freezed}) {
    return _then(
      UserListState(
        users: null == users
            ? _self.users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<UserData>,
        nextOffset: freezed == nextOffset
            ? _self.nextOffset
            : nextOffset // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unblock_users_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnblockUsersRequest {
  String get blockedUserId;

  /// Create a copy of UnblockUsersRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnblockUsersRequestCopyWith<UnblockUsersRequest> get copyWith =>
      _$UnblockUsersRequestCopyWithImpl<UnblockUsersRequest>(
          this as UnblockUsersRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnblockUsersRequest &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockedUserId);

  @override
  String toString() {
    return 'UnblockUsersRequest(blockedUserId: $blockedUserId)';
  }
}

/// @nodoc
abstract mixin class $UnblockUsersRequestCopyWith<$Res> {
  factory $UnblockUsersRequestCopyWith(
          UnblockUsersRequest value, $Res Function(UnblockUsersRequest) _then) =
      _$UnblockUsersRequestCopyWithImpl;
  @useResult
  $Res call({String blockedUserId});
}

/// @nodoc
class _$UnblockUsersRequestCopyWithImpl<$Res>
    implements $UnblockUsersRequestCopyWith<$Res> {
  _$UnblockUsersRequestCopyWithImpl(this._self, this._then);

  final UnblockUsersRequest _self;
  final $Res Function(UnblockUsersRequest) _then;

  /// Create a copy of UnblockUsersRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockedUserId = null,
  }) {
    return _then(UnblockUsersRequest(
      blockedUserId: null == blockedUserId
          ? _self.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

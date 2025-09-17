// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egress_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EgressUser {
  String? get token;

  /// Create a copy of EgressUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EgressUserCopyWith<EgressUser> get copyWith =>
      _$EgressUserCopyWithImpl<EgressUser>(this as EgressUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EgressUser &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @override
  String toString() {
    return 'EgressUser(token: $token)';
  }
}

/// @nodoc
abstract mixin class $EgressUserCopyWith<$Res> {
  factory $EgressUserCopyWith(
          EgressUser value, $Res Function(EgressUser) _then) =
      _$EgressUserCopyWithImpl;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class _$EgressUserCopyWithImpl<$Res> implements $EgressUserCopyWith<$Res> {
  _$EgressUserCopyWithImpl(this._self, this._then);

  final EgressUser _self;
  final $Res Function(EgressUser) _then;

  /// Create a copy of EgressUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(EgressUser(
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

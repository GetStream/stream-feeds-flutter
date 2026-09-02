// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareData {
  String get activityId;
  DateTime get createdAt;
  UserData get user;

  /// Create a copy of ShareData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShareDataCopyWith<ShareData> get copyWith => _$ShareDataCopyWithImpl<ShareData>(this as ShareData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShareData &&
            (identical(other.activityId, activityId) || other.activityId == activityId) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activityId, createdAt, user);

  @override
  String toString() {
    return 'ShareData(activityId: $activityId, createdAt: $createdAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ShareDataCopyWith<$Res> {
  factory $ShareDataCopyWith(ShareData value, $Res Function(ShareData) _then) = _$ShareDataCopyWithImpl;
  @useResult
  $Res call({String activityId, DateTime createdAt, UserData user});
}

/// @nodoc
class _$ShareDataCopyWithImpl<$Res> implements $ShareDataCopyWith<$Res> {
  _$ShareDataCopyWithImpl(this._self, this._then);

  final ShareData _self;
  final $Res Function(ShareData) _then;

  /// Create a copy of ShareData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityId = null,
    Object? createdAt = null,
    Object? user = null,
  }) {
    return _then(
      ShareData(
        activityId: null == activityId
            ? _self.activityId
            : activityId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        user: null == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserData,
      ),
    );
  }
}

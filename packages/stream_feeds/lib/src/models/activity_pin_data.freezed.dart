// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_pin_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityPinData {
  ActivityData get activity;
  DateTime get createdAt;
  FeedId get fid;
  DateTime get updatedAt;
  String get userId;

  /// Create a copy of ActivityPinData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityPinDataCopyWith<ActivityPinData> get copyWith =>
      _$ActivityPinDataCopyWithImpl<ActivityPinData>(
          this as ActivityPinData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityPinData &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, activity, createdAt, fid, updatedAt, userId);

  @override
  String toString() {
    return 'ActivityPinData(activity: $activity, createdAt: $createdAt, fid: $fid, updatedAt: $updatedAt, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ActivityPinDataCopyWith<$Res> {
  factory $ActivityPinDataCopyWith(
          ActivityPinData value, $Res Function(ActivityPinData) _then) =
      _$ActivityPinDataCopyWithImpl;
  @useResult
  $Res call(
      {ActivityData activity,
      DateTime createdAt,
      FeedId fid,
      DateTime updatedAt,
      String userId});
}

/// @nodoc
class _$ActivityPinDataCopyWithImpl<$Res>
    implements $ActivityPinDataCopyWith<$Res> {
  _$ActivityPinDataCopyWithImpl(this._self, this._then);

  final ActivityPinData _self;
  final $Res Function(ActivityPinData) _then;

  /// Create a copy of ActivityPinData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? createdAt = null,
    Object? fid = null,
    Object? updatedAt = null,
    Object? userId = null,
  }) {
    return _then(ActivityPinData(
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as ActivityData,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as FeedId,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

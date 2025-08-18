// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_unpinned_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityUnpinnedEvent {
  DateTime get createdAt;
  Map<String, Object> get custom;
  String get fid;
  PinActivityResponse get pinnedActivity;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityUnpinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityUnpinnedEventCopyWith<ActivityUnpinnedEvent> get copyWith =>
      _$ActivityUnpinnedEventCopyWithImpl<ActivityUnpinnedEvent>(
          this as ActivityUnpinnedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityUnpinnedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.pinnedActivity, pinnedActivity) ||
                other.pinnedActivity == pinnedActivity) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      fid,
      pinnedActivity,
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'ActivityUnpinnedEvent(createdAt: $createdAt, custom: $custom, fid: $fid, pinnedActivity: $pinnedActivity, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityUnpinnedEventCopyWith<$Res> {
  factory $ActivityUnpinnedEventCopyWith(ActivityUnpinnedEvent value,
          $Res Function(ActivityUnpinnedEvent) _then) =
      _$ActivityUnpinnedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object> custom,
      String fid,
      PinActivityResponse pinnedActivity,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$ActivityUnpinnedEventCopyWithImpl<$Res>
    implements $ActivityUnpinnedEventCopyWith<$Res> {
  _$ActivityUnpinnedEventCopyWithImpl(this._self, this._then);

  final ActivityUnpinnedEvent _self;
  final $Res Function(ActivityUnpinnedEvent) _then;

  /// Create a copy of ActivityUnpinnedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? fid = null,
    Object? pinnedActivity = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(ActivityUnpinnedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      pinnedActivity: null == pinnedActivity
          ? _self.pinnedActivity
          : pinnedActivity // ignore: cast_nullable_to_non_nullable
              as PinActivityResponse,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponseCommonFields?,
    ));
  }
}

// dart format on

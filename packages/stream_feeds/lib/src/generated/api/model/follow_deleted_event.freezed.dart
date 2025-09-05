// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_deleted_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowDeletedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  FollowResponse get follow;
  DateTime? get receivedAt;
  String get type;

  /// Create a copy of FollowDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowDeletedEventCopyWith<FollowDeletedEvent> get copyWith =>
      _$FollowDeletedEventCopyWithImpl<FollowDeletedEvent>(
          this as FollowDeletedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowDeletedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      feedVisibility,
      fid,
      follow,
      receivedAt,
      type);

  @override
  String toString() {
    return 'FollowDeletedEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, follow: $follow, receivedAt: $receivedAt, type: $type)';
  }
}

/// @nodoc
abstract mixin class $FollowDeletedEventCopyWith<$Res> {
  factory $FollowDeletedEventCopyWith(
          FollowDeletedEvent value, $Res Function(FollowDeletedEvent) _then) =
      _$FollowDeletedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      FollowResponse follow,
      DateTime? receivedAt,
      String type});
}

/// @nodoc
class _$FollowDeletedEventCopyWithImpl<$Res>
    implements $FollowDeletedEventCopyWith<$Res> {
  _$FollowDeletedEventCopyWithImpl(this._self, this._then);

  final FollowDeletedEvent _self;
  final $Res Function(FollowDeletedEvent) _then;

  /// Create a copy of FollowDeletedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? follow = null,
    Object? receivedAt = freezed,
    Object? type = null,
  }) {
    return _then(FollowDeletedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      feedVisibility: freezed == feedVisibility
          ? _self.feedVisibility
          : feedVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      follow: null == follow
          ? _self.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as FollowResponse,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

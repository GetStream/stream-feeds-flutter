// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_group_changed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedGroupChangedEvent {
  DateTime get createdAt;
  Map<String, Object> get custom;
  FeedGroup? get feedGroup;
  String get fid;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedGroupChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedGroupChangedEventCopyWith<FeedGroupChangedEvent> get copyWith =>
      _$FeedGroupChangedEventCopyWithImpl<FeedGroupChangedEvent>(
          this as FeedGroupChangedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedGroupChangedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedGroup, feedGroup) ||
                other.feedGroup == feedGroup) &&
            (identical(other.fid, fid) || other.fid == fid) &&
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
      feedGroup,
      fid,
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'FeedGroupChangedEvent(createdAt: $createdAt, custom: $custom, feedGroup: $feedGroup, fid: $fid, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedGroupChangedEventCopyWith<$Res> {
  factory $FeedGroupChangedEventCopyWith(FeedGroupChangedEvent value,
          $Res Function(FeedGroupChangedEvent) _then) =
      _$FeedGroupChangedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object> custom,
      FeedGroup? feedGroup,
      String fid,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$FeedGroupChangedEventCopyWithImpl<$Res>
    implements $FeedGroupChangedEventCopyWith<$Res> {
  _$FeedGroupChangedEventCopyWithImpl(this._self, this._then);

  final FeedGroupChangedEvent _self;
  final $Res Function(FeedGroupChangedEvent) _then;

  /// Create a copy of FeedGroupChangedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedGroup = freezed,
    Object? fid = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(FeedGroupChangedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
      feedGroup: freezed == feedGroup
          ? _self.feedGroup
          : feedGroup // ignore: cast_nullable_to_non_nullable
              as FeedGroup?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_member_added_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedMemberAddedEvent {
  DateTime get createdAt;
  Map<String, Object> get custom;
  String get fid;
  FeedMemberResponse get member;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of FeedMemberAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedMemberAddedEventCopyWith<FeedMemberAddedEvent> get copyWith =>
      _$FeedMemberAddedEventCopyWithImpl<FeedMemberAddedEvent>(
          this as FeedMemberAddedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedMemberAddedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.member, member) || other.member == member) &&
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
      member,
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'FeedMemberAddedEvent(createdAt: $createdAt, custom: $custom, fid: $fid, member: $member, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedMemberAddedEventCopyWith<$Res> {
  factory $FeedMemberAddedEventCopyWith(FeedMemberAddedEvent value,
          $Res Function(FeedMemberAddedEvent) _then) =
      _$FeedMemberAddedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object> custom,
      String fid,
      FeedMemberResponse member,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$FeedMemberAddedEventCopyWithImpl<$Res>
    implements $FeedMemberAddedEventCopyWith<$Res> {
  _$FeedMemberAddedEventCopyWithImpl(this._self, this._then);

  final FeedMemberAddedEvent _self;
  final $Res Function(FeedMemberAddedEvent) _then;

  /// Create a copy of FeedMemberAddedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? fid = null,
    Object? member = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(FeedMemberAddedEvent(
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
      member: null == member
          ? _self.member
          : member // ignore: cast_nullable_to_non_nullable
              as FeedMemberResponse,
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

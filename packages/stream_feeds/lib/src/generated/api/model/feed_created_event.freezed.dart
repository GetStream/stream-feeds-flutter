// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_created_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedCreatedEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  FeedResponse get feed;
  String? get feedVisibility;
  String get fid;
  List<FeedMemberResponse> get members;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields get user;

  /// Create a copy of FeedCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedCreatedEventCopyWith<FeedCreatedEvent> get copyWith =>
      _$FeedCreatedEventCopyWithImpl<FeedCreatedEvent>(
          this as FeedCreatedEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedCreatedEvent &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feed, feed) || other.feed == feed) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            const DeepCollectionEquality().equals(other.members, members) &&
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
      feed,
      feedVisibility,
      fid,
      const DeepCollectionEquality().hash(members),
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'FeedCreatedEvent(createdAt: $createdAt, custom: $custom, feed: $feed, feedVisibility: $feedVisibility, fid: $fid, members: $members, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $FeedCreatedEventCopyWith<$Res> {
  factory $FeedCreatedEventCopyWith(
          FeedCreatedEvent value, $Res Function(FeedCreatedEvent) _then) =
      _$FeedCreatedEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?> custom,
      FeedResponse feed,
      String? feedVisibility,
      String fid,
      List<FeedMemberResponse> members,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields user});
}

/// @nodoc
class _$FeedCreatedEventCopyWithImpl<$Res>
    implements $FeedCreatedEventCopyWith<$Res> {
  _$FeedCreatedEventCopyWithImpl(this._self, this._then);

  final FeedCreatedEvent _self;
  final $Res Function(FeedCreatedEvent) _then;

  /// Create a copy of FeedCreatedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feed = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? members = null,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = null,
  }) {
    return _then(FeedCreatedEvent(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      custom: null == custom
          ? _self.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      feed: null == feed
          ? _self.feed
          : feed // ignore: cast_nullable_to_non_nullable
              as FeedResponse,
      feedVisibility: freezed == feedVisibility
          ? _self.feedVisibility
          : feedVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      fid: null == fid
          ? _self.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<FeedMemberResponse>,
      receivedAt: freezed == receivedAt
          ? _self.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserResponseCommonFields,
    ));
  }
}

// dart format on

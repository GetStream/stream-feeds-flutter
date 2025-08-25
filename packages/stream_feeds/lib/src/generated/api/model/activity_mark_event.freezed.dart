// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_mark_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityMarkEvent {
  DateTime get createdAt;
  Map<String, Object?> get custom;
  String? get feedVisibility;
  String get fid;
  bool? get markAllRead;
  bool? get markAllSeen;
  List<String>? get markRead;
  List<String>? get markSeen;
  List<String>? get markWatched;
  DateTime? get receivedAt;
  String get type;
  UserResponseCommonFields? get user;

  /// Create a copy of ActivityMarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ActivityMarkEventCopyWith<ActivityMarkEvent> get copyWith =>
      _$ActivityMarkEventCopyWithImpl<ActivityMarkEvent>(
          this as ActivityMarkEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActivityMarkEvent &&
            super == other &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.custom, custom) &&
            (identical(other.feedVisibility, feedVisibility) ||
                other.feedVisibility == feedVisibility) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.markAllRead, markAllRead) ||
                other.markAllRead == markAllRead) &&
            (identical(other.markAllSeen, markAllSeen) ||
                other.markAllSeen == markAllSeen) &&
            const DeepCollectionEquality().equals(other.markRead, markRead) &&
            const DeepCollectionEquality().equals(other.markSeen, markSeen) &&
            const DeepCollectionEquality()
                .equals(other.markWatched, markWatched) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      super.hashCode,
      createdAt,
      const DeepCollectionEquality().hash(custom),
      feedVisibility,
      fid,
      markAllRead,
      markAllSeen,
      const DeepCollectionEquality().hash(markRead),
      const DeepCollectionEquality().hash(markSeen),
      const DeepCollectionEquality().hash(markWatched),
      receivedAt,
      type,
      user);

  @override
  String toString() {
    return 'ActivityMarkEvent(createdAt: $createdAt, custom: $custom, feedVisibility: $feedVisibility, fid: $fid, markAllRead: $markAllRead, markAllSeen: $markAllSeen, markRead: $markRead, markSeen: $markSeen, markWatched: $markWatched, receivedAt: $receivedAt, type: $type, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ActivityMarkEventCopyWith<$Res> {
  factory $ActivityMarkEventCopyWith(
          ActivityMarkEvent value, $Res Function(ActivityMarkEvent) _then) =
      _$ActivityMarkEventCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      Map<String, Object?> custom,
      String? feedVisibility,
      String fid,
      bool? markAllRead,
      bool? markAllSeen,
      List<String>? markRead,
      List<String>? markSeen,
      List<String>? markWatched,
      DateTime? receivedAt,
      String type,
      UserResponseCommonFields? user});
}

/// @nodoc
class _$ActivityMarkEventCopyWithImpl<$Res>
    implements $ActivityMarkEventCopyWith<$Res> {
  _$ActivityMarkEventCopyWithImpl(this._self, this._then);

  final ActivityMarkEvent _self;
  final $Res Function(ActivityMarkEvent) _then;

  /// Create a copy of ActivityMarkEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? custom = null,
    Object? feedVisibility = freezed,
    Object? fid = null,
    Object? markAllRead = freezed,
    Object? markAllSeen = freezed,
    Object? markRead = freezed,
    Object? markSeen = freezed,
    Object? markWatched = freezed,
    Object? receivedAt = freezed,
    Object? type = null,
    Object? user = freezed,
  }) {
    return _then(ActivityMarkEvent(
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
      markAllRead: freezed == markAllRead
          ? _self.markAllRead
          : markAllRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      markAllSeen: freezed == markAllSeen
          ? _self.markAllSeen
          : markAllSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      markRead: freezed == markRead
          ? _self.markRead
          : markRead // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      markSeen: freezed == markSeen
          ? _self.markSeen
          : markSeen // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      markWatched: freezed == markWatched
          ? _self.markWatched
          : markWatched // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
